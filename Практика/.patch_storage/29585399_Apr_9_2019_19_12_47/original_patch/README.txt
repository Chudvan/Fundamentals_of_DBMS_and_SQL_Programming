# 
#-------------------------------------------------------------------------
#  BUNDLE Patch for Base Bug 29585399
#-------------------------------------------------------------------------
#
#  DATE: 19:6:39 Apr 9 2019
#  -------------------------------
#  Platform Patch for : Linux x86-64 (226)
#  Product Version #  : 19.0.0.0.0
#  Product Patched    : CRS/RDBMS
# 
#-------------------------------------------------------------------------
#
#  WARNING: Failure to carefully read and understand these requirements may
#  result in your applying a patch that can cause  your Oracle Server to
#  malfunction, including interruption of service and/or loss of data. 
# 
#  If you do not meet all of the following requirements, please log an
#  iTAR, so that an Oracle Support Analyst may review your situation. The
#  Oracle analyst will help you determine if this patch is suitable for you
#  to apply to your system. We recommend that you avoid applying any
#  temporary patch unless directed by an Oracle Support Analyst who has
#  reviewed your system and determined that it is applicable. 
# 
#  Requirements: 
# 
#    - You must have located this patch via a Bug Database entry
#      and have the exact symptoms described in the bug entry. 
# 
#    - Your system configuration (Oracle Server version and patch
#      level, OS Version) must exactly match those in the bug
#      database entry - You must have NO OTHER PATCHES installed on
#      your Oracle Server since the latest patch set (or base release
#      x.y.z if you have no patch sets installed).
# 
#      Refer to the following link for details on Perl and OPatch:
#      http://metalink.oracle.com/metalink/plsql/
#           ml2_documents.showDocument?p_database_id=NOT&p_id=189489.1
# 
#  If you do NOT meet these requirements, or are not certain that you meet
#  these requirements, please log an iTAR requesting assistance with this
#  patch and Support will make a determination about whether you should
#  apply this patch. 
#
#  Bugs fixed by this bundle
#  =========================
#
#  CRS HOME
#  ========
#
#27222128 RHPS START FAILS IF RHPC CONNECTION FAILS
#27572040 LONG PDB OPEN TIMES WHEN DATA GUARD ROLE TRANSITION OCCURS
#27604329 WS2012_181_UD(11204-&gt;181)  AFTER RESTORE,RELOCATE RACONE DB FAILED,ORA-01078
#27760043 QOSCTL RETURNS INVALID SYNTAX FOR HISTORICAL DATA OUTPUT
#27877830 CRS 12.2 DOESN'T BRING ACFS RESOURCES UP AFTER INTERCONNECT INTERRUPTION
#28302580 LNX-191-UD DOWNGRADE HISTORY ATTRIBUTE AND VALUE DIDN'T MATCH
#28470673 LNX-191-GH PATCHING 12201 GI FROM SOURCEHOME TO DESTWC FAILED WITH PRGO-1472
#28621543 LNX-191-GI  CRSCTL START CLUSTERWARE -ALL REPORTS CRS-4690
#28642469 SRVCTL MODIFY DATABASE  -DISKGROUP &lt;DISKGROUPLIST&gt; LEADS TO JVM CRASH
#28699321 LNX-191-ZIP NODE REBOOT WHEN RUN 'ROOT -TRANSPARENT' WITH ASM_NETWORK NOT FOUND IF DB HOME ON ACFS
#28710663 LNX-191-CONV  ORAROOTAGENT COREDUMP DURING RUNNING ROOT.SH ON THE 1ST NODE
#28755846 FLEX  CRSD COREDUMP AT CLS_PE3  PLACEMENTINSTRUCTION  GETRESOURCEINSTANCE
#28772816 W2012_191_CRS AGENT ABORT WHEN CHECKING SCAN VIP
#28785321 LNX-191-SECURITY  PROBLEMATIC WORLD-WRITABLE FILES DIRS OF RAC ENV  CRSDATA AND CVU DIR
#28800508 LNX-191-ASM  NONE ANY ASM PROCESSES WAS RUNNING, BUT ASM WAS STILL REPORTED AS RUNNING
#28808652 Fix for Bug 28808652
#28815557 LNX-192-MSG  THE SYNTAX OF 3 NEW COMMANDS IS IN-ACCURATE  OPTIONAL '[...]' SHOULD BE CHANGED TO MANDATORY '{...}'
#28847541 LNX-191_RF  UNABLE TO START READER FARM DATABASE
#28847572 LNX-192-CRSCTL  UNMATCHED LEFT BRACKET '{' IN THE SYNTAX OF 'CRSCTL RESTART CLUSTER -HELP'
#28870496 LNX-19C-UD 11204 UPGRADE FAILED AT SECOND NODE DUE TO FAIL TO SHUTDOWN DATABASE
#28871040 LNX-192-GH SHOULDN'T CHANGE OH ATTRIBUTE IF RWOH-ROOH DB PATCHING IS FORBIDDEN
#28874416 ORAIPSECSETUP NEES EXECUTE PERMISSION
#28877252 AIX-184-GH  RERUN PROV A RAC DB HOME TO 11204 CLUSTER SHOULD NOT EXE DETACHHOME
#28881191 LNX-191-GH 121 TO 122 TLS ZDU FAIL W  PRGO-2350 EVEN THOUGH PASSWD FILE EXISTS ON ASM DG
#28881848 LNX-191_RF  UNABLE TO START READER FARM SERVICE BY 'SRVCTL START SERVICE -DB MYCDB'
#28888083 LNX-19.1-ROOH FAILED TO START LISTENER ON ROOH
#28911140 LNX-191-GH ACTIVE DUPLICATE 12102 SNAP DB FOR ZDU FAIL W  RMAN-05100 DUE TO WRONG RMAN CONNECT STRING
#28925250 RHP  RHP_SOURCEPATH=NULL FOR STANDALONE DB UPGRADE
#28925460 FLEX  GNS IS UP, STUCK AT INTERMEDIATE, CHECK SAYS CHECKTYPE   3 SETTING STATUS TO 'PARTIAL'
#28935956 LNX-192-CRS  RE-RUN 'CRSCTL STOP CLUSTER -N REMOTE_CRS_NODE' WOULD JUST HANG FOREVER
#28940472 LNX-192-CRS  LOCAL CRSD.BIN PROCESS COREDUMP 
#28942694 RHPCTL MOVE DATABASE WITH -PDBPARALLEL OPTION SHOULD NOT CLOSE ALL THE PDBS INSTANCE WHILE APPLYING SQL PATCH
#28951332 RAC  AC  SRVCTL CREATE AC SERVICE WITH FAILOVER TYPE 'AUTO' AND USER DEFINED SESSION STATE
#28963036 WS2012_192_UD(11204-&gt;192) 'SRVCTL UPGRADE MODEL' FAILED ON LAST NODE IN NON-ROLLING UPGRADE
#28968779 PL19.2PORTSPECEFIC HAS AIX GIPC ERRORS IN MULTINODE LRGS WHEN OH IS OVER NFS
#28980448 CLSRSC-180  AN ERROR OCCURRED WHILE EXECUTING THE COMMAND ' ADE AIME1_ADC00VNM19 ORACLE BIN CHACTL QUERY MODEL'
#28995287 LNX-191-GH START RHPSERVER REPORT ERRORS NOT CLEAR IN LOCAL MODE
#29003207 LNX-185-RHP UPGRADE 122 RHPC TO 185 FAILED TO UPDATE INVENTORY,PRGH-1026
#29003617 LNX-191-ZIP  RHPCTL SHOULD BLOCK TGIP IF DEST AND SOURCE GI HOMES ARE WITH SAME PATCH LEVEL
#29016294 LNX-192-UD ROOTUPGRADE.SH RERUN HIT PRCR-1086 ERR ORA.RHPSERVER ALREADY REGISTERED
#29018680 ADD FUNCTIONALITY TO START STOP THE JMX SERVER
#29024876 CRSD TERMINATES ABNORMALLY, AGENT TO RESTART CRSD
#29026154 DERBY.JAR NOT FOUND UNDER OHOME JDK
#29027933 LNX-192-GH PROV ACTIVE 19.2 GI ON SPARC NODES HIT PRCF-2035 COPY OPERATION FAILED
#29047127 PROVIDE JAVA WRAPPER API FOR CLSUISRDSMODAVAILABLE()
#29052850 19.2 18.3-&gt;19.2 UPGRADE   CHACTL CONFIG' DIED AT ORACHM.PM LINE 1112.
#29058476 LSNRAGENT ISSUING MULTIPLE SERVICE_UPDATE
#29111631 LNX-191-GH -TDEKEYSTOREPASSWD AND -TDEMASTERKEY DO NOT WORK
#29112455 LNX-191-ZIP WATCHDOG PROCESS RUN FROM CRS HOME INSTEAD OF GI BASE
#29117337 LNX-192-GIMR  MGMTCA CREATEGIMRCONTAINER FAILED TO FETCH MGMTDB DATAFILE LOCATION WHEN ASSIGNED DISKGROUP
#29123444 LNX-192-CONV  HIT 'CRS-1078  MESSAGE 1078 NOT FOUND' IN CRSD AGENT LOG WHEN UPGRADING 183 DB TO 192
#29125708 LNX-192-GH HIT AN INTERNAL ERROR WHEN ADD RHPCLIENT W  -TARGETNODE -ROOT OPTION
#29125786 LNX-191-ZIP  HIGH CPU USAGE OF ORACSSWD PROCESS
#29129476 ASMCMDUTIL.GETCLIENTCLUSTERINFO() THROWS EXCEPTION CMDTOOLUTILEXCEPTION WHILE PARSING LIST OF CLUSTERS.
#29131772 THE NEW 18.3 GRID INSTALL SELECT AN HAIP USED BY AN EXISTING 11.2 CLUSTER
#29132456 LNX-191-ZIP HIT FAILED TO ENABLE CRS ERROR WHEN RUN ROOTCRS.SH -UPDATEOSFILES
#29139727 RHP  REGISTER WORKINGCOPY INVOKERHPC CALL FOR 121 TARGET WC AND IS FAILING
#29146157 REPEATED ORA-01002 LOGGED IN CRSD_ORAAGENT_ORACLE.TRC
#29147849 LNX-192-GH AFTER UPGRADE GI FROM 11204 TO 192, ADD DATABASE TO 11204 DB HOME FAILED W  PRGO-1480
#29149170 LNX-191-CHM  CHM FAILED TO CONNECT GIMR AFTER RECREATE MGMTDB
#29152603 LNX-192-ASM  SRVCTL CANN'T GET CLIENTS CONNECTED TO 19.2 ASM IF WITH 11204 DB INSTANCES
#29152752 WS2012_192  INCORRECT LOGIC IN CHECK_SUPERUSER AND S_CHECK_SUPERUSER
#29154631 LNX-192-GH UPGRADE GI FROM FAILED W  BATCHES WHEN ESTABLISH SSH CONNECTION DUE TO EXTRA SPACE IN NODENAME
#29154636 LNX-20C-UD AFTER UPG FROM 19,NO DATA FOUND FOR OCLUMON DUMPNODEVIEW
#29154829 LNX-192-CVU  HIT ARRAYINDEXOUTOFBOUNDSEXCEPTION ERRORS IN ORA.CVU'S PERIODIC CHECKING TRACE LOGS
#29159216 WS2012_192_ASMRG 'SRVCTL CONFIG ASMNETWORK' HIT PRKZ-1085 WITH IPV6 ADDRESS IF NETMASK IS EMPTY
#29159661 LNX-192-GH RERUN DELETE ACTIVE GI WC ONLY DELETE METADATA ON RHPS
#29160462 WS2012_192_ASMRG SRVCTL SHOULD GIVE CLEAR ERROR MESSAGE IF START ASMNETWORK FAIL
#29161923 ROOTUPGRADE FAILED WITH 'CRS-8503 [MEMCHR()+27] [SIGNAL EXCEPTION  11] [INSTRUCTION ADDR  0X7F9B8B27A41B] [MEMORY ADDR  (NIL)]'
#29169540 SECURITY ISSUE   SIHA SETUP. ROOT SCRIPT CALLS NON-ROOT SCRIPT
#29169739 LNX64-19.3-CRS  HIT CRS-8503 [CRFJSON_FORMAT_SUMMARY()+1552] [SIGNAL EXCEPTION  11]
#29170717 INITIALIZATION OF VARIABLES FAILS WITH DUPLICATED ENTRY IN FILE VARIABLES.XML ERROR
#29173618 HAIP IS DISABLED AFTER AN ADDNODE OPERATION EVEN WITH THE FIX 26791882
#29181568 UPGRADE GI HOME PRE-CHECKS FAILED WITH PRGO-1069   INTERNAL ERROR
#29182920 LNX-192-GH RHPCTL COLLECT OSCONFIG HIT PRCT-1014 INTERNAL ERR COPYCLIENTIMPL
#29183298 UNABLE TO START RHPCLIENT WITH 18.4
#29186091 FLEX  ORAAGENT COREDUMP AT SGIPCWWAITHELPER
#29191827 LNX-192-GH ADD DATABASE TO 12102 SUCCEED W  WARNINGS BUT REPORT FAILED AND OUTPUT TWICE
#29201143 LNX-191-GH ADD CHECK TO VALIDATE SOURCE AND TARGET NODE HAVE SAME TIME
#29201695 ACFS RESOURCE FAILED TO START
#29209545 MULTICAST CHECK FAILS WITH NPE IF EXECTASK RETURNS EMPTY OUTPUT
#29210577 Fix for Bug 29210577
#29210610 Fix for Bug 29210610
#29210624 Fix for Bug 29210624
#29210683 Fix for Bug 29210683
#29213641 Fix for Bug 29213641
#29219627 LNX-192-GH PATCHING 192 SIDB ON 192 SIHA FAILED WHEN TRY TO OPERATE RHPCLIENT WHICH IS NOT EXISTED
#29224294 LNX-193-ASM NO ERROR MESSAGE REPORT WHEN SRVCTL START ASMNETWORK -NETNUM FOLLOW WITH INCORRECT NETNUM
#29225861 LNX-193-UD  INCORRECT ACTION DETAILS OF PRVG-4574 TO PUT ASM PW FILE ON AN ASM DG
#29229839 ACFS FILESYSTEM MOUNTING PERMISSIONS OWNER GROUP ARE LOST AFTER RESTART
#29235934 FIX CV_DESTLOC IN RHP_INSTALL
#29242906 SOLSP64-193-CVU CVU REPORTS WARNING PRVG-5821 WHEN PRE-CHECK GNS
#29243749 CANNOT MODIFY ONS WALLET THROUGH 'SRVCTL MODIFY NODEAPPS -CLIENTDATA' ON WINDOWS CLUSTER
#29244495 RHPS  RETRY ATTEMPT OF A FAILED RHP MOVE UPGRADE NONE OF THE POST  UA GETS EXECUTED
#29244766 SOLSP-19C-INST  CVU WRONGLY REPORT ERROR PRVE-0438 WHEN CHECKING SOLARIS SRU ON SUPER CLUSTER NODES
#29244968 GIPC SHOULD REGISTER FOR GPNP PROFILE UPDATE EVENTS
#29248723 FLEX  ORAROOTAGENT COREDUMP AT CLSN_AGENT  GETORACLEHOMEATTRIB, CLEANUPOLDACFSLOGS
#29249583 AIX-193-RAC FAIL TO START PDB SERVICE WITH ERROR OCI EXCP 44316 ORA-44316  INVALID ARGUMENT
#29251564 LNX-19C-CVU CVU CANNOT DETECT MULTICAST DISABLED
#29255616 RHP - ADD WC SKIPCOPY OPTION STILL DOES A DIRECT TRANSFER FOR BITS
#29260224 RHP - RHPCTL -SKIPCOPY REQUIRES -GROUPS WITH GI WORKING COPY
#29261695 DIAGNOSTIC PRINTS TOO VERBOSE, MAY EXPOSE SENSITIVE IPMI PASSWORD INFORMATION
#29271019 ZDM  UNABLE TO USE NFS BASED BACKUP PATH
#29273360 NEED TO PUT THE REASON FOR THE CSSD FAILURE IN THE CLUSTER ALERT.LOG
#29282090 LNX-193-GH RHPCTL ADD DATABASE USING TEMPLATE W  RELATIVE PATH DOES NOT WORK
#29282666 LNX-19C-UD UPGRADE DRY RUN HUNG AT SRVCTL UPGRADE MODEL WHIH 7 DBS AND 1K SERVICES CONFIGURED
#29285453 XAG COMPONENT IN HAS FOR BUILDPATCH
#29285621 BACKPORT FOR RTI 21823463  - UPGRADE ISSUE
#29290235 NODE-2 FAILED TO JOIN CLUSTER IN UNICAST MODE
#29292232 RHP - GI UPGRADE FAILS WITH [FATAL] [INS-10101] THE GIVEN RESPONSE FILE XXXX IS NOT FOUND
#29293806 LNX-19C-GH STILL HIT PRGT-1017 AFTER UPDATE PATCH LEVEL ON TARGET DB
#29294753 LNX_193_UD  MGMTCA QUERYREPOS HIT MGTCA-1101 SQL OPERATION FAILURE AFTER UPGRADED
#29299830 DB SOFTWARE HOME PROV FAILS WITH A PATH HAVING ';' INJECTION ATTACK
#29307090 EXADATA - CVU READS NPROC FROM BACKUP FOR  ETC SECURITY LIMITS.D 90-NPROC.CONF
#29307109 EXADATA - CVU FLAGS MINOR KERNEL DIFFERENCES BETWEEN NODES AS A WARNING
#29311336 ASM HANG DUE TO VOTING FILE RELOCATION DURING CELL ROLLING UPGRADE
#29329675 19.2 SPRAC  11204 CRS UPGRADE T 19.2 FAILS DURING ROOTUPGRADE.SH ON REMOTE NODE WITH '-NOAUTOSTART' IS AN INVALID ARGUMENT
#29330791 PERMISSIONS OF FEW FILES UNDER GIHOME BIN NEEDS UPDATE
#29339299 RHPHELPER FAILS TO DRAIN SESSIONS WHEN A DB_UNIQUE_NAME IS BEING USED
#29357821 REMOVE DEPENDENCY ON PERL MODULE WIN32API  FILE
#29360467 LNX_193_UD  MGMTUA FAILED TO GET CORRECT GIMR STORAGE PATH
#29360775 LNX-19C-UD UPGRADE DRY RUN REPORT PRCR-1006 FAILED TO ADD RES ASMNET1LSNR_ASM WHEN UPG FROM 11204
#29367971 LNX-193-GH RERUN UPGRADE 12102 TO 193 W  -CONTINUE FAILED WHEN UPGRADE IN BATCHES
#29368725 LNX-19C-UD 12102 UPG FAILE AT SRVCTL UPGRADE MODEL IN DRY RUN
#29379299 HAIP SUBNET FLIPS UPON BOTH LINK DOWN UP EVENT
#29379381 MOVING ASM TO SECOND INTERFACE - MOVES IN FIRST NODE AND NOT THE OTHER
#29380527 EXA-191-UD UPGRADE FAILED SINCE ORA.RHPSERVER HAS HARD DEPENDENCY WITH MGMTDB
#29381000 LNX-201-INST  ROOT.SH FAILED ON 1ST NODE  HIT CLSRSC-107  START OF GNS FAILED
#29382296 LNX-191-GH DB UD FAILED AT PRE UA BECAUSE OF COPYLISTENER PICKING RANDOM PORT WHEN ENABLE FIREWALL
#29391301 ENABLE UNICAST MODE ONLY USNG ENV VAR AND NOT CLOUD TYPE
#29393649 3PLT UPDATE - NEED TO REVISE 3RD PARTY IN RHP
#29402110 LNX-191-GH RHP DB UD FAILED AT PRE UA WHEN ENABLE FIREWALL
#29411931 CHANGE TRACE FILE AND OLFSROOT PERMISSIONS
#29413360 EXA-193-UD UPGRADE DRYRUN FAILED SINCE ORA.RHPSERVER HAS HARD DEPENDENCY WITH MGMTDB
#29457319 LNX64-193 ROOT.SH RETURN CLSRSC-571 AND PRKC-1191 WHEN ADD NODE TO MC
#29465047 LNX-19C-UD 11204 UPG HUNG AT SRVCLT UPGRADE MODEL FOR MORE THAN 10HOURS AND FAILED AT LAST
#
#
#  RDBMS_HOME
#  ==========
#  
#  13852018 DB12; NEED TEST PATCH FOR DB12 FROM SE FOR EVERY CANDIDATE DB LABEL
#
#
#  NOTE: A non-clustered RDBMs HOME runing the CSSD and ASM may also benefit
#  from a number of the CRS HOME patches.
# 
#
#  Known Issues:
#  =============
#  N/A
#
#  Patch Installation Instructions:
#  --------------------------------
#  Make sure all instances running under the ORACLE_HOME being patched
#  are cleanly shutdown before installing this patch. Also ensure that
#  the tool used to terminate the instance(s) has exited cleanly.
#
#  Ensure that the directory containing the opatch script appears in
#  your $PATH. Execute "which opatch" to confirm.
#
#  CRS_HOME   = the full path to the crs home.
#  RDBMS_HOME = the full path to the server home.
#
#  If the owner of these homes are different ensure you execute the 
#  following steps as the correct owner in the correct environment.
#
#  Configuration A:   With a shared CRS Home, a full cluster outage must 
#  be planned. The patch will update the shared copy of the binaries, 
#  and no daemons can be online while the binaries are modified.
#
#  Configuration B:   When each node of the cluster has its own CRS Home, 
#  the patch should be applied as a rolling upgrade. All of the following 
#  steps should be followed for each node. Do not patch two nodes at once.
#
###########################################################################
#
#  1. Verify that the Oracle Inventory is properly configured.
#
#  % opatch lsinventory -detail -oh <CRS_HOME>
#  % opatch lsinventory -detail -oh <RDBMS_HOME>
#
#  This should list the components the list of nodes.
#
#  If the Oracle inventory is not setup correctly this utility will
#  fail. 
#
#
###########################################################################
#
#  2. Unzip the PSE container file
#
#  % unzip p29585399_19000_LINUX.X64.zip
#
###########################################################################
#
# 3.1 In configuration A, shut down the CRS managed resources running from DB
# home
#     on all nodes before shutting down the CRS daemons on 
#     all nodes. Note that these steps must be run in the order specified.
#
#     3.1.1  Stop the CRS managed resources running from DB homes using 
#
#       % <RDBMS_HOME>/bin/srvctl stop home -o <RDBMS_HOME> -s <status file
#       location> -n <node_name>#
#      note the status file is created by the process 
#
#  3.2 In configuration B, shut down the CRS managed resources running from DB
#  home 
#      followed by CRS daemons on the local node. 
#
#     3.2.1  Stop the CRS managed resources running from DB homes using 
#
#       % <RDBMS_HOME>/bin/srvctl stop home -o <RDBMS_HOME> -s <status file
#       location> -n <node_name>#
#      note the status file is created by the process 
#
###########################################################################
#
#  4.  Prior to applying this part of the fix, you must invoke this script
#  as root to unlock protected files.
#  
#  # <CRS_HOME>/crs/install/rootcrs.pl -unlock 
#
#  Note: In configuration A, invoke this only on one node.
#
#
###########################################################################
#
#  5. Save the RDBMS home configuration settings
#
#  ( Please review section 6.2 first ) As the RDBMS software owner;
#  % custom/server/29585399/custom/scripts/prepatch.sh -dbhome <RDBMS_HOME>
#
###########################################################################
#
#  6. Patch the Files
#
#    6.1 Patch the CRS home files
#
#    After unlocking any protected files and saving configuration settings
#    you are now ready to run opatch using the following command.
#
#    As the Oracle Clusterware (CRS) software owner,
#    from the directory where the patch was unzipped;
#
#    % opatch napply -local -oh <CRS_HOME> -id 29585399
#
#    Note: In configuration A, invoke this only on one node.
#
#
#    6.2 Patch the RDBMS home files.
#
#    Note: The RDBMS portion can only be applied to an RDBMS home that
#          has been upgraded to *11.2.0.1.0*.
#
#    For additional information please read Note.363254.1;
#    Applying one-off Oracle Clusterware patches in a mixed version home
#    environment
#
#    As the RDBMS software owner,
#    from the directory where the patch was unzipped;
#
#    % opatch napply custom/server/ -local -oh <RDBMS_HOME> -id 29585399
#
#    Note: In configuration A, invoke this only on one node.
#
###########################################################################
#
#  7. Configure the HOME
#   
#    7.1 Configure the RDBMS HOME
# 
#    After opatch completes, some configuration settings need to be applied
#    to the patched files. As the RDBMS software owner execute the following; 
#
#    % custom/server/29585399/custom/scripts/postpatch.sh -dbhome <RDBMS_HOME>
#
#    Note: In configuration A, invoke this only on one node.
#
###########################################################################
#
#  8. Now security settings need to be restored on the CRS Home. This script
#  will also restart the CRS daemons. Invoke this script as root.
#
#  # <CRS_HOME>/crs/install/rootcrs.pl -patch 
#
#  # <DB_HOME>/bin/srvctl start home -o <DB_HOME> -s <status file location> -n
#  <node name> 
#
#  Note: This script should only be invoked as part of the patch process.
#
#  Note: In configuration A, invoke this on each node. Do not invoke this
#        in parallel on two nodes.
###########################################################################
#
#  9. On success you can determine whether the patch has been installed by
#  using the following command;
#
#  % opatch lsinventory -detail -oh <CRS_HOME>
#  % opatch lsinventory -detail -oh <RDBMS_HOME>
#
###########################################################################
#
#  Additional Special Notes:
#  -------------------------
#  If there are multiple Server Homes in your configuration, then
#  in step 5.2, 6.2, 7.1 run the commmands for each home before continuing.
#
#  If you later install an additional Server home, or if you skip a
#  server home, then applying the patch to additional homes is easier.
#  1. Shut down all instances using that Server home
#  2. Apply the patch to that Server home as described in step 5.2, 6.2, 7.1
#  3. Restart the instances in that Server home
#  This can be done while CRS is active.
#
#
###########################################################################
#
# Special Instruction for AIX
# ---------------------------
# 
# During the application of this patch should you see any errors with regards   
# to files being locked or opatch  being  unable to copy files then this  
# 
# could be as result of a process which requires termination or an additional  
# 
# file needing to be unloaded from the system cache.
#  
# 
# To try and identify the likely cause please execute the following  commands  
# 
# and provide the output to your support representative, who will be  able to  
# 
# identify the corrective steps.
# 
# 
#     genld -l | grep <CRS_HOME>
# 
#     genkld | grep <CRS_HOME>    ( full or partial path will do )
# 
# 
# Simple Case Resolution:
# 
# If genld returns data then a currently executing process has something open
# in
# the <CRS_HOME> directory, please terminate the process as
# required/recommended.
# 
# 
#  If genkld return data then please remove the enteries from the
#  OS system cache by using the slibclean command as root;
#  
# 
#     slibclean
#
###########################################################################
#
#  Patch Deinstallation Instructions:
#  ----------------------------------
#
#  To roll back the patch, follow all of the above steps 1-5. In step 6,
#  invoke the following opatch commands to roll back the patch in all homes.
#
#  % opatch rollback -id 29585399 -local -oh <CRS_HOME>
#
#  % opatch rollback -id 29585399 -local -oh <RDBMS_HOME>
#
#  Afterwards, continue with steps 7-9 to complete the procedure.
#
###########################################################################
#
#  If you have any problems installing this PSE or are not sure
#  about inventory setup please call Oracle support.
#
###########################################################################
