drop table DD_ACCOUNT;
drop table customer_account;
drop table account_balance;
drop table customer_account_hold;

create table DD_ACCOUNT (
       country_code varchar2(2),
       group_member varchar2(4),
       account_branch number(3,0),
       account_serial number(6,0),
       account_suffix number(3,0), 
       product_type varchar2(3),
       currency varchar2(3), 
       customer_group_member varchar2(4), 
       customer_branch number(3,0),
       customer_serial number(6,0), 
       short_name varchar2(28),
       short_name_in_local_lang varchar2(28),
       restriction_code char(1),
       account_status char(1),
       ledger_balance number(20,3),
       ledger_balance_local_currency number(20,3),
       passbook_balance number(20,3),
       total_hold number(20,3),
       sync_time timestamp,
);

create table customer_account(
       customer_account_number varchar2(50),
       account_country_code varchar2(2),
       hsbc_legal_entity_code varchar2(4),
       account_branch_code varchar2(500),
       account_serial_number varchar2(500), 
       account_suffix_code varchar2(500),
       currency_code varchar2(3),
       customer_number varchar2(30), 
       distribute_product_code varchar2(3),
       short_name varchar2(28),
       short_name_in_local_lang varchar2(28),
       restriction_code char(1),
       account_status char(1),
       constraint customer_account_pk primary key(customer_account_number)
);

create table account_balance(
    customer_account_number varchar2(50),
    balance_type_code varchar2(255),
    balance_amount number(20,3)   
);

create table customer_account_hold(
    customer_account_number varchar2(50),
    hold_type_code varchar2(255),
    hold_amount number(20,3)   
);
