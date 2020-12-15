--select * from emp order by sal;

select * from countries;

select * from departments;

select * from dept;

select * from emp;
select * from emp order by sal nulls first;
select * from emp order by sal desc nulls last;

select * from job_grades;

select * from job_history;

select * from locations;

select * from emp where sal > 1500 and sal < 3000;

select 1+1 from dual;

select  ename  姓名, sal 工资 from emp;

select distinct job from emp;

select ename || job from emp;

-- 函数

select count(sal) from emp;

select abs(100),abs(-100) from dual;

select sign(100),sign(-100),sign(0) from dual;

select floor(3.1),floor(2.8+1.3),floor(0) from dual;

select power(2.5,2),power(1.5,0),power(20,-1) from dual;

select mod(23,8),mod(24,8) from dual;

select round(5555.6666,2.1),round(5555.6666,-2.6),round(5555.6666) from dual;

select concat('010-','88888888')||'转23' 高乾竞电话 from dual;

select initcap('smith abc aBC') upp from dual;

select lower('AaBbCcDd')AaBbCcDd from dual;

select nls_initcap('ab cde') "test", nls_initcap('a c b d e','nls_sort= SCHINESE_PINYIN_M') "test1" from dual;

select LTRIM('   gao qian jing',' ') text from dual;

select length('高乾竞'),length('北京市海锭区'),length('北京TO_CHAR') from dual;

select substr('13088888888',3,8) test from dual;

select sysdate  from dual;



select sysdate, add_months(sysdate,-3)  hz from dual;
select to_date(sysdate,'YYYY-MM-DD') from dual;

select sysdate,months_between(sysdate,to_date('2006-01-01','YYYY-MM-DD')), months_between(sysdate,to_date('2016-01-01','YYYY-MM-DD')) from dual;

select current_date from dual;

select localtimestamp from dual;

-- 数值转字符
select 10 + '10' from dual;
select 100 + to_number('20') from dual;

select to_char(sal, '$9,999,999.99') from emp;
select to_char(sal, 'L9,999,999.99') from emp;

select to_char(sal, '9,999,999.99') from emp;
select to_char(sal, 'C9,999,999.99') from emp;

SELECT least(10,32,'123','2006') FROM dual;

select to_char(sysdate,'yyyymmdd') from dual;
select to_char(sysdate,'yyyy') from dual;
select to_char(sysdate,'dd') from dual;--  代表一月的第几天
select to_char(sysdate,'ddd') from dual; --  代表一年的第几天
select to_char(sysdate,'day') from dual;

select * from emp where hiredate between to_date('1981', 'yyyy') and to_date('1985','yyyy') ; 

select nullif(5, 6) from dual;


select * from emp;
select * from dept;
select * from emp, dept where emp.deptno = dept.deptno;

select * from emp e, dept d where e.deptno(+) = d.deptno;

select * from emp e, dept d where e.deptno = d.deptno(+);

select e.empno, e.ename, m.empno, m.ename from emp e, emp m where e.mgr = m.empno(+)

select  e.empno, e.ename, m.empno, m.ename from emp e left join emp m on e.mgr = m.empno;

select * from emp where exists(select * from dept where deptno = 1);

-- 查询有员工的部门的信息

select * from dept d1 where exists (select * from emp e1 where e1.deptno = d1.deptno);

select rowid, rownum, e.empno, e.ename, e.sal from emp e  where rownum <= 3 order by sal desc;


select * from dba_role_privs;





