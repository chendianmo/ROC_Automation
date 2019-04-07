*** Settings ***
Test Setup        Setup
Test Teardown     关闭所有浏览器
Force Tags        PepperStability
Test Timeout      20 minutes
Resource          Pepper_Portal业务流程.robot
Resource          Pepper_Portal基础关键字.robot
Resource          Pepper_Portal验证断言.robot

*** Test Cases ***
1. PD-1178重启APP
    [Tags]
    [Timeout]
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Hari设置菜单
    \    重启APP
    \    重启APP确认
    \    Sleep    50
    \    Capture page Screenshot
    \    验证有视频
    关闭所有浏览器

2. PD-1179-视频重启
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    重拨视频
    \    Sleep    30
    \    Capture page Screenshot
    \    验证有视频
    关闭所有浏览器

3. PD-1198-Hari页面刷新
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Reload Page
    \    # Wait For Active Window    要重新加载该网站吗？    10
    \    刷新页面确认
    \    Sleep    30
    \    Capture page Screenshot
    \    验证有视频
    关闭所有浏览器

4. PD-1197-页面交互输入
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Hari内容发送
    \    Hari输入问题发送
    \    Hari内容发送
    关闭所有浏览器

5. PD-1196-输入框输入文字
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Hari内容发送
    关闭所有浏览器

6. PD-1195-输入问题发送
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Hari输入问题发送
    \    Hari输入问题发送
    \    Hari输入问题发送
    关闭所有浏览器

7. PD-1184-重启Pepper
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Hari设置菜单
    \    设置重启机器人
    \    确认按钮
    \    Sleep    18 minutes
    \    验证有视频
    关闭所有浏览器

8. PD-1667-重启RCU
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    Hari设置菜单
    : FOR    ${index}    IN RANGE    3
    \    重启RCU
    \    确认按钮
    \    Sleep    2 minutes
    \    验证有视频
    关闭所有浏览器

9. PD-1188-自动切换到视频
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    挂断视频
    \    确认按钮
    \    去除媒体安全提示
    \    选择视频页面
    \    验证有视频
    关闭所有浏览器

10. PD-1183-多次唤醒休眠
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    : FOR    ${index}    IN RANGE    3
    \    设置休眠
    \    休眠确认
    \    Sleep    30
    \    设置唤醒
    \    Sleep    30
    关闭所有浏览器

11. PD-1181-视频暂停,重启APP,视频
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    视频暂停
    \    Hari设置菜单
    \    重启APP
    \    重启APP确认
    \    Sleep    50
    \    验证有视频
    \    重拨视频
    \    Sleep    40
    \    验证有视频
    关闭所有浏览器

12. PD-1180-重启视频,APP
    手动切换hari视频
    Sleep    3
    : FOR    ${index}    IN RANGE    3
    \    Hari设置菜单
    \    重启APP
    \    重启APP确认
    \    Sleep    50
    \    验证有视频
    \    重拨视频
    \    Sleep    30
    \    验证有视频
    关闭所有浏览器

13. Hari视频带宽切换-交互
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    稳定性切换到中带宽
    \    验证有视频
    \    稳定性切换到低带宽
    \    验证有视频
    \    稳定性切换到高带宽
    \    验证有视频
    \    稳定性切换到中带宽
    \    验证有视频
    \    稳定性切换到高带宽
    \    验证有视频
    \    稳定性切换到低带宽
    \    验证有视频
    关闭所有浏览器

14. Hari视频切换低到中到低
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    2
    \    稳定性切换到中带宽
    \    验证有视频
    \    稳定性切换到低带宽
    \    验证有视频
    关闭所有浏览器

15. Hari视频带宽低到高到低
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    2
    \    稳定性切换到高带宽
    \    验证有视频
    \    稳定性切换到低带宽
    \    验证有视频
    关闭所有浏览器

16. Hari视频带宽低到中到高到低
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    2
    \    稳定性切换到中带宽
    \    验证有视频
    \    稳定性切换到高带宽
    \    验证有视频
    \    稳定性切换到低带宽
    \    验证有视频
    关闭所有浏览器

17. 人工模式点击切换视频-NO
    手动切换hari视频
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    挂断视频
    \    确认按钮
    \    选择辅助页面
    \    辅助页面非自动切换
    \    #点击切换人工
    \    Sleep    3
    \    辅助页面切换视频
    \    选择视频页面
    \    验证有视频
    关闭所有浏览器
