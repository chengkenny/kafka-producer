-- ½¨±íÓï¾ä
drop table student;

create table student(
       sid number(4) primary key,
       sname varchar2(50),
       grade varchar2(20),
       sex char(1) default 'M',
       birthday date
);

insert into student values(1000, 'Kenny', 'Java Basic', 'M', to_date('1999-09-06', 'yyyy-MM-dd'));
insert into student values(1001, 'Seri', 'Java Basic', 'M', to_date('1999-09-07', 'yyyy-MM-dd'));
rollback;

insert into student values(1002, 'YY', 'Java Basic', 'M', to_date('1999-09-08', 'yyyy-MM-dd'));
insert into student values(1003, 'Sudden', 'Java Basic', 'M', to_date('1999-09-09', 'yyyy-MM-dd'));

commit;

select * from student;
