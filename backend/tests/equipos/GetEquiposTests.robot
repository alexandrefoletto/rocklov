*Settings*
Documentation    Get Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Get Unique

    # Dado que eu tenho um equipo cadastrado
    ${token}     Get token    sambora@bonjovi.com    foletto123
    ${equipo}    Get Json     equipos                piano.json

    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}                ${token}
    ${equipo_id}     Set Variable                ${result.json()}[_id]

    # Quando faço uma requisição GET para a rota equipos
    ${response}    Get Unique Equipo    ${token}    ${equipo_id}

    # Então o código de status deve ser 200
    Status Should Be    200    ${response}

    Should Be Equal    ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal    ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal    ${equipo}[payload][price]       ${response.json()}[price]


Equipo Not Found

    # ${equipo_id}        Set Variable         6131873edf36ef001602abcd
    ${equipo_id}        Get Mongo Id
    ${token}            Get Token            sambora@bonjovi.com    foletto123
    ${response}         Get Unique Equipo    ${token}               ${equipo_id}
    Status Should Be    404                  ${response}

Get Equipo List

    ${token}    Get Token    axl.rose@guns.com    foletto123

    ${list}    Get Json    equipos    list.json
    # Log     ${list}

    FOR     ${item}     IN   @{list}
        Remove Equipo       ${item}[payload][name]
        POST Equipo         ${item}     ${token}
    END

    ${response}         Get Equipos    ${token}
    Status Should Be    200            ${response}

    ${total}          Get Length      ${response.json()}
    Should Be True    ${total} > 0