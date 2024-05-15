*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String
Library       JSONLibrary
Library       XML


*** Variables ***


*** Test Cases ***
Test 6
    [Tags]    Demo

    ${filePath}  Set Variable       ${EXECDIR}\\TestData\\data.xml
    Log To Console    ${filePath}

    ${XML}  Parse Xml    ${filePath}
    ${Value}    Get Element    ${XML}   first_name
    Log To Console    ${Value.text}
    ${firstname}   Set Variable   ${Value.text}
    Should Be Equal    ${firstname}     Michael



