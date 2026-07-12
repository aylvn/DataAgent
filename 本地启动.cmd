# ============================================
# 本地启动命令 - 适用于 PowerShell 终端
# ============================================
# 使用方法：
# 1. 打开 IDEA 终端（PowerShell）
# 2. 复制以下命令并执行
# ============================================

# chromadb数据库

# 初始化-创建数据库和集合 chromadb数据库启动后执行一次
# windows
Invoke-RestMethod -Uri http://localhost:8000/api/v2/tenants/SpringAiTenant/databases -Method Post -ContentType "application/json" -Body '{"name":"SpringAiDatabase"}'
Invoke-RestMethod -Uri http://localhost:8000/api/v2/tenants/SpringAiTenant/databases/SpringAiDatabase/collections -Method Post -ContentType "application/json" -Body '{"name":"data-agent-collection"}'

# 基础启动
docker run -d --name chromadb -p 8000:8000 chromadb/chroma

# 带数据持久化
docker run -d --name chromadb -p 8000:8000 -v D:/chroma-data:/chroma/chroma chromadb/chroma


# 设置工作目录
D:
cd D:\IdeaProjects\sz-water\data-agent\data-agent-management

# 设置 Java 环境
$env:JAVA_HOME="C:\Program Files\Java\jdk-21"
$env:PATH="C:\Program Files\Java\jdk-21\bin;$env:PATH"

# 设置 PowerShell 输出编码为 UTF-8
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 设置 JVM 编码环境变量
$env:JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8"

# 启动应用（使用默认日志配置）
../mvnw -U -s ../maven-settings.xml spring-boot:run
