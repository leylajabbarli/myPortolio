--1.	Bütün müştərilərin adını, soyadını və e-poçt ünvanını əldə edən sorğunu yazın (Customers).
        select firstname,
               lastname,
               email
          from customer;
          
--2.	Aylıq haqqı 50 dollardan az olan bütün abunə planlarının məlumatlarını ekrana çıxardan sorğunu yazın (SubscriptionPlan).  
        select *
          from SubscriptionPlan
         where monthlyfee < 50;
         
--3.	Hər bir müştəri üçün orta zəng müddətini tapın.
        select cust.customerid,
               cust.firstname,
               cust.lastname,
               avg((to_char(callr.endtime,'hh24')*60+to_char(callr.endtime,'mi'))-(to_char(callr.endtime,'hh24')*60+to_char(callr.starttime,'mi'))) as "ortalama_zeng_muddeti(deqiqe ile)"
          from callrecord callr
          right join customer cust
          on callr.customerid = cust.customerid
        group by cust.customerid,
                 cust.firstname,
                 cust.lastname;
       
--4.	2023-cü ilin yanvar ayında hər bir müştəri tərəfindən göndərilən SMS-lərin sayını hesablayın.
        select sms.customerid,
               cust.firstname,
               cust.lastname,
               count(sms.customerid) as "Göndərilən SMS-lərin sayı"
          from smsrecord sms
          join customer cust
          on sms.customerid = cust.customerid
         where messagedate between '01.01.2023' and '31.01.2023'
        group by sms.customerid,
                 cust.firstname,
                 cust.lastname;
        
--5.	Müştəri ID 123-ə məxsus bütün cihazlar üçün cihazın adını və aktivləşdirmə tarixini əldə edin.
        select dev.devicename,
               dev.activationdate
          from device dev
          where dev.customerid in (1,2,3);

--6.	2023-cü ilin fevral ayında hər bir müştəri üçün bütün data istifadəsi sesiyalarının ümumi dəyərini hesablayın. 
        select sum(dat.cost),
               cust.customerid,
               cust.firstname,
               cust.lastname
          from datausagerecord dat
          join customer cust
          on dat.customerid = cust.customerid
          where usagedate between '01.02.2023' and '28.02.2023'
        group by cust.customerid,
                 cust.firstname,
                 cust.lastname;
          
          
--7.	CallRecord cədvəlində bütün zəng edilmiş nömrələrin telefon nömrələrini dublikatsız məlumatları ekrana çıxardan sorğu yazın.
        select distinct callednumber
          from callrecord;
          
--8.	31 may 2023-cü il tarixdə ödəmə tarixi olan bütün müştərilərin adlarını əldə edin.
        select cust.customerid,
               cust.firstname,
               cust.lastname
          from billing bil
          join customer cust
          on bil.customerid = cust.customerid
          join payment pay
          on pay.billingid = bil.billingid
         where pay.paymentdate = '31.05.2023';
 
          
--9.	"893" ilə başlayan SİM nömrəsi olan bütün cihazlar üçün müştəri ID və cihaz növünü tapın.
        select cust.customerid,
               dev.devicetype,
               dev.simnumber
          from device dev
          join customer cust
          on dev.customerid = cust.customerid
        where substr(dev.simnumber,1,3) = '893';
--10.	Ödəniş cədvəlində hər bir müştərinin ödədiyi ümumi məbləği hesablayın.
        select sum(amountpaid) as "ÜMUMİ MƏBLƏĞ",
               cust.customerid,
               cust.firstname,
               cust.lastname
          from payment pay
          join billing bil
          on pay.billingid = bil.billingid
          join customer cust
          on cust.customerid = bil.customerid
        group by cust.customerid,
                 cust.firstname,
                 cust.lastname;

