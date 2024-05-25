#!/bin/bash
###############################################
RUNSTEP=/pipeline/src/run_step.sh $STATUS
###############################################
set -e
STATUS=$1
PARAMS=$2

# Enter your pipeline steps below
# Syntax: $RUNSTEP $STATUS <DESCRIPTION> <COMMAND>
$RUNSTEP $STATUS "Check Connection" "/src/check.sh"
$RUNSTEP $STATUS "Dump DB" "/src/dump.sh"