*** Settings ***
Library           Selenium2Library
Library           Utils.py    WITH NAME    utils

*** Keywords ***
Verify has video
    Sleep    5
    ${result}    utils.verify_picture_exists    videoNotAvailable.png    8
    Run Keyword If    '${result}' == 'False'    log    正确有视频
    ...    ELSE    fail

Verify no video
    Sleep    5
    ${result}    utils.verify_picture_exists    noVide.png    5
    Run Keyword If    '${result}' == 'True'    log    没有视频
    ...    ELSE    fail

Verify search to address
    Sleep    5
    ${result}    utils.verify_picture_exists    gugongMap.png
    Run Keyword If    '${result}' == 'True'    log    搜寻地址正确
    ...    ELSE    fail

Verify naviga path plan
    Sleep    5
    ${result}    utils.verify_picture_exists    navigaPath.png    5
    Run Keyword If    '${result}' == 'True'    log    到故宫路径规划成功
    ...    ELSE    fail

Verify video pause
    Sleep    5
    ${result}    utils.verify_picture_exists    trueVideoPause.png    5
    Run Keyword If    '${result}' == 'True'    log    视频暂停成功
    ...    ELSE    fail

Verify video no pause
    Sleep    5
    ${result}    utils.verify_picture_exists    trueVideoPause.png    5
    Run Keyword If    '${result}' == 'False'    log    视频没有暂停哦
    ...    ELSE    fail

Verify login portal lose info
    Sleep    1
    ${result}    utils.verify_picture_exists    Inputpassed.png    3
    Run Keyword If    '${result}' == 'True'    log    密码或者用户信息缺失
    ...    ELSE    fail

Verify login success
    Wait Until Element is Visible    xpath=//*[@id="logout"]    10
    page should contain    退出登录

Verify logout success
    Page should contain    META客户端下载
    Page should contain    找回密码

Verify search input text miss
    Sleep    1
    Wait Until Element is Not Visible    xpath=//*[@id="tipinput"]
