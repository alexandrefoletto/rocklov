* Settings *
Documentation    Implementação da Rota / equipos

Library    OperatingSystem

*Keywords*
POST Equipo
    [Arguments]    ${equipo}    ${token}

    &{headers}    Create Dictionary    user_token=${token}

    ${bin_image}    Get Binary File    ${EXECDIR}/resources/fixtures/equipos/thumbnails/${equipo}[thumb]
    &{thumbnail}    Create Dictionary    thumbnail=${bin_image}

    ${response}    POST
    ...            ${base_url}/equipos
    ...            data=${equipo}[payload]
    ...            headers=${headers}
    ...            files=${thumbnail}
    ...            expected_status=any

    [Return]    ${response}

Get Unique Equipo
    [Arguments]     ${token}        ${equipo_id}

    &{headers}    Create Dictionary    user_token=${token}

    ${response}     GET
    ...             ${base_url}/equipos/${equipo_id}
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}

Get Equipos
    [Arguments]     ${token}

    &{headers}    Create Dictionary    user_token=${token}

    ${response}     GET
    ...             ${base_url}/equipos
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}

Delete Equipo
    [Arguments]     ${token}        ${equipo_id}

    &{headers}    Create Dictionary    user_token=${token}

    ${response}     DELETE
    ...             ${base_url}/equipos/${equipo_id}
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}



