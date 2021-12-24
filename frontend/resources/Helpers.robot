*Settings*
Documentation    Aqui teremos as KeyWords(KW) de ajuda

Library    OperatingSystem

*Keywords*
Get Equipo
    [Arguments]    ${equipo}

    ${fixture}    Get File    ${EXECDIR}/resources/fixtures/equipos.json
    ${json}       Evaluate    json.loads($fixture)                                   json

    ${select_equipo}        Set Variable        ${json}[${equipo}]

    [Return]    ${select_equipo}

Get Token From LS

    ${token}    LocalStorage Get Item       user_token

    [Return]    ${token}

Set Token From LS

    ${TOKEN}    LocalStorage Get Item       user_token

    Set Test Variable       ${TOKEN}

Set Token Suite From LS

    ${TOKEN}        LocalStorage Get Item   user_token

    Set Suite Variable      ${TOKEN}