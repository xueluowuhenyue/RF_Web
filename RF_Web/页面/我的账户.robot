*** Settings ***
Library    SeleniumLibrary    
Resource    ../元素定位/我的账户元素.robot

*** Keywords ***
获取投资后的余额
    Wait Until Element Is Visible    ${余额}    
    ${amount}    Get Text    ${余额} 
    ${mo}    BuiltIn.Evaluate    int(${amount[:-1]})
    [Return]    ${mo}
    
