*** Settings ***
Library           Selenium2Library
Library           Utils.py    WITH NAME    utils
Resource          MetaVerifyAssertion.robot

*** Variables ***

*** Keywords ***
Open chrome browser
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Page should contain    META客户端下载
    Sleep    3

Input username
    [Arguments]    ${username}
    Wait Until Element is Visible    id=inputEmail    10
    Selenium2Library.Input Text    id=inputEmail    ${username}

Input password
    [Arguments]    ${password}
    Wait Until Element is Visible    id=inputPassword    10
    Selenium2Library.Input Text    id=inputPassword    ${password}

Login button
    Wait Until Element is Visible    Xpath=/html/body/div[1]/form/button    10
    Click Button    Xpath=/html/body/div[1]/form/button
    Sleep    5
    Wait Until Element is Visible    xpath=//*[@id="logout"]    10

Login buttons
    Wait Until Element is Visible    Xpath=/html/body/div[1]/form/button    10
    Click Button    Xpath=/html/body/div[1]/form/button
    Sleep    1

Logout button
    Wait Until Element is Visible    xpath=//*[@id="logout"]    10
    Click Button    xpath=//*[@id="logout"]
    Sleep    3

MetaSetup
    Log    start meta test

Wait switch to video
    Dismiss Media Security Popup
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=meta
    Sleep    15

Switch to median BW
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    10
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    2
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[2]    10
    Click Element    xpath=//*[@id="bandwidth"]/li[2]
    Sleep    30

Switch to low BW
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    10
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    2
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[3]    10
    Click Element    xpath=//*[@id="bandwidth"]/li[3]
    Sleep    30

Switch to high BW
    Wait Until Element is Visible    xpath=//*[@id="dropdownMenu"]    10
    Click Element    xpath=//*[@id="dropdownMenu"]
    Sleep    2
    Wait Until Element is Visible    xpath=//*[@id="bandwidth"]/li[1]    10
    Click Element    xpath=//*[@id="bandwidth"]/li[1]
    Sleep    30

Video pause/renew
    Wait Until Element is Visible    xpath=//*[@id="video_open_close"]    10
    Click Element    xpath=//*[@id="video_open_close"]
    Sleep    8

Redial video
    Wait Until Element is Visible    xpath=//*[@id="reconnect_btn"]    10
    Click Element    xpath=//*[@id="reconnect_btn"]
    Sleep    3

Meta settings
    Wait Until Element is Visible    xpath=//*[@id="set_up"]    10
    Click Element    xpath=//*[@id="set_up"]
    Sleep    3

Recall meta app
    Wait Until Element is Visible    xpath=//*[@id="restart_service"]    10
    Click Element    xpath=//*[@id="restart_service"]
    Sleep    3

Confirm the action
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[1]    10
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[1]
    Sleep    3

Cancel the action
    Wait Until Element is Visible    xpath=/html/body/div[3]/div/div[3]/button[2]    10
    Click Element    xpath=/html/body/div[3]/div/div[3]/button[2]
    Sleep    3

Shutdown video call
    Wait Until Element is Visible    xpath=//*[@id="shutdown_service"]    10
    Click Element    xpath=//*[@id="shutdown_service"]
    Sleep    3

Right input bar
    Wait Until Element is Visible    xpath=//*[@id="elastic_btn"]    10
    Click Element    xpath=//*[@id="elastic_btn"]
    Sleep    3

Custom user defined button
    Wait Until Element is Visible    xpath=//*[@id="customizeBtns"]    10
    Click Element    xpath=//*[@id="customizeBtns"]
    Sleep    3

Mute button
    Wait Until Element is Visible    xpath=//*[@id="audio_btn"]    10
    Click Element    xpath=//*[@id="audio_btn"]
    Sleep    3

Custom user input text
    [Arguments]    ${text}
    Wait Until Element is Visible    xpath=//*[@id="answer_area"]    10
    Selenium2Library.Input Text    xpath=//*[@id="answer_area"]    ${text}
    Sleep    2

Custom user send button
    Wait Until Element is Visible    xpath=//*[@id="answerForm"]/div/button[1]    10
    Click Element    xpath=//*[@id="answerForm"]/div/button[1]
    Sleep    1

Reload the page
    Reload Page
    Sleep    6

Reload confirm
    ${result}    utils.verify_picture_exists    reload_btn.png    7
    Run Keyword If    ${result}    utils.Click Picture On Screen    reload_btn.png    3

Custom user naviga input text
    [Arguments]    ${text1}
    Wait Until Element is Visible    xpath=//*[@id="tipinput"]    10
    Selenium2Library.Input Text    xpath=//*[@id="tipinput"]    ${text1}
    Sleep    2
    # 输入后选择列表的地址
    utils.verify_picture_exists    gugong.png    5
    utils.click picture on screen    gugong.png
    Sleep    3

Set the destinations
    # 选择具体去的地址
    utils.verify_picture_exists    mudi.png
    utils.click picture on screen    mudi.png
    sleep    3
    # 确定设置为目的地
    utils.verify_picture_exists    confirm.png
    utils.click picture on screen    confirm.png
    Sleep    8

Search button
    Wait Until Element is Visible    xpath=//*[@id="searchBtn"]    10
    Click Element    xpath=//*[@id="searchBtn"]
    Sleep    3

Close all bro
    Sleep    2
    Close All Browsers

Dismiss Media Security Popup
    utils.verify_picture_exists    allow.png    60
    utils.click picture on screen    allow.png    5

Wait for multiple user login popup
    ${result}    utils.verify_picture_exists    multi_login.png    10
    [Return]    ${result}

Choose queue portal
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=queue
    Sleep    2

Login portal titles
    ${Titles}    Get Window Titles
    Log    ${Titles}
    Select Window    title=\u767b\u5f55

Search input text display
    Wait Until Element is Visible    xpath=//*[@id="tipinput"]
