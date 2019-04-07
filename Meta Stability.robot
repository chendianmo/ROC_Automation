*** Settings ***
Resource          MetaPortalBusiness.robot

*** Test Cases ***
1. Verify Auto Switch to Video
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Shutdown video call
    \    Confirm the action
    \    Wait switch to video
    \    Verify has video
    Close all bro

2. Veirify Video Redial
    [Timeout]    5 minutes
    MetaSetup
    Login and video success
    Sleep    3
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Redial video
    \    Sleep    30
    \    Verify has video
    Close all bro

3. Verify Recall App
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Meta settings
    \    Recall meta app
    \    Confirm the action
    \    Sleep    60
    \    Verify has video
    Close all bro

4. Verify Hari Page Reload
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Reload the page
    \    Reload confirm
    \    Verify has video
    Close all bro

5. Verify BW Switch Interac
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Switch to median BW
    \    Verify has video
    \    Switch to high BW
    \    Verify has video
    \    Switch to median BW
    \    Verify has video
    \    Switch to low BW
    \    Verify has video
    Close all bro

6. Verify Low Switch Median BW
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Switch to median BW
    \    Verify has video
    \    Switch to low BW
    \    Verify has video
    Close all bro

7. Verify Low Switch High BW
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Switch to High BW
    \    Verify has video
    \    Switch to low BW
    \    Verify has video
    Close all bro

8. Verify High Switch Median BW
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Switch to High BW
    \    Verify has video
    \    Switch to median BW
    \    Verify has video
    \    Switch to low BW
    \    Verify has video
    Close all bro

9. Verify Video Pause and Redial
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Video pause/renew
    \    Verify video pause
    \    Redial video
    \    Sleep    30
    \    Verify has video
    Close all bro

10. Verify Video Pause and Recall App
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Video pause/renew
    \    Verify video pause
    \    Meta settings
    \    Recall meta app
    \    Confirm the action
    \    Sleep    60
    \    Verify has video
    Close all bro

11. Verify Redial and Recall App
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    3
    \    Redial video
    \    Sleep    30
    \    Verify has video
    \    Meta settings
    \    Recall meta app
    \    Confirm the action
    \    Sleep    60
    \    Verify has video
    Close all bro

12. Verify Redial Pause and Recall App
    MetaSetup
    Login and video success
    ${faiNum}    Set Variable    0
    : FOR    ${index}    IN RANGE    2
    \    Redial video
    \    Sleep    30
    \    Verify has video
    \    Video pause/renew
    \    Meta settings
    \    Recall meta app
    \    Confirm the action
    \    Sleep    60
    \    Verify has video
    Close all bro
