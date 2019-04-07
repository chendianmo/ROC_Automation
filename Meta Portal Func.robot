*** Settings ***
Test Setup        MetaSetup
Test Teardown     Close All Browsers    #关闭所有浏览器
Test Timeout      6 minutes
Resource          MetaPortalBusiness.robot

*** Test Cases ***
1. Verify Portal Login Success
    [Tags]    META
    Open chrome browser    ${WEB_HOST}
    Input username    ${CS_NAME}
    Input password    ${CS_PWD}
    Login button

2. Verify Portal Login And Video
    [Tags]    META
    Login normal
    Wait switch to video
    Verify has video

3. Verify Outdoor Naviga Path Plan
    [Tags]    META
    Login and video success
    Custom user naviga input text    故宫博物院
    Verify search to address
    Set the destinations
    Verify naviga path plan
    Verify has video

4. Verify Video Bandwidth Switch Med
    [Tags]    META
    Login and video success
    Switch to median BW
    Verify has video
    Page Should Contain    中带宽
    Switch to low BW
    Verify has video
    Page Should Contain    低带宽

5. Verify Video Bandwidth Switch High
    [Tags]    META
    Login and video success
    Switch to high BW
    Verify has video
    Page Should Contain    高带宽
    Switch to low BW
    Verify has video
    Page Should Contain    低带宽

6. Verify Video Bandwidth High Switch Med
    [Tags]    META
    Login and video success
    Switch to high BW
    Verify has video
    Page Should Contain    高带宽
    Switch to median BW
    Verify has video
    Page Should Contain    中带宽
    Switch to low BW
    Verify has video
    Page Should Contain    低带宽

7. Verify Video Bandwidth Switch Interac
    [Tags]    META
    Login and video success
    Switch to high BW
    Verify has video
    Page Should Contain    高带宽
    Switch to median BW
    Verify has video
    Page Should Contain    中带宽
    Switch to high BW
    Verify has video
    Page Should Contain    高带宽
    Switch to low BW
    Verify has video
    Page Should Contain    低带宽

8. Verify Video Redial
    [Tags]    META
    Login and video success
    Redial video
    Sleep    30
    Verify has video

9. Verify Video Pause
    [Tags]    META
    Login and video success
    Video pause/renew
    Sleep    10
    Video pause/renew
    Sleep    10
    Verify has video

10. Verify Video Pause/Renew Interac
    [Tags]    META
    Login and video success
    Video pause/renew
    Verify video pause
    Sleep    12
    Video pause/renew
    Sleep    12
    Video pause/renew
    Verify video pause
    Sleep    12
    Video pause/renew
    Sleep    12
    Verify has video

11. Verify Video Pause And Redial
    [Tags]    META
    Login and video success
    Video pause/renew
    Sleep    10
    Redial video
    Sleep    60
    Verify has video

12. Verify Video Reload
    [Tags]    META
    Login and video success
    Reload the page
    Reload confirm
    Sleep    30
    Verify has video

13. Verify Video Pause And Reload
    [Tags]    META
    Login and video success
    Video pause/renew
    Sleep    10
    Reload the page
    Reload confirm
    Sleep    30
    Verify no video
    Video pause/renew
    Sleep    8
    Verify has video

14. Verify Recall Meta App
    [Tags]    META
    Login and video success
    Meta settings
    Recall meta app
    Confirm the action
    Sleep    60
    Verify has video

15. Verify Hangup Video Call
    [Tags]    META
    Login and video success
    Shutdown video call
    Confirm the action

16. Verify Video Pause And Recall Meta App
    Login and video success
    Video pause/renew
    Meta settings
    Recall meta app
    Confirm the action
    Sleep    30
    Verify has video

17. Verify Video of Median Redial
    Login and video success
    Switch to median BW
    Verify has video
    Redial video
    Sleep    20
    Verify has video
    Switch to low BW
    Verify has video

18. Verify Video of High Redial
    Login and video success
    Switch to high BW
    Verify has video
    Redial video
    Sleep    20
    Verify has video
    Switch to low BW
    Verify has video

