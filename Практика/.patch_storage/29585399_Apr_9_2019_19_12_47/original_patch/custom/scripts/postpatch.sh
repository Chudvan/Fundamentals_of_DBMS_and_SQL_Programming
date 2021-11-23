#!/bin/sh
#
# postpatch.sh for parsing RAC script files
#
#    This is run to parse the Installer specific variables in RAC scripts
#    that are to be patched with the values supplied by the user during
#    RAC installation.
#
#    This should be used for parsing any script that has regular expressions of
#    form %<installer-variable>%
#
#    MODIFIED   (MM/DD/YY)
#       papatel  08/21/18 - Fix bug 28408915
#       gnagiah  09/27/16 - instantiate files from sbs folder
#       apfwkr   05/23/15 - Backport papatel_fix_kfod_path from main
#       gnagiah  05/20/15 - Bug 19791201, remove racgwrap because of bug
#                           12816580
#       papatel  05/15/15 - Bug 19682778 - kfod path related
#       gnagiah  02/25/14 - Bug 18229842 fix permission issues for Lib files
#       rdasari  11/07/13 - add a success mesg
#       ksviswan 06/11/09 - Update File list for 11.2
#       jcreight 03/18/09 - Fix bug 8337092
#       jcreight 08/31/11 - XbranchMerge jcreight_bug-8337092 from main
#       jcreight 10/25/07 - XbranchMerge jcreight_skgxn_nochmod from
#                           st_has_10.2
#       jcreight 10/24/07 - XbranchMerge jcreight_bug-6158424 from st_has_11.1
#       jcreight 10/24/07 - Fix 6158424: add rawutl
#       jcreight 10/23/07 - don't chmod libxkgxn...it shouldn't be patched
#                           anyway.
#       jcreight 10/23/07 - don't chmod libskgxn...it should not be patched
#                           anyway
#       jtellez  07/10/07 - add rawutl to dbexes
#       jtellez  03/14/07 - Modified history tag added
#

CP=/bin/cp
MV=/bin/mv
CHOWN=/bin/chown
CHGRP=/bin/chgrp
CHMOD=/bin/chmod
ECHO=/bin/echo
RM=/bin/rm
RMF="/bin/rm -f"
CAT=/bin/cat
GREP=/bin/grep
AWK=/bin/awk
SED=/bin/sed
UNAME="/bin/uname"
NULL='/dev/null'
EXPRN='/usr/bin/expr'
SH='/bin/sh'
FILE='/usr/bin/file'
BNAME='/bin/basename'


LEXT=so
ARCH=""

PLATFORM=`$UNAME`

case $PLATFORM in
Linux)
  HEAD="/usr/bin/head"
  ;;
HP-UX)
  HEAD="/bin/head"
  ARCH=`$UNAME -m`
  if [ $ARCH != "ia64" ]; then
     LEXT=sl
  fi
  ;;
SunOS)
  HEAD="/bin/head"
  ;;
AIX)
  HEAD="/bin/head"
  LEXT=a
  ;;
OSF1)
  HEAD="/bin/head"
  ;;
Darwin)
  HEAD="/usr/bin/head"
  ;;
*)
  /bin/echo "ERROR: Unknown Operating System"
  exit -1
  ;;
esac

##This lists all the RAC scripts that we use today in production environment
#If there is any new RAC script added for Oracle Home then update this
ALL_SCRIPTS="bin/srvctl bin/srvconfig bin/cluvfy bin/kfod"

ALL_DBEXES="bin/racgmain bin/racgeut bin/diskmon.bin bin/lsnodes bin/osdbagrp bin/rawutl srvm/admin/ractrans srvm/admin/getcrshome bin/gnsd bin/crsdiag.pl"

