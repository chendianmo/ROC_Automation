*** Settings ***
Library           Selenium2Library
Library           Utils.py    WITH NAME    utils
Resource          Pepper_Portal验证断言.robot

*** Variables ***

*** Keywords ***
打开浏览器
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Page should contain    META客户端下载
    Sleep    5

输入用户名
    [Arguments]    ${username}
    Wait Until Element is Visible    id=inputEmail    20
    Selenium2Library.Input Text    id=inputEmail    ${username}

输入密码
    [Arguments]    ${password}
    Wait Until Element is Visible    id=inputPassword    20
    Selenium2Library.Input Text    id=inputPassword    ${password}

点击登录
    Wait Until Element is Visible    Xpath=/html/body/div[1]/form/button    10
    Click Button    Xpath=/html/body/div[1]/form/button
    验证坐席登录成功

点击登录(不验证)
    Wait Until Element is Visible    Xpath=/html/body/div[1]/form/button
    Click Button    Xpath=/html/body/div[1]/form/button
    Sleep    1

视频暂停
    Wait Until Element is visible    xpath=//*[@id="video_open_close"]    20
    Click Button    xpath=//*[@id="video_open_close"]
    Sleep    12

重启APP
    Wait Until Element is Visible    xpath=//*[@id="restart_service"]    30
    Click Button    xpath=//*[@id="restart_service"]
    Sleep    3

重拨视频
    Wait Until Element is visible    xpath=//*[@id="reconnect_btn"]    20
    Click Button    xpath=//*[@id="reconnect_btn"]
    Sleep    2

Hari设置菜单
    Wait Until Element is Visible    xpath=//*[@id="set_up"]    20
    Click Element    xpath=//*[@id="set_up"]
    Sleep    3

设置休眠
    Wait Until Element is Visible    xpath=//*[@id="robot_rest"]    20
    Click Element    xpath=//*[@id="robot_rest"]

设置唤醒
    Wait Until Element is Visible    xpath=//*[@id="robot_wakeup"]    20
    Click Element    xpath=//*[@id="robot_wakeup"]

设置重启机器人
    Wait Until Element is visible    xpath=//*[@id="robot_reboot"]    20
    Click Button    xpath=//*[@id="robot_reboot"]
    Sleep    3

设置重连机器人
    Wait Until Element is visible    xpath=//*[@id="robot_reconnect"]    20
    Click Button    xpath=//*[@id="robot_reconnect"]
    Sleep    3

点击快捷操作
    Wait Until Element is Visible    xpath=//*[@id="info_dialog"]/div[3]/span[1]    20
    CLick Element    xpath=//*[@id="info_dialog"]/div[3]/span[1]

设置关闭机器人
    Wait Until Element is Visible    xpath=//*[@id="robot_shutdown"]    20
    Click Element    xpath=//*[@id="robot_shutdown"]
    Sleep    3

点击视频恢复
    Wait Until Element is visible    xpath=//*[@id="video_open_close"]    20
    Click Button    xpath=//*[@id="video_open_close"]
    Sleep    12

重启RCU
    Wait Until Element is Visible    xpath=//*[@id="reboot_service"]    20
    Click Element    xpath=//*[@id="reboot_service"]
    Sleep    2

挂断视频
    Wait Until Element is visible    xpath=//*[@id="shutdown_service"]    20
    Click Element    xpath=//*[@id="shutdown_service"]
    Capture page Screenshot
    Sleep    2

点击自定义按钮
    Wait Until Element is visible    xpath=//*[@id="customizeBtns"]    20
    Click Button    xpath=//*[@id="customizeBtns"]

输入框
    [Arguments]    ${text}
    Wait Until Element is visible    xpath=//*[@id="answer_area"]    20
    Selenium2Library.Input Text    xpath=//*[@id="answer_area"]    ${text}

输入问题
    [Arguments]    ${text}
    Wait Until Element is visible    xpath=//*[@id="input_problemText"]    20
    Selenium2Library.Input Text    xpath=//*[@id="input_problemText"]    ${text}

发送
    Wait Until Element is visible    xpath=//*[@id="sendTextVal"]    10
    Click Button    xpath=//*[@id="sendTextVal"]

