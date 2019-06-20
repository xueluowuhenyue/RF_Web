*** Settings ***
Resource    ../页面/前后置集.robot
Variables    ../VARS/login_data.py
Resource    ../页面/登录页面.robot
Resource    ../页面/首页.robot
Suite Setup    前后置集.打开浏览器
Test Setup    前后置集.清空登录数据
Suite Teardown    前后置集.关闭浏览器
# Force Tags    success
*** Test Cases ***        
   
用例1：不输入用户名
    登录页面.登录页面    ${login[0]['username']}    ${login[0]['password']}
    ${msg}    登录页面.登录提示    
    Should Be Equal As Strings    ${msg}    ${login[0]['except']}
    
用例2：不输入密码
    登录页面.登录页面    ${login[1]['username']}   ${login[1]['password']}
    ${msg}    登录页面.登录提示    
    Should Be Equal As Strings    ${msg}    ${login[1]['except']}
    
用例3：输入错误密码
    登录页面.登录页面    ${login[2]['username']}   ${login[2]['password']}
    ${msg}    登录页面.弹框提示    
    Should Be Equal As Strings    ${msg}    ${login[2]['except']}  
    
用例4：输入不符规则的手机号
    登录页面.登录页面    ${login[3]['username']}   ${login[3]['password']}
    ${msg}    登录页面.登录提示   
    Should Be Equal As Strings    ${msg}    ${login[3]['except']}  
    
用例5：输入未注册的手机号
    登录页面.登录页面    ${login[4]['username']}   ${login[4]['password']}
    ${msg}    登录页面.弹框提示    
    Should Be Equal As Strings    ${msg}    ${login[4]['except']} 

用例6：正确登录
    [Tags]    success
    登录页面.登录页面    ${login[5]['username']}   ${login[5]['password']}
    # ${name}    首页.获取用户名   
    # Should Be Equal As Strings    ${name}    ${login[5]['except']}  
    首页.判断页面是否包含用户名  
    
