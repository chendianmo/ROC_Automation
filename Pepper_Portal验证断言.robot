*** Settings ***
Library           Selenium2Library
Library           Utils.py    WITH NAME    utils
Resource          Pepper_Portal基础关键字.robot

*** Variables ***

*** Keywords ***
Setup
    Log    Test Start

验证有视频
    Log    验证视频是否出现
    ${result}    utils.verify_picture_exists    videoNotAvailable.png    8
    Run Keyword If    '${result}' == 'False'    log    正确有视频
    ...    ELSE    fail

验证登录界面缺失信息
    ${result}    utils.verify_picture_exists    Inputpassed.png    5
    Run Keyword If    '${result}' == 'True'    log    密码或者用户信息缺失
    ...    ELSE    fail

稳定性验证视频
    Sleep    5
    ${result}    utils.verify_picture_exists    videoNotAvailable.png    10
    Run Keyword If    '${result}' == 'False'    log    正确有视频
    ...    ELSE    注意注意注意......没有视频

验证视频暂停再刷新图标
    Sleep    2
    ${result}    utils.verify_picture_exists    VideoPause.png    3
    Run Keyword If    '${result}' == 'True'    log    视频暂停按钮生效
    ...    ELSE    点击视频恢复

验证没有视频
    Sleep    5
    ${result}    utils.verify_picture_exists    videoNotAvailable.png    5
    Run Keyword If    '${result}' == 'True'    log    没有视频
    ...    ELSE    fail

验证清空聊天
    ${result}    utils.verify_picture_exists    nullPage.png    5
    Run Keyword If    '${result}' == 'True'    log    已经清空聊天记录
    ...    ELSE    fail

验证回到首页
    Sleep    5
    ${result}    utils.verify_picture_exists    theFirstpage.png    5
    Run Keyword If    '${result}' == 'True'    log    已经回到首页(第一页)
    ...    ELSE    fail

验证到第三页
    Sleep    5
    ${result}    utils.verify_picture_exists    theThirdpage.png    5
    Run Keyword If    '${result}' == 'True'    log    历史聊天记录当前在第三页
    ...    ELSE    fail

验证历史记录尾页
    Sleep    5
    ${result}    utils.verify_picture_exists    lastPage.png    5
    Run Keyword If    '${result}' == 'True'    log    已经在历史记录尾页
    ...    ELSE    fail

验证请输入内容
    Sleep    1
    ${result}    utils.verify_picture_exists    pleaseInput.png    5
    Run Keyword If    '${result}' == 'True'    log    已经在历史记录尾页
    ...    ELSE    fail

验证坐席登录成功
    Sleep    1
    Wait Until Element is Visible    xpath=//*[@id="logout"]    10
