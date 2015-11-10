*** Settings ***
Documentation     This is action level shared template
...               that will be used in SNAPSHOT_CREATE test suites.

*** Keywords ***
Config a valid application workflow
    @{snapshot_info}=    Create Test Snapshot
    Init Application Workflow    ${ACTION_SNAPSHOT_COMPARE}
    Add Custom Variable    @snapshot/variables/archivepath    @{snapshot_info}[0]
    Add Custom Variable    @snapshot/guid    @{snapshot_info}[1]
    Add Custom Variable    @snapshot/reportId    123456
    Add Custom Variable    @snapshot/snapshotType    PCK.AUTOMIC_WINDOWS_SERVICE
    [Return]    @{snapshot_info}
