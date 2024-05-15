*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String
Library       JSONLibrary


*** Variables ***
${base_url}         https://reqres.in/
${page_path}        $.page
${id_path}          $.id

*** Test Cases ***
Test 4
    [Tags]    Demo
    Create Session    Session1     ${base_url}    disable_warnings=1
    ${endpoint}   Set Variable     api/users/2
    ${body} =     Create Dictionary    name=gangeshwargaur   job=cricketer
    ${response} =  PUT On Session    Session1     ${endpoint}     data=${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #validation
    ${status_code}         Convert To String            ${response.status_code}
    Should Be Equal         ${status_code}      200

