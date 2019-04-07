*** Settings ***
Resource          MetaPortalBasic.robot
Resource          MetaVerifyAssertion.robot
Variables         config.py

*** Keywords ***
Login normal
    Open chrome browser    ${WEB_HOST}
    Input username    ${CS_NAME}
    Input password    ${CS_PWD}
    Login button

Login and video success
    Login normal
    Wait switch to video
    Verify has video

User input text outdoor naviga
