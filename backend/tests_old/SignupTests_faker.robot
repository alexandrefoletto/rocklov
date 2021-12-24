*Settings*
Documentation    Signup Tests

Library    FakerLibrary

Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Add New User

    #${payload}          Get Json     signup        new_user.json
    ${email}        FakerLibrary.Free Email

    &{payload}    Create Dictionary
    ...           name=Tony Stark
    ...           email=${email}
    ...           password=foletto123

    ${response}         POST User    ${payload}
    Status Should Be    200          ${response}