*** Settings ***
Test Setup        Setup
Test Teardown     Close All Browsers    # 关闭浏览器
Test Timeout      7 minutes
Resource          Pepper_Portal业务流程.robot
Resource          Pepper_Portal基础关键字.robot
Resource          Pepper_Portal验证断言.robot

*** Test Cases ***
1. PD-1209-登录Pepper客服
    [Tags]    TEST
    正常登录
    验证坐席登录成功

2. 自动切换到Hari视频
    正常登录
    去除媒体安全提示
    选择视频页面
    验证有视频

3. PD-839-Hari视频期间重启APP
    手动切换hari视频
    Hari设置菜单
    重启APP
    重启APP确认
    Sleep    40
    验证有视频

4. PD-828-Hari视频期间视频重启
    手动切换hari视频
    重拨视频
    Sleep    30
    截图
    验证有视频

5. Hari视频页面刷新
    手动切换hari视频
    Sleep    3
    页面刷新
    截图
    刷新页面确认
    验证有视频

6. 坐席端客服输入内容发送
    手动切换hari视频
    输入框    美女看过来啦
    Sleep    3
    发送
    Sleep    3
    Page Should Contain    美女看过来啦
    截图
    验证有视频

7. Hari视频期间机器人休眠唤醒
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    Sleep    3
    设置休眠
    休眠确认
    Sleep    30
    设置唤醒
    验证有视频

8. Hari视频机器人重启
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    Sleep    3
    设置重启机器人
    确认按钮
    Sleep    18 minutes
    验证有视频

9. 机器人重连
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    Sleep    3
    设置重连机器人
    验证有视频

10. 关闭机器人
    手动切换hari视频
    Sleep    3
    Hari设置菜单
    Sleep    3
    设置关闭机器人
    关闭Pepper确认

11. PD-827-Hari视频暂停
    手动切换hari视频
    Sleep    3
    视频暂停
    Sleep    3
    截图
    点击视频恢复
    验证有视频
    重拨视频
    Sleep    40
    验证有视频

12. PD-827-1-Hari视频暂停再恢复
    手动切换hari视频
    Sleep    3
    视频暂停
    Sleep    3
    截图
    点击视频恢复
    截图
    验证有视频
    重拨视频
    Sleep    40
    验证有视频

13. 坐席端输入问题回答
    手动切换hari视频
    输入问题    你好
    Sleep    3
    utils.click_coordinate    928    940
    发送
    Sleep    5
    Page Should Contain    你好
    验证有视频

14. 坐席端快捷操作(1)
    手动切换hari视频
    Sleep    3
    点击快捷操作
    Wait Until Element Is Visible    xpath=//*[@id="actions"]/li[8]
    Click Element    xpath=//*[@id="actions"]/li[8]
    Page Should Contain    停止
    截图
    验证有视频

15. PD-841-坐席端挂断视频通话
    手动切换hari视频
    Sleep    3
    挂断视频
    确认按钮

16. Hari视频暂停再重拨视频
    手动切换hari视频
    Sleep    3
    视频暂停
    Sleep    3
    截图
    重拨视频
    Sleep    30
    截图
    验证有视频

17. 坐席端验证视频正常
    手动切换hari视频
    验证有视频

18. Hari视频期间APP重启和视频重启
    手动切换hari视频
    重拨视频
    Sleep    30
    验证有视频
    Hari设置菜单
    重启APP
    重启APP确认
    Sleep    60
    验证有视频

19. PD-1652-Hari视频期间重启RCU
    手动切换hari视频
    Hari设置菜单
    重启RCU
    重启RCU确认
    Sleep    2 minutes
    验证有视频

20. PD-1214-1-密码为空
    打开浏览器    ${WEB_HOST}
    输入用户名    ${CS_NAME}
    点击登录(不验证)
    验证登录界面缺失信息
    截图

21. PD-1214--2-用户为空
    打开浏览器    ${WEB_HOST}
    输入密码    ${CS_PWD}
    点击登录(不验证)
    验证登录界面缺失信息
    截图

22. PD-1213-用户退出
    正常登录
    选择queue页面
    退出登录
    Page should contain    META客户端下载

23. PD-1212-使用未注册用户
    打开浏览器    ${WEB_HOST}
    输入用户名    1213@cloudminds.com
    输入密码    ${CS_PWD}
    点击登录(不验证)
    Page should contain    用户名或密码错误!

24. PD-1211-错误密码
    打开浏览器    ${WEB_HOST}
    输入用户名    ${CS_NAME}
    输入密码    123456890
    点击登录(不验证)
    Page should contain    用户名或密码错误!

25. PD-1210-重复登录同一用户
    正常登录
    Execute JavaScript    window.open('${WEB_LOGIN}')
    选择登录页面
    输入用户名    ${CS_NAME}
    输入密码    ${CS_PWD}
    Sleep    2
    点击登录(不验证)
    utils.verify_picture_exists    multilogin.png    8
    utils.Click picture On Screen    confirm.png
    Sleep    3
    退出成功

26. PD-1208-登录页面展示
    打开浏览器    ${WEB_HOST}
    登录界面展示

