*Settings*
Documentation    Delete Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Delete a Equipo

    ${token}     Get token    sambora@bonjovi.com    foletto123
    ${equipo}    Get Json     equipos                violino.json

    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}                ${token}
    ${equipo_id}     Set Variable                ${result.json()}[_id]

    ${response}     DELETE Equipo        ${token}    ${equipo_id}
    ${response2}    Get Unique Equipo    ${token}    ${equipo_id}

    Status Should Be    204    ${response}
    Status Should Be    404    ${response2}


Equipo Not Found

    # ${equipo_id}        Set Variable         6131873edf36ef001602abcd
    ${equipo_id}        Get Mongo Id
    ${token}            Get Token        sambora@bonjovi.com    foletto123
    ${response}         Delete Equipo    ${token}               ${equipo_id}
    Status Should Be    204              ${response}