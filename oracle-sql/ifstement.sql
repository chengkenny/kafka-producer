declare
  
  V_price number(10,2);  --����  
  V_usernum number;  --ˮ������
  V_usernum2 number(10,2);  --����
  V_money number(10,2);  -- ���

begin
  V_price := 2.45;
  V_usernum := 9213;
  V_usernum2 := round(V_usernum/1000,2);
  V_money := V_price * V_usernum2;
  
  dbms_output.put_line('��'||V_money);
  
end;



declare
  
  v_price1 number(10,2);  --����  
  v_price2 number(10,2);  --����  
  v_price3 number(10,2);  --����  
  
  v_usernum number;  --ˮ������
  v_usernum2 number(10,2);  --����
  v_money number(10,2);  -- ���

begin
  v_price1 := 2.45;
  v_price2 := 3.45;
  v_price3 := 4.45;
  
  v_usernum := 9213;
  
  v_usernum2 := round(v_usernum/1000,2);
  
  if v_usernum2 <= 5 then
    v_money := v_usernum2 * v_price1;
  elsif  v_usernum2 > 5 and v_usernum2 <= 10 then 
    v_money := 5 * v_price1 + (v_usernum2 - 5) * v_price2; 
  elsif  v_usernum2 > 10 then 
    v_money := 5 * v_price1 + (v_usernum2 - 10) * v_price3;
  else
    v_money := 5 * v_price1 + 5 * v_price2 + (v_usernum2 - 10) * v_price3;
  end if;
    
  dbms_output.put_line('��'||v_money);
  
end;