点击常用短语
    Wait Until Element is Visible    xpath=//*[@id="phrase_wrap"]/p[1]    20
    Click Element    xpath=//*[@id="phrase_wrap"]/p[1]

退出登录
    Wait Until Element is Visible    xpath=//*[@id="logout"]    20
    Click Element    xpath=//*[@id="logout"]
    Sleep    5

打开历史记录
    Wait Until Element is Visible    xpath=//*[@id="see_more"]    20
    Click Element    xpath=//*[@id="see_more"]
    Sleep    3
    Page Should Contain    历史记录

关闭历史记录
    Wait Until Element is Visible    xpath=//*[@id="myModal"]/div/div/div[3]/button    20
    Click Element    xpath=//*[@id="myModal"]/div/div/div[3]/button
    Sleep    3
    Page Should Not Contain    尾页

双击清空聊天
    Wait Until Element is Visible    xpath=/html/body/header/span[1]    10
    Double Click Element    xpath=/html/body/header/span[1]
    Sleep    1

历史记录第三页
    Wait Until Element is Visible    xpath=//*[@id="pagination"]/li[5]/a    10
    Click Element    xpath=//*[@id="pagination"]/li[5]/a
    Sleep    2

历史记录首页
    Wait Until Element is Visible    xpath=//*[@id="pagination"]/li[1]/a    10
    Click Element    xpath=//*[@id="pagination"]/li[1]/a
    Sleep    2

历史记录尾页
    Wait Until Element is Visible    xpath=//*[@id="pagination"]/li[9]/a    10
    Click Element    xpath=//*[@id="pagination"]/li[9]/a
    Sleep    2

历史记录第一页
    Wait Until Element is Visible    xpath=//*[@id="pagination"]/li[3]/a    10
    Click Element    xpath=//*[@id="pagination"]/li[3]/a
    Sleep    2

历史记录上一页
    Wait Until Element is Visible    xpath=//*[@id="pagination"]/li[2]/a
    Click Element    xpath=//*[@id="pagination"]/li[2]/a
    Sleep    2

历史记录下一页
    Wait Until Element is Visible    xpath=//*[@id="pagination"]/li[8]/a    10
    Click Element    xpath=//*[@id="pagination"]/li[8]/a
    Sleep    2

取消按钮
    Sleep    3
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[2]    20
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[2]
    Sleep    2

重启APP确认
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[1]    20
    Click Button    xpath=/html/body/div[3]/div/div[3]/button[1]
    Sleep    3

休眠确认
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[1]    20
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[1]

重启RCU确认
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[1]    20
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[1]

确认按钮
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[1]    10
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[1]
    Sleep    2

关闭Pepper确认
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[1]    20
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[1]

刷新页面确认
    ${result}    utils.verify_picture_exists    reload_btn.png    5
    Run Keyword If    ${result}    utils.Click Picture On Screen    reload_btn.png    3

切换到低带宽
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    20
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    3
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[3]    20
    Click Element    xpath=//*[@id="bandwidth"]/li[3]
    Sleep    36

切换到中带宽
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    20
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    2
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[2]    20
    Click Element    xpath=//*[@id="bandwidth"]/li[2]
    Sleep    36

切换到高带宽
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    20
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    3
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[1]    20
    Click Element    xpath=//*[@id="bandwidth"]/li[1]
    Sleep    36

稳定性切换到中带宽
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    20
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    2
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[2]    20
    Click Element    xpath=//*[@id="bandwidth"]/li[2]
    Sleep    36

稳定性切换到低带宽
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    20
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    3
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[3]    20
    Click Element    xpath=//*[@id="bandwidth"]/li[3]
    Sleep    36

稳定性切换到高带宽
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    20
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    3
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[1]    20
    Click Element    xpath=//*[@id="bandwidth"]/li[1]
    Sleep    36

页面刷新
    Reload page

辅助页面切换视频
    Wait Until Element is visible    xpath=//*[@id="switchHI"]    8
    Click Element    xpath=//*[@id="switchHI"]

辅助页面非自动切换
    Wait Until Element is visible    xpath=//*[@id="isAutoSwitch"]    10
    Click Element    xpath=//*[@id="isAutoSwitch"]

点击视频暂停图标
    utils.verify_picture_exists    VideoPause.png    8
    utils.click picture on screen    VideoPause.png
    Sleep    8
