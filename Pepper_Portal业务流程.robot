*** Settings ***
Resource          Pepper_Portal基础关键字.robot
Variables         config.py
Library           Utils.py    WITH NAME    utils

*** Keywords ***
正常登录
    打开浏览器    ${WEB_LOGIN}
    输入用户名    ${CS_NAME}
    输入密码    ${CS_PWD}
    点击登录

自动切换hari视频
    正常登录
    去除媒体安全提示
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=pepper
    Sleep    15
    验证有视频

截图
    Capture page Screenshot

Hari内容发送
    Sleep    3
    输入框    美女看过来啦
    Sleep    3
    发送
    Sleep    3
    Page Should Contain    美女看过来啦

Hari输入问题发送
    Sleep    3
    输入问题    自动化测试
    Sleep    3
    utils.click_coordinate    928    940
    Sleep    3    等待输入完毕
    发送
    Sleep    5
    Page Should Contain    达闼最帅的人

关闭所有浏览器
    Sleep    2
    Close All Browsers

等待视频页面出现
    去除媒体安全提示
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=pepper
    Sleep    15    等待视频出现
    验证有视频

手动切换hari视频
    [Timeout]    10 minutes
    正常登录
    Execute JavaScript    window.open('${WEB_HOST}/manage?user=${USER}&apptype=pepper')
    Select Window    title=manage
    # 点击非自动切换
    ${waitTime}    Wait Until Element is visible    xpath=//*[@id="isAutoSwitch"]    10
    Click Element    xpath=//*[@id="isAutoSwitch"]
    #点击切换人工
    Sleep    3
    Wait Until Element is visible    xpath=//*[@id="switchHI"]
    Click Element    xpath=//*[@id="switchHI"]
    去除媒体安全提示
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=pepper
    Sleep    15    等待视频出现
    验证有视频

去除媒体安全提示
    utils.verify_picture_exists    allow.png    60
    utils.click picture on screen    allow.png    6

选择视频页面
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=pepper
    Sleep    5

选择queue页面
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=queue
    Sleep    3

登录界面展示
    Page Should Contain    登录
    Page Should Contain    记住我
    Page Should Contain    找回密码
    Page Should Contain    重置密码
    Page Should Contain    META客户端下载

选择登录页面
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=\u767b\u5f55

退出成功
    Sleep    2
    Page should contain    META客户端下载
    Page should contain    找回密码

选择辅助页面
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=manage
    Sleep    1
