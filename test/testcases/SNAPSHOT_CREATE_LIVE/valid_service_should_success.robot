*** Settings ***
Documentation     Test Service create live snapshot action with valid input of App Filter Exclude.
...               Possible valid input follow Unix/Window folder name convention OR just is EMPTY value.
...               Test case will using above values.
Suite Setup       Snapshot Suite Setup
Force Tags        SNAPSHOT_LIVE    win55    win60    win70
Test Template     Test Snapshot Service Live
Resource          ../../resources/keywords.txt
Resource          shared_template.robot

*** Test Cases ***    SERVICE NAME    RETURN STATUS    RETURN CODE
Existed service       Tomcat7         ${ENDED_OK}      0
