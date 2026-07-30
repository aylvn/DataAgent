-- 备份脚本
mysqldump -h 10.0.4.16 -P 3306 -u data -p sz_data_agent > /usr/local/lnxst/sz-water/db-backup/db20260730.sql
Lxt1234++

-- 恢复脚本 谨慎执行 --
-- mysql -h 10.0.4.16 -P 3306 -u data -p sz_data_agent < /usr/local/lnxst/sz-water/db-backup/db20260730.sql
Lxt1234++