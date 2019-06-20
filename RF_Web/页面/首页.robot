*** Settings ***
Library    SeleniumLibrary  
Resource    ../元素定位/首页元素.robot

*** Keywords ***
获取用户名
    Wait Until Element Is Visible    ${用户名}    30
    ${name}    Get Text    ${用户名}  
    [Return]    ${name} 

判断页面是否包含用户名
    Wait Until Element Is Visible    ${用户名}      
    ${msg}    Get Text    ${用户名} 
    Page Should Contain   ${msg}
    
选择项目
    [Documentation]    选择投标项目
    Wait Until Element Is Visible    ${项目}    30
    Click Element    ${项目}    
