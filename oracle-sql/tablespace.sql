
-- 删除用户
-- drop user cbmsadm cascade;
drop user cbmsadmin cascade;
drop user cbmsopr cascade;

-- 删除表空间
drop tablespace cbms including contents cascade constraints;

-- 创建表空间
create tablespace cbms
logging
datafile '/home/oracle/app/mydata/cbms.dbf'
size 100m
autoextend on
next 32m maxsize unlimited
extent management local;
 
-- 创建用户
create user cbmsadmin 
identified by "123456"
default tablespace cbms
temporary tablespace temp
quota unlimited on USERS
profile DEFAULT
account unlock;

create user cbmsopr 
identified by "123456"
default tablespace cbms
temporary tablespace temp
quota unlimited on cbms
profile DEFAULT
account unlock;

-- 赋予权限
grant connect, resource, dba to cbmsadmin;
grant connect, resource, dba to cbmsopr;



create tablespace waterboss
datafile '/home/oracle/app/mydata/waterboss.dbf'
size 100m
autoextend on 
next 10m;


create user wateruser
identified by 123
default tablespace waterboss;

grant dba to wateruser;
