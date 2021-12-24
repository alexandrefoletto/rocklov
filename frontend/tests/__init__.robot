*Settings*
Documentation    Seeds

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup    Create Users

*Keywords*
Create Users

    ${file}     Get file    ${EXECDIR}/resources/fixtures/users-seeds.json
    ${users}    Evaluate    json.loads($file)                                 json

    FOR                  ${user}    IN    @{users}
        Remove User By Email    ${user}[email]
        POST User Service    ${user}
    END