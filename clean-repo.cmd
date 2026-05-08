@echo off
echo 清理本地 Maven 仓库中的校验和文件...

set M2_REPO=%USERPROFILE%\.m2\repository

echo 删除所有 .sha1 文件...
del /s /q "%M2_REPO%\*.sha1"

echo 删除所有 .md5 文件...
del /s /q "%M2_REPO%\*.md5"

echo 删除所有 lastUpdated 文件...
del /s /q "%M2_REPO%\*lastUpdated*"

echo 清理完成！现在重新运行 package.cmd
pause