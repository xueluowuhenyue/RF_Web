*** Variables ***
${用户名输入框}    //input[@name='phone']
${密码输入框}    xpath=//input[@name='password']
${登录按钮}    //button[text()='登录']
${登录提示}    xpath://div[contains(@class,'error-info')]
${弹窗提示}    //div[contains(@class,'layer-content')]