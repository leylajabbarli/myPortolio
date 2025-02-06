create table bnkcustomers (
    customer_ıd number primary key, 
    first_name varchar2(50), 
    last_name varchar2(50), 
    email varchar2(100),   
    phone varchar2(15)  
);

create table accounts (
    account_id number prımary key,
    customer_id number, 
    account_type varchar2(20), 
    balance number(10, 2) default 0  
);

create table transactions (
    transaction_id number prımary key,
    account_id number,
    transaction_type varchar2(20),
    amount number(10, 2),
    transaction_date date default sysdate  
);

create table loans (
    loan_ıd number primary key,
    customer_ıd number,
    loan_amount number(10, 2),
    loan_date date default sysdate  
);

------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO bnkcustomers (customer_id, first_name, last_name, email, phone)
VALUES (5, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-9876');

INSERT INTO bnkcustomers (customer_id, first_name, last_name, email, phone)
VALUES (6, 'Sarah', 'Williams', 'sarah.williams@example.com', '555-6543');

INSERT INTO bnkcustomers (customer_id, first_name, last_name, email, phone)
VALUES (7, 'David', 'Miller', 'david.miller@example.com', '555-1122');

INSERT INTO bnkcustomers (customer_id, first_name, last_name, email, phone)
VALUES (8, 'Sophia', 'Wilson', 'sophia.wilson@example.com', '555-3344');

INSERT INTO bnkcustomers (customer_id, first_name, last_name, email, phone)
VALUES (9, 'James', 'Moore', 'james.moore@example.com', '555-5566');

INSERT INTO bnkcustomers (customer_id, first_name, last_name, email, phone)
VALUES (10, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '555-7788');

---------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (6, 5, 'saving', 6000.50);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (7, 5, 'checking', 200.25);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (8, 6, 'saving', 1500.75);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (9, 7, 'checking', 500.10);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (10, 8, 'saving', 3200.40);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (11, 9, 'checking', 900.60);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (12, 10, 'saving', 7000.20);

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES (13, 10, 'checking', 450.00);
----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (6, 6, 'deposit', 1500.00, TO_DATE('2025-02-06', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (7, 7, 'withdrawal', 200.00, TO_DATE('2025-02-07', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (8, 8, 'deposit', 2500.00, TO_DATE('2025-02-08', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (9, 9, 'withdrawal', 150.00, TO_DATE('2025-02-09', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (10, 10, 'deposit', 1200.00, TO_DATE('2025-02-10', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (11, 11, 'withdrawal', 50.00, TO_DATE('2025-02-11', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (12, 12, 'deposit', 800.00, TO_DATE('2025-02-12', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (13, 13, 'withdrawal', 300.00, TO_DATE('2025-02-13', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (14, 6, 'deposit', 250.00, TO_DATE('2025-02-14', 'YYYY-MM-DD'));

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES (15, 7, 'withdrawal', 400.00, TO_DATE('2025-02-15', 'YYYY-MM-DD'));

---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO loans (loan_id, customer_id, loan_amount, loan_date)
VALUES (5, 5, 7000.00, TO_DATE('2025-02-01', 'YYYY-MM-DD'));

INSERT INTO loans (loan_id, customer_id, loan_amount, loan_date)
VALUES (6, 6, 15000.00, TO_DATE('2025-02-02', 'YYYY-MM-DD'));

INSERT INTO loans (loan_id, customer_id, loan_amount, loan_date)
VALUES (7, 7, 10000.00, TO_DATE('2025-02-03', 'YYYY-MM-DD'));

INSERT INTO loans (loan_id, customer_id, loan_amount, loan_date)
VALUES (8, 8, 20000.00, TO_DATE('2025-02-04', 'YYYY-MM-DD'));

INSERT INTO loans (loan_id, customer_id, loan_amount, loan_date)
VALUES (9, 9, 12000.00, TO_DATE('2025-02-05', 'YYYY-MM-DD'));

INSERT INTO loans (loan_id, customer_id, loan_amount, loan_date)
VALUES (10, 10, 25000.00, TO_DATE('2025-02-06', 'YYYY-MM-DD'));

select * from loans;
select * from bnkcustomers;
select * from transactions;
select * from accounts;

