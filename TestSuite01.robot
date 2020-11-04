*** Settings ***
Metadata          Login    ${EMPTY}
Resource          UserDefineKeywords.txt

*** Variables ***
${var1}           4    # This is my first scaler variable
${var2}           4    # The other one
@{USER}           Roger    Cenas    # Variaves Lista
&{Credentials}    username=roger    password=roger    # cenas....

*** Test Cases ***
TC_01
    [Documentation]    This is my test case documention
    ...    *test case 01* \ \ _this is italic_
    ...    Link is http://www.google.pt
    Should Be Equal    ${var1}    ${var2}

TC_02
    [Tags]    LOGIN
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    ${USER}[0]    $USER}[1]
    [Teardown]    TearDownDemo

TC_03
    Should Be Equal As Strings    ${Credentials}[username]    ${Credentials}[password]

TC_04
    [Tags]    LOGIN
    Should Be True    4    4

TC_05
    [Template]    Should Be Equal As Integers    # this is a template created by me
    [Timeout]    2 minutes 20 seconds    # This is my test timeout
    4    4
    4    4
    5    5
    6    6

TC_06
    Compare2variables

*** Keywords ***
SetupDemo
    Log To Console    This is Setup

TearDownDemo
    Log To Console    This is Teardown
