*** Settings ***
Test Setup        Setup
Test Teardown     Close All Browsers    # 关闭浏览器
Test Timeout      6 minutes
Resource          Pepper_Portal业务流程.robot
Resource          Pepper_Portal基础关键字.robot
Resource          Pepper_Portal验证断言.robot

*** Test Cases ***
1. PD-1268-重启机器人
    [Timeout]    30 minutes
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    Sleep    3
    设置重启机器人
    确认按钮
    Sleep    18 minutes
    验证有视频

2. PD-1267-机器人休眠
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    Sleep    3
    设置休眠
    Sleep    30
    设置唤醒
    验证有视频

3. PD-1266-重启app
    手动切换hari视频
    Hari设置菜单
    重启App
    确认按钮
    Sleep    70
    验证有视频

4. PD-1265-重启视频
    手动切换hari视频
    重拨视频
    Sleep    40
    截图
    验证有视频

5. PD-1264-自定义按钮
    手动切换hari视频
    Sleep    3
    点击自定义按钮
    Wait Until Element is Visible    xpath=//*[@id="btns"]/button[18]
    Click Element    xpath=//*[@id="btns"]/button[18]
    Sleep    5
    Page should Contain    请到左后方咨询台咨询并取号。

6. PD-1263-常用短语
    手动切换hari视频
    Sleep    3
    点击常用短语
    Wait Until Element is Visible    xpath=//*[@id="phrase_ul"]/li[2]/span[2]
    Double Click Element    xpath=//*[@id="phrase_ul"]/li[2]/span[2]
    Sleep    3
    Page should Contain    我是您忠实的朋友—导诊机器人蓓儿。很开心为您服务！

7. PD-1260-输入答案
    手动切换hari视频
    Sleep    3
    Hari输入问题发送

8. PD-1259-输入框内容
    手动切换hari视频
    Sleep    3
    Hari内容发送

9. PD-1254-语音唤醒hari视频
    自动切换hari视频

10. PD-1253-坐席登录
    正常登录
