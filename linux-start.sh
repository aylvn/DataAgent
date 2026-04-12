kill -9 $(ps -ef | grep data-agent-management | grep -v grep | awk '{print $2}')
cd /usr/local/lnxst/sz-water/data-agent-management
chmod -R 755 ./

# 创建必要的目录
mkdir -p ./dump
mkdir -p ./logs

nohup java -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m -Xms2048m -Xmx3072m -Xss4m \
-XX:+UseZGC -XX:+ZGenerational -XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=./dump/heapdump.hprof \
-XX:ErrorFile=./dump/jvm_error.log \
-Xlog:gc*:file=./dump/gc.log:time,uptime,level,tags:filecount=5,filesize=10m \
-Xlog:safepoint:file=./dump/safepoint.log:time,uptime,level,tags:filecount=5,filesize=10m \
-Xlog:gc+heap:file=./dump/gc-heap.log:time,uptime,level,tags:filecount=5,filesize=10m \
-XX:StackShadowPages=20 \
-Dfile.encoding=UTF-8 \
-jar ./data-agent-management-1.0.0-SNAPSHOT.jar \
>/dev/null 2>&1 &

# 以下命令用于查看日志
tail -f /usr/local/lnxst/sz-water/data-agent-management/logs/*.log

# 以下命令查看进程 前面的数字是pid
ps -ef | grep java

# 查看java应用JVM参数 konaJdk轻量级安装时用不了
jinfo -flags <pid>
