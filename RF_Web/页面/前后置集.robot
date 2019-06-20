*** Settings ***
Library    SeleniumLibrary    
Resource    ../元素定位/首页元素.robot
Resource    登录页面.robot
Resource    首页.robot
Resource    投资页面.robot
# Variables    ../VARS/login_data.py
*** Variables ***
&{login_success}    username=18684720553    password=python

*** Keywords ***
打开浏览器
    Open Browser   http://120.78.128.25:8765/Index/login.html   chrome  


关闭浏览器
    Close Browser
    
清空登录数据
    Clear Element Text    ${用户名输入框}
    Clear Element Text    ${密码输入框}
    
投资前置
    打开浏览器
    登录页面    ${login_success['username']}    ${login_success['password']}
    首页.选择项目
    投资页面.清空输入框