*** Settings ***
Documentation     Test windows service compare snapshot action with invalid input
...               Possible invalid input follow Unix/Window folder name convention OR just is EMPTY value.
...               Test case will using above values.
Suite Setup       Snapshot Suite Setup
Force Tags        SNAPSHOT_CREATE    win55    win60    win70
Test Template     archive_path_invalid_should_fail
Resource          ../../resources/keywords.txt
Resource          shared_template.robot

*** Test Cases ***    SERVICE NAME    GUID        RETURN STATUS      RETURN CODE
Archive path not correct
                      Tomcat7         abcd1234    ${ENDED_NOT_OK}    1

*** Key Words ***
archive_path_invalid_should_fail
    [Arguments]    ${serviceName}    ${guid}    ${returnStatus}    ${returnCode}
    @{snapshot_info}=    Config a valid application workflow
    Add Custom Variable    @snapshot/guid    ${guid}
    Common testsuites execute and assert    ${returnStatus}    ${returnCode}
    [Teardown]    Run Keyword Unless    '@{snapshot_info}[0]' == '${EMPTY}'    Clean Snapshot    @{snapshot_info}[0]    @{snapshot_info}[1]
