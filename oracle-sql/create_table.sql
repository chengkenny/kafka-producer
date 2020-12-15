drop table t_owners;

create table t_owners
(
       id number primary key,
       name varchar2(30),
       addressid number,
       housenumber varchar2(30),
       watermeter varchar2(30),
       adddate date,
       ownertypeid number
);

--×·¼Ófield
alter table t_owners add ownertypedesc varchar2(50);

alter table t_owners add (
      remark char(20),
      outdate date
);

-- ÐÞ¸Ä×Ö¶Î

alter table t_owners modify
(
      remark char(20),
      outdate timestamp
);

-- ÐÞ¸Ä×Ö¶ÎÃû
alter table t_owners rename column outdate to extdate;


--É¾³ý×Ö¶ÎÃû
alter table t_owners drop column REMARK;
alter table t_owners drop column extdate;
alter table t_owners drop column ownertypedesc;

-- É¾³ý±í
-- drop table t_owners;

-- Create table
create table T_OWNER_TYPE
(
  id   NUMBER not null,
  name VARCHAR2(30)
)

-- Create/Recreate primary, unique and foreign key constraints 
--alter table T_OWNER_TYPE
--  add constraint PK_OWNER_TYPE_ID primary key (ID)
--  using index 
--  tablespace CBMS
--  pctfree 10
--  initrans 2
--  maxtrans 255;

delete from t_owner_type;
delete from t_owners;

insert into t_owner_type  (id, name) values(1, '  ¾ÓÃñ');
insert into t_owners (ID, NAME, ADDRESSID, HOUSENUMBER, WATERMETER, ADDDATE, OWNERTYPEID)
values(1, 'ÕÅÈý·á',1, '1-1', '123456', sysdate, 1);

insert into t_owners (ID, NAME, ADDRESSID, HOUSENUMBER, WATERMETER, ADDDATE, OWNERTYPEID)
values(2, 'ÇØÊ¼»Ê',1, '1-2', '123456', sysdate, 1);

insert into t_owners (ID, NAME, ADDRESSID, HOUSENUMBER, WATERMETER, ADDDATE, OWNERTYPEID)
values(3, 'ÌÆÌ«×Ú',1, '1-3', '123456', sysdate, 1);

select * from t_owner_type;
select * from t_owners;



