*** Settings ***
Documentation     Test JBoss create snapshot action with invalid input of App Filter Exclude.
...               Possible valid input follow Unix/Window folder name convention OR just is EMPTY value.
...               Test case will using above values.
Suite Setup       Snapshot Suite Setup
Force Tags        SNAPSHOT_LIVE    unix55    unix60    unix70    win55    win60    win70
...               #Suite Teardown    Run Keywords    Delete folder    ${AGENT_DIR}${/}snapshot    AND    Stop Server    Standalone
Test Template     Test Snapshot Service Live
Resource          ../../resources/keywords.txt
Resource          shared_template.robot

*** Test Cases ***    SERVICE NAME    RETURN STATUS    RETURN CODE
Existed service       Tomcat7         ${ENDED_OK}      0
