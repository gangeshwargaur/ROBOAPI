*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String
Library       JSONLibrary


*** Variables ***
${base_url}         https://reqres.in/
${page_path}        $.page

*** Test Cases ***
Test 1
    [Tags]    Demo
    Create Session    Session1     ${base_url}    disable_warnings=1
    ${endpoint}   Set Variable     api/users?page=2
    ${response}       GET On Session    Session1     ${endpoint}
    Log To Console    ${response.headers}
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}
    Log               ${response.headers}
    
    #validation
    ${status_code}         Convert To String            ${response.status_code}
    Should Be Equal         ${status_code}      200
    ${json_response}       Convert String To Json       ${response.content}
    ${contents}            Get Value From Json         ${json_response}     ${page_path}
    ${contents}            Convert To String            ${contents}
    ${contents}            Remove String Using Regexp   ${contents}      ['\\[\\],]
    Should Be Equal        ${contents}      2

    ${headerValue}    Get From Dictionary       ${response.headers}     Content-Type
    Should Be Equal    ${headerValue}        application/json; charset=utf-8

    ${ServerValue}    Get From Dictionary       ${response.headers}     Server
    Should Be Equal    ${ServerValue}           cloudflare


