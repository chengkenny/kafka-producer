drop sequence account_seq;
drop sequence address_seq;

DROP TABLE T_OWNERS;
DROP TABLE T_OWNERTYPE;
DROP TABLE T_PRICETAVLE;
DROP TABLE T_AREA;
DROP TABLE T_OPERATOR;
DROP TABLE T_ADDRESS;
DROP TABLE T_ACCOUNT;

-- 业主表
CREATE TABLE T_OWNERS(
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(30),
ADDRESSID NUMBER,
HOUSENUMBER VARCHAR2(30),
ADDDATE DATE,
OWNERTYPEID NUMBER
);

-- 业主类型表
CREATE TABLE T_OWNERTYPE(
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(30)
);

-- 价格表
CREATE TABLE T_PRICETAVLE(
ID NUMBER PRIMARY KEY,
PRICE NUMBER(10, 2),
OWNERTYPEID NUMBER,
MINNUM NUMBER(10,2),
MAXNUM NUMBER(10,2)
);

-- 区域表
CREATE TABLE T_AREA(
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(30)
);

-- 收费员表
CREATE TABLE T_OPERATOR(
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(30)
);

-- 地址表
CREATE TABLE T_ADDRESS(
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(30),
AREAID NUMBER,
OPERATORID NUMBER
);

-- 收费台账表
CREATE TABLE T_ACCOUNT(
ID NUMBER PRIMARY KEY,
OWNERID NUMBER,
OWNERTYPEID NUMBER,
AREAID NUMBER,
YEAR CHAR(4),
MONTH CHAR(2),
NUM0 NUMBER,
NUM1 NUMBER,
USENUM NUMBER,
METERUSERID NUMBER,
NETEDATE DATE,
MONEY NUMBER(10,2),
ISFEE CHAR(1),
FEEDATE DATE,
FEEUSERID NUMBER
);


create sequence account_seq
increment by 1
start with 1
nomaxvalue
nocycle
cache 10; 



insert into t_account values(account_seq.nextval, 1, 1, 1, '2020', '01', 30203, 50123, 0, 1, sysdate, 34.51, '1', to_date('2012-02-14', 'yyyy-MM-dd'), 2);
insert into t_account values(account_seq.nextval, 1, 1, 1, '2020', '02', 50123, 60303, 0, 1, sysdate, 23.43, '1', to_date('2012-03-14', 'yyyy-MM-dd'), 2);
insert into t_account values(account_seq.nextval, 1, 1, 1, '2020', '03', 80991, 90325, 0, 1, sysdate, 45.34, '1', to_date('2012-04-14', 'yyyy-MM-dd'), 2);
insert into t_account values(account_seq.nextval, 1, 1, 1, '2020', '04', 56001, 87322, 0, 1, sysdate, 66.23, '1', to_date('2012-05-14', 'yyyy-MM-dd'), 2);
insert into t_account values(account_seq.nextval, 1, 1, 1, '2020', '05', 86301, 63001, 0, 1, sysdate, 100.32, '1', to_date('2012-06-14', 'yyyy-MM-dd'), 2);

select * From t_account;

create sequence address_seq
increment by 1
start with 800
nomaxvalue
nocycle
cache 100; 

insert into t_address values(address_seq.nextval, '明星花园', 1, 1);
insert into t_address values(address_seq.nextval, '鑫源秋野', 1, 1);
insert into t_address values(address_seq.nextval, '华龙苑南里小区', 1, 1);
insert into t_address values(address_seq.nextval, '湖畔花园', 1, 1);
insert into t_address values(address_seq.nextval, '大悦城', 1, 1);
insert into t_address values(address_seq.nextval, '万达城', 1, 1);
insert into t_address values(address_seq.nextval, '万象城', 1, 1);




select rowid, addr.* from t_address addr;
select * from t_address where rowid = 'AAARUZAAEAAAAJ8AAB'

create table t_indextest(
       id number,
       name varchar2(30)
);

begin
       for x in 1..1000000
         loop
            insert into t_indextest values(x, 'Kenny'||x);
         end loop;
         commit;
end;

create index index_test on t_indextest(name);

select * from t_indextest where id = 765432;
select * from t_indextest where name = 'Kenny765432';

select rowid, t.* from t_indextest t where t.name = 'Kenny765432';

select * from t_indextest where rowid = 'AAARUfAAEAAAAt/ADB';
