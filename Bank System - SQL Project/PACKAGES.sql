create or replace package bank_pkg as
    -- New customer
    procedure add_new_customer (
        p_customer_id ın number,
        p_first_name ın varchar2,
        p_last_name ın varchar2,
        p_email ın varchar2,
        p_phone ın varchar2
    );
    
    -- New account
    procedure create_new_account (
        p_account_id ın number,
        p_customer_id ın number,
        p_account_type ın varchar2,
        p_balance ın number
    );
    
    -- New transaction
    procedure record_transaction (
        p_transaction_id ın number,
        p_account_id ın number,
        p_transaction_type ın varchar2,
        p_amount ın number,
        p_transaction_date ın date
    );
    
    -- Total loan amount of customers
    procedure calculate_total_loan (
        p_customer_id ın number
    );
    
    -- Checking customer's balance
    procedure check_balance (
        p_account_id ın number
    );
    
    -- Loan for new customer
    procedure grant_loan (
        p_loan_id ın number,
        p_customer_id ın number,
        p_loan_amount ın number,
        p_loan_date ın date
    );
    procedure delete_customer_account(
        p_customer_id ın number
    );
end bank_pkg;
/

---------------------------------------------------------------------------------------------------------------------------

create or replace package body bank_pkg as

    -- New customer
    procedure add_new_customer (
        p_customer_ıd ın number,
        p_first_name ın varchar2,
        p_last_name ın varchar2,
        p_email ın varchar2,
        p_phone ın varchar2
    ) as
    begin
        ınsert ınto bnkcustomers (customer_ıd, first_name, last_name, email, phone)
        values (p_customer_ıd, p_first_name, p_last_name, p_email, p_phone);
        
        commit;
    end add_new_customer;

    -- New account
    procedure create_new_account (
        p_account_ıd ın number,
        p_customer_ıd ın number,
        p_account_type ın varchar2,
        p_balance ın number
    ) as
    begin
        ınsert ınto accounts (account_ıd, customer_ıd, account_type, balance)
        values (p_account_ıd, p_customer_ıd, p_account_type, p_balance);
        
        commit;
    end create_new_account;

    -- New transaction
    procedure record_transaction (
        p_transaction_ıd ın number,
        p_account_ıd ın number,
        p_transaction_type ın varchar2,
        p_amount ın number,
        p_transaction_date ın date
    ) as
    begin
        ınsert ınto transactions (transaction_ıd, account_ıd, transaction_type, amount, transaction_date)
        values (p_transaction_ıd, p_account_ıd, p_transaction_type, p_amount, p_transaction_date);
        
        update accounts
        set balance = balance + 
                    case 
                        when p_transaction_type = 'deposit' then p_amount
                        when p_transaction_type = 'withdrawal' then -p_amount
                        else 0
                    end
        where account_ıd = p_account_ıd;

        commit;
    end record_transaction;

    -- Total loan amount of customers
    procedure calculate_total_loan (
        p_customer_ıd ın number
    ) as
        v_total_loans number;
    begin
        select sum(loan_amount)
        ınto v_total_loans
        from loans
        where customer_ıd = p_customer_ıd;

        dbms_output.put_lıne('Total loan amount for customer ' || p_customer_ıd || ' is: ' || v_total_loans);
    end calculate_total_loan;

    -- Checking customer's balance
    procedure check_balance (
        p_account_ıd ın number
    ) as
        v_balance number;
    begin
        select balance
        ınto v_balance
        from accounts
        where account_ıd = p_account_ıd;

        dbms_output.put_lıne('The balance for account ' || p_account_ıd || ' is: ' || v_balance);
    end check_balance;

    -- Loan for new customer
    procedure grant_loan (
        p_loan_ıd ın number,
        p_customer_ıd ın number,
        p_loan_amount ın number,
        p_loan_date ın date
    ) as
    begin
        ınsert ınto loans (loan_ıd, customer_ıd, loan_amount, loan_date)
        values (p_loan_ıd, p_customer_ıd, p_loan_amount, p_loan_date);
        
        commit;
    end grant_loan;
    --Delete customer account
    procedure delete_customer_account(
        p_customer_ıd ın number
    ) as
    begin
        -- To delete customer account
        delete from accounts where customer_ıd = p_customer_ıd;

        -- To delete customer information
        delete from customers where customer_ıd = p_customer_ıd;

        commit;
    end delete_customer_account;

end bank_pkg;
/
