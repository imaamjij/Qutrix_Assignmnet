*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

Suite Setup    Open Qutrix Home Page
Suite Teardown    Close All Browsers

*** Variables ***
${HOME_URL}           https://qutrix.io
${JOBS_URL}           https://qutrix.io/job-openings/
${SELF_ASSESSMENT}    https://qutrix.io/self-assessment/
${SCREENSHOT_DIR}     ${CURDIR}${/}..${/}artifacts
${SCREENSHOT_FILE}    ${SCREENSHOT_DIR}${/}qutrix_self_assessment.png

*** Test Cases ***
Open Qutrix Self Assessment Page
    Open Career Entry
    Open Self Assessment Link
    Page Should Contain    Qutrixians Self-Assessment Process
    Create Directory    ${SCREENSHOT_DIR}
    Capture Page Screenshot    ${SCREENSHOT_FILE}

*** Keywords ***
Open Qutrix Home Page
    Open Browser    ${HOME_URL}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10 seconds
    Wait Until Page Contains    Qutrix, Your Ideal Solution Partner With In-House SaaS Offerings

Open Career Entry
    Run Keyword And Ignore Error    Click Element    xpath=(//a[normalize-space()='Company'])[1]
    Run Keyword And Ignore Error    Mouse Over    xpath=(//a[normalize-space()='Company'])[1]
    Wait Until Page Contains Element    xpath=//a[contains(@href,'/job-openings/')]
    Click Element    xpath=(//a[contains(@href,'/job-openings/') and (normalize-space()='Explore Career' or normalize-space()='Career Launchpad')])[1]
    Wait Until Page Contains    Jobs

Open Self Assessment Link
    Go To    ${JOBS_URL}
    Wait Until Page Contains Element    xpath=//a[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'click here')]
    Scroll Element Into View    xpath=//a[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'click here')]
    Click Element    xpath=//a[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'click here')]
    Go To    ${SELF_ASSESSMENT}
    Wait Until Page Contains    Qutrixians Self-Assessment Process    20 seconds
