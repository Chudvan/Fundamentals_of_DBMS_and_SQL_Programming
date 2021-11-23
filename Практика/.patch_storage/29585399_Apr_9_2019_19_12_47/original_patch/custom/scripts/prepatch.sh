#!/bin/sh
# Copyright (c) 2004, 2015, Oracle and/or its affiliates. All rights reserved.
#
# prepatch.sh
#    Script run as part of the Oracle Home patch procedure. This script is:
#
#    1) invoked as a the Oracle Home user (non-root)
#    2) harvests configuration values specified by the user
#       at install time
#    3) saves the values in $ORACLE_HOME/install/params.ora
#       in a specific format to be later consumed by postpatch.sh.
#
#    This script must search for the values of several values.
#
#    Usage:
#          prepatch.sh [-dbhome <ORACLE_HOME>] 
#              -dbhome    The Oracle home must be supplied as an argument
#
#    MODIFIED   (MM/DD/YY)
#       gnagiah  05/20/15 - Bug 19791201, remove racgwrap because of bug
#                           12816580
#       gnagiah  02/25/14 - Bug 18229842 fix permission issues for Lib files


# Utility executable names
ECHO="/bin/echo"
CHMOD="/bin/chmod"
HEAD="/bin/head"
AWK="/bin/awk"
GREP="/bin/grep"
SED="/bin/sed"
CAT="/bin/cat"
UNAME="/bin/uname"
RM="/bin/rm"
RMF="$RM -f"
LS="/bin/ls"

LEXT=so

UNAME=/bin/uname
PLATFORM=`$UNAME`

case $PLATFORM in
Linux)
  HEAD="/usr/bin/head"
  ID=/etc/init.d
  ;;
HP-UX)
  HEAD="/bin/head"
  ARCH=`$UNAME -m`
  if [ $ARCH != "ia64" ]; then
     LEXT=sl
  fi
  ID=/sbin/init.d
  ;;
SunOS)
  HEAD="/bin/head"
  ID=/etc/init.d
  ;;
AIX)
  HEAD="/bin/head"
  LEXT=a
  ID=/etc
  ;;
OSF1)
  HEAD="/bin/head"
  ID=/sbin/init.d
  ;;
Darwin)
  HEAD="/usr/bin/head"
  ;;
*)
  /bin/echo "ERROR: Unknown Operating System"
  exit -1
  ;;
esac

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

## Function for adding write permission to the owner for all of
## the scripts in the Oracle Home.
ALL_SCRIPTS="bin/srvctl bin/srvconfig bin/cluvfy"

ALL_DBEXES="bin/racgmain bin/racgeut bin/diskmon.bin bin/lsnodes bin/osdbagrp bin/rawutl srvm/admin/ractrans srvm/admin/getcrshome bin/gnsd bin/crsdiag.pl"

ALL_DBLIBS="lib/libhasgen11.$LEXT lib/libttsh11.$LEXT lib32/libttsh11.$LEXT lib32/libdbcfg11.$LEXT lib32/libhasgen11.$LEXT lib32/libocr11.$LEXT lib32/libocrb11.$LEXT lib32/libocrutl11.$LEXT lib32/libsrvm11.$LEXT lib32/libsrvmhas11.$LEXT lib32/libsrvmocr11.$LEXT lib32/libuini11.$LEXT lib/libclsra11.$LEXT lib/libdbcfg11.$LEXT lib/libocr11.$LEXT lib/libocrb11.$LEXT lib/libocrutl11.$LEXT lib/libuini11.$LEXT lib/librdjni11.$LEXT lib/libgns11.$LEXT lib/libgnsjni11.$LEXT lib/libagfw11.$LEXT"

addperms()
{
  for file in $ALL_SCRIPTS
  do
    if [ -f "$OH/$file" ]; then
      $CHMOD 755 $OH/$file
    fi
  done
}

addperms2()
{
  for file in $ALL_DBEXES
  do
    if [ -f "$OH/$file" ]; then
      $CHMOD 755 $OH/$file
    fi
  done
}

addperms3()
{
  for file in $ALL_DBLIBS
  do
    if [ -f "$OH/$file" ]; then
      $CHMOD 755 $OH/$file
    fi
  done
}

if [ -z "$OH" ]; then 
   OH=$ORACLE_HOME
fi

parseArgs $*

if [ -z "$OH" ]; then
  $ECHO "ORACLE_HOME environment variable should be set or -dbhome should be specified."
  usage;
  exit 1;
fi

# remove any trailing slash from Oracle Home
OH=`echo $OH | sed 's;/$;;'`

if [ ! -d "$OH" ]; then
  $ECHO "Oracle Home directory \"$OH\" not found."
  exit 1;
fi

RACGWRAP=$OH/bin/racgwrap
PARAMFILE=$OH/install/params.ora
SRVCTL=$OH/bin/srvctl

addperms
addperms2
## Opatch places the libs with proper permissions set. No need to alter here.
## addperms3

##
## Set defaults for this script for the values we are searching for.
##
ORACLE_HOME=
ORACLE_BASE=

##
## Evaluate the necessary parameters.
##
NEED_HOME=true
NEED_BASE=

if [ -f "$RACGWRAP" ]; then
  NEED_BASE=true
fi


##
## Search for the values of the instantiated variables.
##
if [ ! -z "$NEED_HOME" ]; then
  ORACLE_HOME=$OH
  if [ -z "$ORACLE_HOME" ]; then
    $ECHO "Unable to determine value for ORACLE_HOME. Ignoring..."
  fi
fi
if [ ! -z "$NEED_BASE" ]; then
  if [ -f "$RACGWRAP" ]; then
    ORACLE_BASE=`$GREP '^ORACLE_BASE' $RACGWRAP |$SED 's/.*=//' |$SED 's/.*[%$].*//g'`
  fi
  if [ -z "$ORACLE_BASE" ]; then
    $ECHO "Unable to determine value for ORACLE_BASE. Ignoring..."
  fi
fi

##
## Now that we have values for all of the values, then place them into
## the stored parameter file.
##
$RMF $PARAMFILE

$ECHO ORACLE_HOME=$ORACLE_HOME                 >> $PARAMFILE
$ECHO ORACLE_BASE=$ORACLE_BASE                 >> $PARAMFILE
$ECHO s_OracleHome=$ORACLE_HOME                >> $PARAMFILE

$ECHO "$0 completed successfully."
exit 0;
