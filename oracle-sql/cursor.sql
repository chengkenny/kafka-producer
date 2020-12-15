
select * from emp ;


/* 无参游标 */


declare

  cursor cur_emptable is select * from emp where job ='SALESMAN'; 
  v_emptable emp%rowtype;
begin
  
  open cur_emptable;   
    loop      
      fetch cur_emptable into v_emptable;        
      exit when cur_emptable%notfound;
        dbms_output.put_line('Employee Name： ' || v_emptable.ename || ', job: ' || v_emptable.job || ', salary: ' || v_emptable.sal);
    end loop;
  close cur_emptable;

end;


/**********************
  
  带参数的游标

**********************/

declare
  cursor cur_emptable(v_job varchar2) is 
  select * from emp where job = v_job; 
  v_emptable emp%rowtype;
begin
  --open cur_emptable('SALESMAN'); 
  open cur_emptable('MANAGER');  
    loop      
      fetch cur_emptable into v_emptable;        
      exit when cur_emptable%notfound;
        dbms_output.put_line('Employee Name： ' || v_emptable.ename || ', job: ' || v_emptable.job || ', salary: ' || v_emptable.sal);
    end loop;
  close cur_emptable;
end;

/**********************
  
  for 循环带参数的游标

**********************/

declare
  cursor cur_emptable(v_job varchar2) is 
         select * from emp where job = v_job; 
  v_emptable emp%rowtype;
begin
  for v_emptable in cur_emptable('MANAGER')
    loop
      dbms_output.put_line('Employee Name： ' || v_emptable.ename || ', job: ' || v_emptable.job || ', salary: ' || v_emptable.sal);
    end loop;
end;
