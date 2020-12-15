create or replace view view_manager as
select * from scott.emp where job = 'MANAGER'
with read only;

--ĞŞ¸ÄÊÓÍ¼
update view_manager set sal = 2977 where empno = 7566;

select * from view_manager;
