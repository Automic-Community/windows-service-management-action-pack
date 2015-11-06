*** Settings ***
Documentation     This is action level shared template
...               that will be used in SNAPSHOT_CREATE test suites.

*** Keywords ***
Config a valid application workflow
    Init Application Workflow    ${ACTION_SNAPSHOT_CREATE}

Test Service
    [Arguments]    ${serviceName}    ${returnStatus}    ${returnCode}
    #Init AE And Package
    #Init Action    ${ACTION_SNAPSHOT_CREATE}
    Config a valid application workflow
    Action Set    ${PROMPTSET_SERVICE_SERVICE_NAME}    ${serviceName}
    Common testsuites execute and assert    ${returnStatus}    ${returnCode}
