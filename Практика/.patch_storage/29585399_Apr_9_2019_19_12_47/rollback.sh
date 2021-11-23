#!/bin/sh
# Copyright (c) 2019, Oracle Corporation.  All rights reserved

echo This script is going to rollback the changes made to system files on
echo this Oracle Home only. It does not perform any of the following:
echo - Inventory update
echo - Oracle binary re-link
echo - Running init/pre/post scripts
echo - Customized steps performed manually by user
echo Please use this script with supervision from Oracle Technical Support.
echo To rollback a patch, please use "'opatch rollback'".
 echo NOTE: JDK should be present in the Oracle Home to rollback Java Archives.

# Get ORACLE_HOME from environment variable "ORACLE_HOME"
OH=${ORACLE_HOME}

# Error out if OH is not set
if [ "$OH" = "" ]; then
    echo Oracle Home is not set.
    echo Please set env. variable ORACLE_HOME and try again.
    echo Script failed to proceed.
    exit 1
fi

echo "About to modify Oracle Home( $OH )"
echo "Do you want to proceed? [Y/N]"
if [ "$1" = "-silent" ]; then
   response="Y"
else
    read response;
fi

if [ $response = "y" ] || [ $response = "Y" ]; then
    echo "User responded with : Y"
else
    echo "User responded with : $response"
    exit 0
fi


echo Date   Time : `date` >> $OH/cfgtoollogs/opatch/opatch_history.txt
echo Oracle Home : $OH >> $OH/cfgtoollogs/opatch/opatch_history.txt
echo Command     : rollback.sh >> $OH/cfgtoollogs/opatch/opatch_history.txt


$OH/srvm/admin/clustdb.sql
echo Rollback script completed.
