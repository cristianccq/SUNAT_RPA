*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${SUNAT PAGE}      http://www.sunat.gob.pe/cl-ti-itmrconsruc/FrameCriterioBusquedaCelular.jsp


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${SUNAT PAGE}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be    Consulta RUC

Input ruc
    [Arguments]    ${username}
    Input Text    name:search1    ${username}

Input Codigo
    [Arguments]    ${captcha}
    Input Text    name:codigo    ${captcha}

Submit
    Click Button     class:form-button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

write_variable_in_file
  [Arguments]  ${variable}
  Create File  file_with_variable.txt  ${variable}