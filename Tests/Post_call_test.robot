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
Test 2
    [Tags]    Demo
    Create Session    Session1     ${base_url}    disable_warnings=1
    ${endpoint}   Set Variable     api/users
    ${body} =     Create Dictionary    name=gangeshwar   job=QA tester
    ${response} =  POST On Session    Session1     ${endpoint}     data=${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #validation
    ${status_code}         Convert To String            ${response.status_code}
    Should Be Equal         ${status_code}      201
    ${json_response}       Convert String To Json       ${response.content}
    ${contents}            Get Value From Json         ${json_response}     ${id_path}
    Should Not Be Empty    ${contents}
