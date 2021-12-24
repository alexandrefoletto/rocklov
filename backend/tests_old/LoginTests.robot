***Settings***
Documentation    Sessions route tests

Resource    ${EXECDIR}/resources/Base.robot

* Test Cases *

User Login

    ${payload}    Get Json    user_login.json


    ${response}         POST Login    ${payload}
    Status Should Be    200           ${response}
    #Log             ${response.json()}[user_token]

    ${token}            Set Variable    ${response.json()}[user_token]
    Length Should Be    ${token}        24                                

Incorrect password
    [Template]      Attempt Login
    incorrect_pass.json     401     Unauthorized
    

User Not Found
    [Template]      Attempt Login
    user_not_found.json     401     Unauthorized

Wrong Email
    [Template]      Attempt Login
    wrong_email.json        412     wrong email

Empty Email         
    [Template]      Attempt Login
    empty_email.json        412     required email

Empty Password
    [Template]      Attempt Login
    empty_pass.json         412     required password

Whitout Email
    [Template]      Attempt Login
    without_email.json      412     required email

Whithout Password
    [Template]      Attempt Login
    without_pass.json       412     required password

*Keywords*
Attempt Login
    [Arguments]     ${json_file}      ${status_code}      ${message}

    ${payload}          Get Json            ${json_file}
    ${response}         POST Login          ${payload}
    Status Should Be    ${status_code}      ${response}

    Should Be Equal    ${message}    ${response.json()}[error]