create or replace trigger tri_dd_account
  after delete or insert or delete ON dd_account  
  for each row

declare

  v_acctnum varchar2(18);
  v_custnum varchar2(15); 
  v_count number(10);
  v_total_hod constant varchar2(20) := 'Total Hold Amount';
  v_ledger_bal constant  varchar2(20) := 'Ledger Balance';
  v_passbook_bal constant varchar2(20) := 'Passbook Balance';

begin 

   v_acctnum := :new.country_code || :new.group_member || to_char(:new.account_branch, 'fm000') ||
               to_char(:new.account_serial, 'fm000000')|| to_char(:new.account_suffix, 'fm000');
                      
   v_custnum := :new.country_code || :new.customer_group_member || to_char(:new.customer_branch, 'fm000') ||
               to_char(:new.customer_serial, 'fm000000');    
               
   IF INSERTING OR UPDATING THEN  
               
      select count(customer_account_number) into v_count from customer_account where customer_account_number = v_acctnum;
      if v_count = 0 then               
         insert into customer_account values(v_acctnum,:new.country_code, :new.group_member,
                :new.account_branch,:new.account_serial, :new.account_suffix, :new.currency, v_custnum,
                :new.product_type, :new.short_name, :new.short_name_in_local_lang, :new.restriction_code,
                :new.account_status);
     else
         
         update customer_account set 
                account_country_code = :new.country_code, 
                hsbc_legal_entity_code = :new.group_member,
                account_branch_code = :new.account_branch,
                account_serial_number = :new.account_serial, 
                account_suffix_code = :new.account_suffix, 
                currency_code = :new.currency, 
                customer_number = v_custnum,
                distribute_product_code = :new.product_type, 
                short_name = :new.short_name, 
                short_name_in_local_lang = :new.short_name_in_local_lang, 
                restriction_code = :new.restriction_code,
                account_status = :new.account_status 
                where customer_account_number = v_acctnum;
      end if;
  
      select count(customer_account_number) into v_count from customer_account_hold 
             where customer_account_number = v_acctnum and hold_type_code = v_total_hod;  
  
      if v_count = 0 then     
         insert into customer_account_hold values(v_acctnum, v_total_hod, :new.total_hold); 
      else
          update customer_account_hold set hold_amount = :new.total_hold
               where customer_account_number = v_acctnum and hold_type_code = v_total_hod;   
      end if;
 
      
      select count(customer_account_number) into v_count from account_balance 
             where customer_account_number = v_acctnum and balance_type_code = v_ledger_bal; 
 
      if v_count = 0 then     
         insert into account_balance values(v_acctnum, v_ledger_bal, :new.ledger_balance_local_currency); 
      else
         update account_balance set balance_amount = :new.ledger_balance_local_currency
              where customer_account_number = v_acctnum and balance_type_code = v_ledger_bal; 
      end if;
  
      select count(customer_account_number) into v_count from account_balance 
             where customer_account_number = v_acctnum and balance_type_code = v_passbook_bal; 
  
      if v_count = 0 then     
         insert into account_balance values(v_acctnum, v_passbook_bal, :new.passbook_balance);
      else
         update account_balance set balance_amount = :new.passbook_balance
              where customer_account_number = v_acctnum and balance_type_code = v_passbook_bal; 
      end if; 
       
  END IF;   

   
  IF DELETING THEN 
        
      v_acctnum := :old.country_code || :old.group_member || to_char(:old.account_branch, 'fm000') ||
               to_char(:old.account_serial, 'fm000000')|| to_char(:old.account_suffix, 'fm000');
                      
      v_custnum := :old.country_code || :old.customer_group_member || to_char(:old.customer_branch, 'fm000') ||
               to_char(:old.customer_serial, 'fm000000');   
      
     delete from customer_account where customer_account_number = v_acctnum;               
     delete from customer_account_hold where customer_account_number = v_acctnum and hold_type_code = v_total_hod; 
     delete from account_balance where customer_account_number = v_acctnum and balance_type_code = v_ledger_bal;
     delete from account_balance where customer_account_number = v_acctnum and balance_type_code = v_passbook_bal;   
       
  END IF;
    
end;
