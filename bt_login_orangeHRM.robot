*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}           https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}      Admin 
${PASSWORD}      admin123
${WRONG_USER}    Uynhi
${WRONG_PASS}    uynhi132

*** Test Cases ***
Login Orange - Thành công
    [Documentation]    Kiểm tra đăng nhập thành công 
    #mở trình duyệt lên 
    Open Browser  ${URL}  chrome
    Wait Until Element Is Visible  xpath=//input[@name='username']
    #nhập username và password
    Input Text   xpath=//input[@name='username']   ${USERNAME}
    Input Text   xpath=//input[@name='password']   ${PASSWORD}
    Click Button  xpath=//button[@type='submit']
    Wait Until Element Is Visible  xpath=//h6[text()='Dashboard']   
    #kiểm tra đăng nhập thành công
    Page Should Contain Element    xpath=//h6[text()='Dashboard']
    Log To Console     Đăng nhập thành công
    Close Browser

Login Orange - Thất bại
    [Documentation]    Kiểm tra đăng nhập thất bại 
    #mở trình duyệt lên 
    Open Browser  ${URL}  chrome
    # Go to  ${URL}
    Maximize Browser Window
    Wait Until Element Is Visible  xpath=//input[@name='username']
    #nhập username và password
    Input Text   xpath=//input[@name='username']   ${WRONG_USER}
    Input Text   xpath=//input[@name='password']   ${WRONG_PASS}
    Click Button  xpath=//button[@type='submit']
   Wait Until Element Contains     xpath=//p[contains(@class,'oxd-alert-content-text')]    Invalid credentials  
    #kiểm tra đăng nhập thành công
    Page Should Contain Element     xpath=//p[contains(@class,'oxd-alert-content-text')]
    Log To Console    Đăng nhập thất bại
    Close Browser

