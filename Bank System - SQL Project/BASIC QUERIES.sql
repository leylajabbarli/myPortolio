--Total customer balances and loan amount( JOIN and GROUP BY)
select c.first_name,
       c.last_name,
       sum(a.balance) as total_balance,
       sum(l.loan_amount) as total_loans
from bnkcustomers c
left join accounts a on c.customer_ıd = a.customer_ıd
left join loans l on c.customer_ıd = l.customer_ıd
group by c.customer_ıd, c.first_name, c.last_name
order by total_balance desc;

--Customers with the most transactions ( JOIN, COUNT and GROUP BY )
select c.first_name, c.last_name,
       count(t.transaction_ıd) as transaction_count
from bnkcustomers c
join accounts a on c.customer_ıd = a.customer_ıd
join transactions t on a.account_ıd = t.account_ıd
group by c.customer_ıd, c.first_name, c.last_name
order by transaction_count desc;

--Customers with the largest loans (JOIN and ORDER BY)
select c.first_name, c.last_name, l.loan_amount
from bnkcustomers c
join loans l on c.customer_ıd = l.customer_ıd
order by l.loan_amount desc
fetch first 3 rows only;

--Customer balances by transaction type (CASE and GROUP BY)
select c.first_name, c.last_name,
       sum(case when t.transaction_type = 'deposit' then t.amount else 0 end) as total_deposits,
       sum(case when t.transaction_type = 'withdrawal' then t.amount else 0 end) as total_withdrawals
from bnkcustomers c
join accounts a on c.customer_ıd = a.customer_ıd
join transactions t on a.account_ıd = t.account_ıd
group by c.customer_ıd, c.first_name, c.last_name
order by c.last_name;

--Calculating the average balance by account (AVG and GROUP BY)
select a.account_type,
       avg(a.balance) as average_balance
from accounts a
group by a.account_type
order by average_balance desc;

--Customers with the most transactions in the last 30 days (JOIN, WHERE and ORDER BY)
select c.first_name, c.last_name,
       count(t.transaction_ıd) as transaction_count
from bnkcustomers c
join accounts a on c.customer_ıd = a.customer_ıd
join transactions t on a.account_ıd = t.account_ıd
where t.transaction_date >= sysdate - 30
group by c.customer_ıd, c.first_name, c.last_name
order by transaction_count desc;

--Customer balance and last transaction date
select c.first_name, c.last_name, a.balance,
       (select t.transaction_date
        from transactions t 
        where t.account_ıd = a.account_ıd
        order by t.transaction_date desc
        fetch first 1 rows only) as last_transaction_date
from bnkcustomers c
join accounts a on c.customer_ıd = a.customer_ıd
order by last_transaction_date desc;

--Total bank loans and balances (SUM and GROUP BY)
select sum(a.balance) as total_balance,
       sum(l.loan_amount) as total_loans
from accounts a
join loans l on a.customer_ıd = l.customer_ıd;

--Account status (SUM and HAVING)
select a.account_type,
       count(a.account_ıd) as account_count, 
       sum(a.balance) as total_balance
from accounts a
group by a.account_type
having sum(a.balance) > 10000;  -- Toplam balans 10,000-dən çox olan hesablar










