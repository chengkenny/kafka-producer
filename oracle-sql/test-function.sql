create or replace function fn_getempname
(v_empno number)
return varchar2
is 
  v_name varchar2(30);
begin
  select ename into v_name from emp where empno=v_empno;
  return v_name;
end;

select 
fn_getempname(7499) from dual;

select * from emp;