27. Hari视频带宽低到中到低
    手动切换hari视频
    切换到中带宽
    截图
    验证有视频
    Page Should Contain    中带宽
    Page Should Contain    低带宽
    Page Should Contain    高带宽
    截图

28. Hari视频带宽低到高到低
    手动切换hari视频
    切换到高带宽
    截图
    验证有视频
    切换到低带宽
    截图
    验证有视频

29. Hari视频带宽低到中到高到低
    手动切换hari视频
    切换到中带宽
    截图
    验证有视频
    切换到高带宽
    截图
    验证有视频
    切换到低带宽
    截图
    验证有视频

30. Hari视频低到中到低到高到低
    手动切换hari视频
    切换到中带宽
    截图
    验证有视频
    切换到低带宽
    截图
    验证有视频
    切换到高带宽
    截图
    验证有视频
    切换到低带宽
    截图
    验证有视频

31. Hari视频中带宽再重拨
    手动切换hari视频
    切换到中带宽
    验证有视频
    重拨视频
    Sleep    30
    Page Should Contain    中带宽
    验证有视频
    切换到低带宽
    截图
    验证有视频

32. Hari视频高带宽再重拨
    手动切换hari视频
    切换到高带宽
    验证有视频
    重拨视频
    Sleep    30
    Page Should Contain    高带宽
    验证有视频
    切换到低带宽
    截图
    验证有视频

33. Hari视频中带宽重启APP
    手动切换hari视频
    切换到中带宽
    验证有视频
    Hari设置菜单
    重启APP
    重启APP确认
    Sleep    50
    验证有视频
    Page Should Contain    中带宽
    切换到低带宽
    验证有视频

34. Hari视频高带宽重启APP
    手动切换hari视频
    切换到高带宽
    验证有视频
    Hari设置菜单
    重启APP
    重启APP确认
    Sleep    50
    验证有视频
    Page Should Contain    高带宽
    切换到低带宽
    验证有视频

35. Hari视频中带宽重启RCU
    手动切换hari视频
    切换到中带宽
    验证有视频
    Hari设置菜单
    重启RCU
    重启RCU确认
    Sleep    2 minutes
    Select Window    title=pepper
    验证有视频
    Page Should Contain    中带宽
    切换到低带宽
    验证有视频

36. Hari视频高带宽重启RCU
    手动切换hari视频
    切换到高带宽
    验证有视频
    Hari设置菜单
    重启RCU
    重启RCU确认
    Sleep    2 minutes
    Select Window    title=pepper
    验证有视频
    Page Should Contain    高带宽
    切换到低带宽
    验证有视频

37. Hari视频暂停再刷新-NO
    手动切换hari视频
    视频暂停
    截图
    页面刷新
    # Wait For Active Window    要重新加载该网站吗？    10
    Sleep    3
    刷新页面确认
    Sleep    15
    # 验证没有视频
    点击视频暂停图标
    验证有视频

38. Hari视频暂停再重启APP
    手动切换hari视频
    视频暂停
    截图
    Hari设置菜单
    重启APP
    确认按钮
    Sleep    40
    验证有视频

39. 历史记录开关闭
    手动切换hari视频
    打开历史记录
    关闭历史记录

40. 取消挂断视频
    手动切换hari视频
    挂断视频
    取消按钮
    验证有视频

41. 取消重启APP
    手动切换hari视频
    Hari设置菜单
    重启APP
    取消按钮
    验证有视频

42. 取消关闭机器人
    手动切换hari视频
    Hari设置菜单
    设置关闭机器人
    取消按钮
    验证有视频

43. 取消重启机器人
    手动切换hari视频
    Hari设置菜单
    设置重启机器人
    取消按钮
    验证有视频

44. 取消重启RCU
    手动切换hari视频
    Hari设置菜单
    重启RCU
    取消按钮
    验证有视频

45. 历史记录点击页码
    手动切换hari视频
    打开历史记录
    历史记录第三页
    验证到第三页

46. 历史记录上一下一页
    手动切换hari视频
    打开历史记录
    历史记录第三页
    验证到第三页
    历史记录下一页
    历史记录上一页
    历史记录上一页
    历史记录上一页
    验证回到首页

47. 历史记录首尾页
    手动切换hari视频
    打开历史记录
    历史记录第三页
    验证到第三页
    历史记录尾页
    验证历史记录尾页

48. 视频重拨再立刻重启APP
    手动切换hari视频
    重拨视频
    Hari设置菜单
    重启App
    确认按钮
    Sleep    40
    验证有视频

49. 清空客服端聊天记录
    手动切换hari视频
    双击清空聊天
    验证清空聊天

50. 客服端输入空内容
    手动切换hari视频
    发送

51. 手动切换到Hari视频
    正常登录
    Execute JavaScript    window.open('${WEB_HOST}/manage?user=${USER}&apptype=pepper')
    选择辅助页面
    # 点击非自动切换
    辅助页面非自动切换
    #点击切换人工
    Sleep    3
    辅助页面切换视频
    去除媒体安全提示
    选择视频页面
    Sleep    15    等待视频出现
    验证有视频
