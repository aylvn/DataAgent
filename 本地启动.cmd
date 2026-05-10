# 本地启动
# 以下命令复制到powershell中执行

D:
cd D:\IdeaProjects\sz-water\data-agent\data-agent-management
chcp 65001
set CONSOLE_CHARSET=GBK
$env:JAVA_HOME="C:\Program Files\Java\jdk-21";
$env:PATH="C:\Program Files\Java\jdk-21\bin;$env:PATH";
../mvnw -U -s ../maven-settings.xml spring-boot:run


