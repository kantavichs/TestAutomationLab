*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      Chrome
${USERNAME}     Admin
${PASSWORD}     admin123

*** Test Cases ***
Valid Login Case
    [Documentation]    ทดสอบการ Login ด้วยรหัสที่ถูกต้อง
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    name=username    10s
    Input Text      name=username    ${USERNAME}
    Input Text      name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    # ตรวจสอบว่าเข้าระบบสำเร็จ (เจอคำว่า Dashboard)
    Wait Until Page Contains    Dashboard    10s
    Close Browser

Invalid Login Case
    [Documentation]    ทดสอบการ Login ด้วยรหัสที่ผิด
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    name=username    10s
    Input Text      name=username    Admin
    Input Text      name=password    WrongPassword123
    Click Button    xpath=//button[@type='submit']
    # ตรวจสอบว่าระบบแจ้งเตือน Error (Invalid credentials)
    Wait Until Page Contains    Invalid credentials    5s
    Close Browser