*Settings*
Documentation       Arquivo principal do projeto de automação

Library     Browser
Library     Collections
Library     libs/mongo.py
Library     OperatingSystem

Resource    Helpers.robot
Resource    Services.robot
Resource    actions/Components.robot
Resource    actions/LoginActions.robot
Resource    actions/EquipoActions.robot

Resource    pages/LoginPage.robot
Resource    pages/DashPage.robot


*Keywords*
Start Session
    # New Browser     firefox    False
    New Browser     chromium    False       slowMo=00:00:03
    # New Page        https://rocklov-foletto-web.herokuapp.com/
    New Page        about:blank
    Set Viewport Size       1920    1080

    Go To       https://rocklov-foletto-web.herokuapp.com/

Finish Test
    Take Screenshot


Take Screenshot And Logout
    Take Screenshot
    Do Logout

Finish Session
    Take Screenshot

Take Screenshot And Go Back
    Take Screenshot
    Go Back

Login Session
    [Arguments]     ${email}     ${password}

    Start Session
    LoginActions.Login With  ${email}  ${password}

