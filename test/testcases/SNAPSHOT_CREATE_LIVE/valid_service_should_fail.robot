*** Settings ***
Documentation     Test windows service create live snapshot action with valid input
...               Possible invalid input follow Unix/Window folder name convention OR just is EMPTY value.
...               Test case will using above values.
Suite Setup       Snapshot Suite Setup
Force Tags        SNAPSHOT_CREATE    win55    win60    win70
Test Template     Test Snapshot Service Live
Resource          ../../resources/keywords.txt
Resource          shared_template.robot

*** Test Cases ***    SERVICE NAME    RETURN STATUS         RETURN CODE
Special Character     T$#m$c%a#^7     ${ENDED_JP_CANCEL}    0

Non Existed           Empty           ${ENDED_JP_CANCEL}    0
