*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String
Library       JSONLibrary


*** Variables ***
${base_url}         https://jsonplaceholder.typicode.com/


*** Test Cases ***
Test 3
    [Tags]    Demo
    Create Session    Session1     ${base_url}    disable_warnings=1
    ${endpoint}   Set Variable     posts/1
    ${response} =  Delete On Session    Session1     ${endpoint}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #validation
    ${status_code}         Convert To String            ${response.status_code}
    Should Be Equal         ${status_code}      200
