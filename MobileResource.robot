*** Settings ***
Library           UiKpiTest.py    ${MUT1}    WITH NAME    MUT1

*** Keywords ***
Start Meta App
    MUT1.Open Application    com.cloudminds.meta
    MUT1.Wait For UI Exists    3000    packageName=com.cloudminds.smartrobot    text=达闼智能助理
    MUT1.Press Key    back
