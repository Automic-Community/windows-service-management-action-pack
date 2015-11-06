*** Settings ***
Documentation     This is action level shared template
...               that will be used in SNAPSHOT_CREATE test suites.

*** Key Words ***
Config a valid application workflow
    Init Application Workflow    ${ACTION_SNAPSHOT_LIVE}
    Add Custom Variable    @snapshot/snapshotType    PCK.AUTOMIC_WINDOWS_SERVICE

Test Snapshot Service Live
    [Arguments]    ${serviceName}    ${returnStatus}    ${returnCode}
    Config a valid application workflow
    Add Custom Variable    @snapshot/UC4RB_SVC_SERVICE_NAME    ${serviceName}
    Common testsuites execute and assert    ${returnStatus}    ${returnCode}
    ${archive_path}=    Action Get Variable    &UC4RB_ARCHIVE_PATH#
    ${guid}=    Action Get Variable    &UC4RB_OUT_TARGET_GUID#
    [Teardown]    Run Keyword Unless    '${archive_path}' == '${EMPTY}'    Clean Snapshot    ${archive_path}    ${guid}
