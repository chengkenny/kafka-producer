-- 无条件循环

declare
  v_num number;

begin
  v_num := 1;
  
  loop 
    dbms_output.put_line(v_num);
    v_num:=v_num+1;
    if v_num > 100 then
      exit;
    end if;  
  end loop;

end;

-- 有条件循环

declare
  v_num number;

begin
  v_num := 1;  
  
  while v_num <= 20
    loop
      dbms_output.put_line(v_num);
      v_num := v_num + 1;
    end loop; 
end;

-- for 循环

begin  
  for v_num in 1..100
    loop
      dbms_output.put_line(v_num);
    end loop; 
end;
