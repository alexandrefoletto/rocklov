*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*

User Login

    LoginActions.Login With                  rogers@shield.com             foletto123
    LoginActions.User Should Be Logged In
    [Teardown]                               Take Screenshot And Logout


Incorrect Password
    [Tags]    attempt_login

    LoginActions.Login With              rogers@shield.com                teste123
    Components.Alert Text Should Be    Usuário e/ou senha inválidos.


User Not Found
    [Tags]    attempt_login

    LoginActions.Login With              hulk@avengers.com                teste123
    Components.Alert Text Should Be    Usuário e/ou senha inválidos.


Empty Email
    [Tags]    attempt_login

    LoginActions.Login With              ${EMPTY}                          teste123
    Components.Alert Text Should Be    Oops. Informe um email válido!


Empty Password
    [Tags]    attempt_login

    LoginActions.Login With              rogers@shield.com                   ${EMPTY}
    Components.Alert Text Should Be    Oops. Informe sua senha secreta!


Incorrect Email
    [Tags]    attempt_login

    LoginActions.Login With              rogers&shield.com                 foletto123
    Components.Alert Text Should Be    Oops. Informe um email válido!


