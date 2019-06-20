*** Settings ***
Library    SeleniumLibrary    
Resource    ../元素定位/投资页面元素.robot

*** Keywords ***
投资
    [Arguments]    ${投资金额}
    Wait Until Element Is Visible    ${输入框}
    ${投资输入框}    Get WebElement    ${输入框}
    Input Text    ${投资输入框}    ${投资金额}
      
投资前的金额
    Wait Until Element Is Visible    ${输入框}
    ${余额}    Get Element Attribute    ${输入框}    data-amount
    ${amount}    Evaluate    int(${余额})    
    [Return]    ${amount}

输入非整十数提示
    Wait Until Element Is Visible    ${非整十数}
    ${msg}    Get Text    ${非整十数}
    [Return]    ${msg}    
    
获取提示
    点击投标按钮
    Wait Until Element Is Visible    ${失败}    30
    ${msg}    Get Text    ${失败}
    点击确定按钮
    [Return]    ${msg}
    

点击投标按钮
    Click Element    ${投标}    
    
点击确定按钮
    Click Element    ${确认}
    
清空输入框
    Clear Element Text    ${输入框}
    
成功提示
    Wait Until Element Is Visible    ${成功}    30
    ${msg}    Get Text    ${成功}
    [Return]    ${msg}
    点击查看并激活
    
点击查看并激活
    Click Element    ${激活}   
   
判断投资金额是否正确
    [Arguments]    ${投资前的金额}    ${投资后 的余额}    ${投资金额}
    ${data}    Evaluate    ${投资后的余额}+${投资金额}   
    Should Be Equal As Integers    ${data}    ${投资前的金额} 
        