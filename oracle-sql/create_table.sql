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

--׷��field
alter table t_owners add ownertypedesc varchar2(50);

alter table t_owners add (
      remark char(20),
      outdate date
);

-- �޸��ֶ�

alter table t_owners modify
(
      remark char(20),
      outdate timestamp
);

-- �޸��ֶ���
alter table t_owners rename column outdate to extdate;


--ɾ���ֶ���
alter table t_owners drop column REMARK;
alter table t_owners drop column extdate;
alter table t_owners drop column ownertypedesc;

-- ɾ����
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

insert into t_owner_type  (id, name) values(1, '  ����');
insert into t_owners (ID, NAME, ADDRESSID, HOUSENUMBER, WATERMETER, ADDDATE, OWNERTYPEID)
values(1, '������',1, '1-1', '123456', sysdate, 1);

insert into t_owners (ID, NAME, ADDRESSID, HOUSENUMBER, WATERMETER, ADDDATE, OWNERTYPEID)
values(2, '��ʼ��',1, '1-2', '123456', sysdate, 1);

insert into t_owners (ID, NAME, ADDRESSID, HOUSENUMBER, WATERMETER, ADDDATE, OWNERTYPEID)
values(3, '��̫��',1, '1-3', '123456', sysdate, 1);

select * from t_owner_type;
select * from t_owners;



