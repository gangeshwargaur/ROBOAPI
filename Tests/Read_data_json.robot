*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String
Library       JSONLibrary
Library       XML
Library    OperatingSystem


*** Variables ***


*** Test Cases ***
Test 7
    [Tags]    Demo

    ${filePath}  Set Variable       ${EXECDIR}\\TestData\\data.json
    Log To Console    ${filePath}

    ${json_obj}   Get File    ${filePath}
    ${Valueof}    Evaluate   json.loads('''${json_obj}''')    json
    Log To Console     ${Valueof["first_name"]}
    ${first_name}   Set Variable   ${Valueof["first_name"]}
    Should Be Equal    ${firstname}     Michael