19. Verify Video of Meian Pause/Renew
    Login and video success
    Switch to median BW
    Verify has video
    Video pause/renew
    Verify video pause
    Sleep    5
    Video pause/renew
    Switch to low BW
    Verify has video

20. Verify Video of High Pause/Renew
    Login and video success
    Switch to high BW
    Verify has video
    Video pause/renew
    Verify video pause
    Sleep    5
    Video pause/renew
    Switch to low BW
    Verify has video

21. Verify Video of Median Reload
    Login and video success
    Switch to median BW
    Verify has video
    Reload the page
    Reload confirm
    Sleep    30
    Verify has video
    Switch to low BW
    Verify has video

22. Verify Video of High Reload
    Login and video success
    Switch to high BW
    Verify has video
    Reload the page
    Reload confirm
    Sleep    30
    Verify has video
    Switch to low BW
    Verify has video

23. Verify Video of Median Pause Reload
    Login and video success
    Switch to median BW
    Verify has video
    Video pause/renew
    Verify video pause
    Reload the page
    Reload confirm
    Verify no video
    Video pause/renew
    Sleep    8
    Verify has video
    Switch to low BW
    Verify has video

24. Verify Video of High Pause Reload
    Login and video success
    Switch to high BW
    Verify has video
    Video pause/renew
    Verify video pause
    Reload the page
    Reload confirm
    Verify no video
    Video pause/renew
    Sleep    8
    Verify has video
    Switch to low BW
    Verify has video

25. Verify Video of Median Recall Meta App
    Login and video success
    Switch to median BW
    Verify has video
    Meta settings
    Recall meta app
    Confirm the action
    Sleep    40
    Verify has video
    Page should Contain    中带宽
    Switch to low BW
    Verify has video
    Page should Contain    低带宽

26. Verify Video of High Recall Meta App
    Login and video success
    Switch to high BW
    Verify has video
    Meta settings
    Recall meta app
    Confirm the action
    Sleep    40
    Verify has video
    Page should Contain    高带宽
    Switch to low BW
    Verify has video
    Page should Contain    低带宽

27. Verify Video Pause Redial And Recall App
    Login and video success
    Video pause/renew
    Verify video pause
    Redial video
    Meta settings
    Recall meta app
    Confirm the action
    Sleep    36
    Verify has video

28. Verifyf Video Redial And Recall App
    Login and video success
    Redial video
    Meta settings
    Recall meta app
    Confirm the action
    Sleep    36
    Verify has video

29. Verify Search func work (Display)
    Login and video success
    # 搜索按钮
    Search input text display
    Search button
    Verify search input text miss

30. Verify Custom Input Text
    Login and video success
    Right input bar
    Custom user input text    你好帅哥
    Custom user send button
    Page should Contain    你好帅哥

31. Verify Portal Login with Error User
    Open chrome browser    ${WEB_HOST}
    Input username    $%&*@cloudminds.com
    Input password    123456
    Login buttons
    Page should contain    用户名或密码错误!

32. Verify Portal Login with Error PW
    Open chrome browser    ${WEB_HOST}
    Input username    test9@cloudminds.com
    Input password    12345678
    Login buttons
    Page should contain    用户名或密码错误!

33. Verify Portal Login with Null
    Open chrome browser    ${WEB_HOST}
    Login buttons
    Verify login portal lose info

34. Verify Portal Login with User Null
    Open chrome browser    ${WEB_HOST}
    Input password    123456
    Login buttons
    Verify login portal lose info

35. Verify Portal Login with PD Null
    Open chrome browser    ${WEB_HOST}
    Input username    test9@cloudmins.com
    Login buttons
    Verify login portal lose info

36. Verify Same Users Login
    Login normal
    Execute JavaScript    window.open('${WEB_HOST}')
    Login portal titles
    Input username    ${CS_NAME}
    Input password    ${CS_PWD}
    Login buttons
    ${verify}    Wait for multiple user login popup
    Sleep    3
    confirm action
    Sleep    3
    Verify logout success

37. Verify Portal Logout
    Login normal
    Choose queue portal
    Logout button
    Verify logout success

38. Verify Custom Close Portal Video
    Login and video success
    Shutdown video call
    Confirm the action
