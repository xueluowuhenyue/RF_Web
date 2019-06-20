*** Settings ***
Library    SeleniumLibrary  
Resource    ../元素定位/登录页面元素.robot

*** Keywords ***    
登录页面
    [Arguments]    ${username}    ${password}  
    [Documentation]    username=登录名, password=密码，button=登录按钮
    Input Text    ${用户名输入框}       ${username}
    Input Text    ${密码输入框}    ${password} 
    Click Button    ${登录按钮}    
    
登录提示
    Wait Until Element Is Visible    ${登录提示}     1   
    ${msg}    Get Text    ${登录提示} 
    [Return]    ${msg}
    
弹框提示
    Wait Until Element Is Visible    ${弹窗提示}     1   
    Sleep    1    
    ${msg}    Get Text    ${弹窗提示} 
    [Return]    ${msg}
    