*** Settings ***
Resource    ../页面/前后置集.robot
Resource    ../页面/首页.robot
Resource    ../页面/投资页面.robot
Resource    ../页面/我的账户.robot
Variables    ../VARS/bid_data.py  
Suite Setup    前后置集.投资前置
# Test Setup    投资页面.清空输入框
Suite Teardown    前后置集.关闭浏览器
*** Test Cases ***
用例1:投资金额为零
    投资页面.投资    ${bid[0]['amount']}
    投资页面.点击投标按钮
    ${msg}    投资页面.获取提示
    Should Be Equal As Strings    ${msg}    ${bid[0]['expect']}    
 
用例2:投资金额为负
    投资页面.投资    ${bid[1]['amount']}
    投资页面.点击投标按钮
    ${msg}    投资页面.获取提示
    Should Be Equal As Strings    ${msg}    ${bid[1]['expect']}   
    
用例3:投资金额不是整百整数
    投资页面.投资    ${bid[2]['amount']}
    投资页面.点击投标按钮
    ${msg}    投资页面.获取提示
    Should Be Equal As Strings    ${msg}    ${bid[2]['expect']}   
    
用例4:投资金额大于余额
    投资页面.投资    ${bid[3]['amount']}
    投资页面.点击投标按钮
    ${msg}    投资页面.获取提示
    Should Be Equal As Strings    ${msg}    ${bid[3]['expect']}   
    
用例5:投资金额不是十的整倍数
    投资页面.投资    ${bid[4]['amount']}
    ${msg}    投资页面.输入非整十数提示
    Should Be Equal As Strings    ${msg}    ${bid[4]['expect']}   
    
用例6:正常投资
    ${money}    投资页面.投资前的金额
    投资页面.投资    ${bid[5]['amount']}
    投资页面.点击投标按钮
    ${msg}    投资页面.成功提示
    ${amount}    我的账户.获取投资后的余额
    Should Be Equal As Strings    ${msg}    ${bid[5]['expect']} 
    投资页面.判断投资金额是否正确    ${money}    ${amount}    ${bid[5]['amount']}   
