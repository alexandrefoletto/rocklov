*Settings*
Documentation    Remove Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Run Keywords    Login Session              jimmi.hendrix@hotmail.com    foletto123
...              AND             Set Token Suite From LS
Test Teardown    Finish Test

# *Variables*
# ${EMAIL}    jimi.hendrix@hotmail.com
# ${PASS}     foletto123


*Test Cases*

Remove Equipo
    [Tags]                 rm_equipo
    # Dado que saxofone é um equipamento indesejado
    ${equipo}              Get Equipo         saxofone
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}          ${TOKEN}
    Reload

    # Quando solicito a remoção desse equipo
    Request Removal    ${equipo}[name]

    # E confirmo a exclusão
    Confirm Removal

    # Então esse equipo não deve ser exibido na lista
    Equipo Not Should Be Visible    ${equipo}[name]

Removal Give Up
    [Tags]    rm_equipo

    # Dado que conga é um equipamento indesejado
    ${equipo}              Get Equipo         conga
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}          ${TOKEN}
    Reload

    # Quando solicito a remoção desse equipo
    Request Removal    ${equipo}[name]

    # Mas eu desisto da ação de remoção
    Cancel Removal

    # Então o equipamento deve permanecer na lista
    Equipo Should Be Visible    ${equipo}[name]
