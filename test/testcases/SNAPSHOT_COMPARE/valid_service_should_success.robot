*** Settings ***
Documentation     Test windows service compare snapshot action with valid input
...               Possible valid input follow Unix/Window folder name convention OR just is EMPTY value.
...               Test case will using above values.
Suite Setup       Snapshot Suite Setup
Force Tags        SNAPSHOT_CREATE    win55    win60    win70
Test Template     archive_path_valid_should_success
Resource          ../../resources/keywords.txt
Resource          shared_template.robot

*** Test Cases ***    SERVICE NAME    RETURN STATUS    RETURN CODE
Normal                UC4.TestService         ${ENDED_OK}      0

*** Key Words ***
archive_path_valid_should_success
    [Arguments]    ${serviceName}    ${returnStatus}    ${returnCode}
    @{snapshot_info}=    Config a valid application workflow
    Common testsuites execute and assert    ${returnStatus}    ${returnCode}
    [Teardown]    Run Keyword Unless    '@{snapshot_info}[0]' == '${EMPTY}'    Clean Snapshot    @{snapshot_info}[0]    @{snapshot_info}[1]