ALL_DBLIBS="lib/libhasgen11.$LEXT lib/libttsh11.$LEXT lib32/libttsh11.$LEXT lib32/libdbcfg11.$LEXT lib32/libhasgen11.$LEXT lib32/libocr11.$LEXT lib32/libocrb11.$LEXT lib32/libocrutl11.$LEXT lib32/libsrvm11.$LEXT lib32/libsrvmhas11.$LEXT lib32/libsrvmocr11.$LEXT lib32/libuini11.$LEXT lib/libclsra11.$LEXT lib/libdbcfg11.$LEXT lib/libocr11.$LEXT lib/libocrb11.$LEXT lib/libocrutl11.$LEXT lib/libuini11.$LEXT lib/librdjni11.$LEXT lib/libgns11.$LEXT lib/libgnsjni11.$LEXT lib/libagfw11.$LEXT"

###Function for displaying usage of this script
usage()
{
   printf "Usage:\n"
   printf "$0 [-dbhome <Oracle home>]\n"
}

##Function for parsing the command line arguments
parseArgs()
{
   USER_ARGS=$*

   if [ $# -eq 2 ]; then
      if [ $1 = "-dbhome" ]; then
         OH=$2;
      else
         usage;
         exit 2
      fi
   elif [ $# -gt 0 ]; then
      usage;
      exit 2
   fi

}

##Function for verifying RAC parameter settings in the given param file
verifyparamfile()
{
  ret=0;
  $ECHO "Reading $ORA_ENV_FILE.."
  ## Make sure that this input file has only "LHS=RHS" and empty lines
  ## Any other lines will be considered improper input for root script
  awkOutput=`$AWK 'BEGIN { Ni=0 } \
                     /^#.*/   { next } \
                     /[a-zA-Z0-9_]*\=\`*\`/ { printf("\"%s\"\n", $0); next } \
                     /[a-zA-Z0-9_]*\=/ { next } \
                     /^$/   { next } \
                            { printf("\"%s\"\n", $0); next }' $ORA_ENV_FILE`

  if [ "x$awkOutput" != "x" ]; then
     $ECHO "The following unexpected input found in RAC parameter file: $awkOutput"
     ret=1;
  fi

  return $ret;
}

##Function for verifying RAC parameter settings in the given param file
getparamfile()
{
  ret=0;
  $ECHO "Reading $ORA_ENV_FILE.."
  ## Make sure that this input file has only "LHS=RHS" and empty lines
  ## Any other lines will be considered improper input for root script
  $AWK 'BEGIN { Ni=0 } \
       /[a-zA-Z0-9_]*\=/ { print; next } \
       /^$/   { next } \
       /^#.*/   { next } \
              { next }' $ORA_ENV_FILE > $ORA_ENV_FILE.$$

  fileContents=`$CAT $ORA_ENV_FILE.$$`
  if [ "x$fileContents" = "x" ]; then
     $ECHO "Failed to generate a temp paramfile for use"
     ret=1;
  fi

  return $ret;
}

validateScriptFile()
{
  for i in $ORA_SCRIPT_FILE;
  do
     i=$OH/$i
     $ECHO "Verifying file $i"

     if [ -f "$i" ]; then
       ## Make sure that the file is really script file.
       $SH -n $i > $NULL 2>&1
       STATUS1=$?
       LC_ALL=C $FILE $i | $GREP -wi "text" > $NULL 2>&1
       STATUS2=$?
       if [ "$STATUS1" != "0" ] && [ "$STATUS2" != "0" ]; then
         $ECHO "Skipping non-text file $i"
       else
         ## Make sure that RAC script file has been parsed to replace all the
         ##Installer variables. If there are some Installer variables that aren't
         ##replaced then it means the parameter files does not have values
         ##set for all of them
         awkOutput=`$AWK '
                         /^$/   { next } \
                         /^#/   { next } \
                         /^UNIQUEDATE/ { next } \
                         /%[a-zA-Z0-9_-]*%/ {
                            len=length();
                            str=$0;
                            grpind=index(str, "%");
                            substr1=substr(str, grpind+1, len);
                            grpind2=index(substr1, "%");
                            installstr=substr(str, grpind+1, grpind2-1);
                            printf("%s\n", installstr);
                            next } \
                          { next }' $i`

         if [ "x$awkOutput" != "x" ]; then
            $ECHO "The following RAC variable values are not found to parse the file: $awkOutput"
            $ECHO "Set the values for these variables in '$ORA_ENV_FILE' and rerun this script"
         fi
       fi
     else
       $ECHO "Skipping the missing file $i"
     fi
  done
}


resetPerms()
{
  for i in $ORA_SCRIPT_FILE;
  do
     if [ -f "$OH/$i" ]; then
       $ECHO "Reapplying file permissions on $OH/$i"
       $CHMOD +x $OH/$i
     fi
  done
}

resetPerms2()
{
  for i in $ALL_DBEXES
  do
     if [ -f "$OH/$i" ]; then
       $ECHO "Reapplying file permissions on $OH/$i"
       $CHMOD +x $OH/$i
     fi
  done
}

resetPerms3()
{
  for i in $ALL_DBLIBS
  do
     if [ -f "$OH/$i" ]; then
       $ECHO "Reapplying file permissions on $OH/$i"
       $CHMOD +x $OH/$i
     fi
  done
}

if [ -z "$OH" ]; then
   OH=$ORACLE_HOME
fi

parseArgs $*

if [ -z "$OH" ];
then
    $ECHO "ORACLE_HOME environment variable should be set or -dbhome should be specified."
    usage;
    exit 1;
fi

if [ ! -d "$OH" ]; then
  $ECHO "Oracle Home directory \"$OH\" not found."
  exit 1;
fi

ORA_ENV_FILE=$OH/install/params.ora
ORA_SCRIPT_FILE=$ALL_SCRIPTS

verifyparamfile || { $ECHO $?; exit 1; }
getparamfile || { $ECHO $?; exit 1; }

for i in $ORA_SCRIPT_FILE;
do

  SCRIPT_FILE=$OH/$i

  BASENAME=`$BNAME $SCRIPT_FILE`
  SBSNAME="$OH/crs/sbs/$BASENAME.sbs"

  if [ -f $SBSNAME ]; then
    $ECHO "Found uninstantiated $SBSNAME file, copying to $SCRIPT_FILE"
    $CP $SBSNAME $SCRIPT_FILE
  fi

  if [ -f $SCRIPT_FILE ];
  then
    ## Make sure that the file is really script file.
    $SH -n $SCRIPT_FILE > $NULL 2>&1
    STATUS1=$?
    LC_ALL=C $FILE $SCRIPT_FILE | $GREP -wi "text" > $NULL 2>&1
    STATUS2=$?
    if [ "$STATUS1" != "0" ] && [ "$STATUS2" != "0" ]; then
      $ECHO "Skipping non-text file $SCRIPT_FILE"
      continue
    fi

    $ECHO "Parsing file $SCRIPT_FILE"
    $CP $SCRIPT_FILE $SCRIPT_FILE.$$
    for line in `$CAT $ORA_ENV_FILE.$$`;
    do
	    varName=`$ECHO $line | $AWK -F"=" '{ print $1 }'`
	    varValue=`$ECHO $line | $AWK -F"=" '{ print $2 }'`
	    varValue=`$ECHO "$varValue" | $SED -e 's|\/|\\\/|g'`

      $CAT $SCRIPT_FILE.$$ | $SED -e s/%$varName%/$varValue/g > /tmp/$$
      $RMF $SCRIPT_FILE.$$
      $CP /tmp/$$ $SCRIPT_FILE.$$
    done

    $RMF /tmp/$$

    if [ -s $SCRIPT_FILE.$$ ];
    then
      $RMF $SCRIPT_FILE
      $CP $SCRIPT_FILE.$$ $SCRIPT_FILE
    else
	    $ECHO "Failed to parse the file $SCRIPT_FILE"
      $RMF $SCRIPT_FILE.$$
      exit 1
    fi
    $RMF $SCRIPT_FILE.$$;
  fi
done

$RMF $ORA_ENV_FILE.$$
	
validateScriptFile

resetPerms

resetPerms2

## resetPerms3

$ECHO "Postpatch completed successfully"

exit 0
