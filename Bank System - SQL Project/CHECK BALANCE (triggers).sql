create table account_warnings (
    account_id number not null,
    warning_message varchar2(255) not null,
    created_at date default sysdate 
);


create or replace trigger trg_balance_check
after update on accounts
for each row
begin
    -- Balansın vəziyyətinə görə xəbərdarlıq mesajı əlavə olunur
    insert into account_warnings (account_id, warning_message, created_at)
    values (
        :new.account_id,
        case 
            when :new.balance = 0 then 'Warning: Account balance is zero'
            when :new.balance < 0 then 'Warning: Account balance is negative'
            else null 
        end,
        sysdate
    );
end;
/


