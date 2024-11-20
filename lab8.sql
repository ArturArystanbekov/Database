--Ex2
create table salesman(
    salesman_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(4, 2)
);
create table customers (
    customer_id int primary key,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int,
    foreign key (salesman_id) references salesman(salesman_id)
);
create table orders(
    ord_no int primary key ,
    purch_amt decimal(8, 2),
    ord_date date,
   customer_id int,
    salesman_id int,
    foreign key (salesman_id) references salesman(salesman_id),
    foreign key (customer_id) references customers(customer_id)
);
insert into salesman (salesman_id, name, city, commission) values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Rome', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);
--Ex3
create role junior_dev with login;

--Ex4
create view salesmen_new_york as
select
       salesman_id, name, city, commission
from
    salesman
where
    city = 'New York';

--Ex5
create view order_details as
select
    ord_no as order_number,
    purch_amt as purchase_amount,
    ord_date as order_date,
    cust_name as customer_name,
    name as salesman_name
from
    orders as o
join
    customers as c on o.customer_id = c.customer_id
join
    salesman as s on o.salesman_id = s.salesman_id;

--Ex6
create view highest_grade_customers as
select
    customer_id,
    cust_name,
    city,
    grade,
    salesman_id
from
    customers
where
    grade = (select max(grade) from customers);

--Ex7
create view num_of_salesman as
select
    city,count(salesman_id) as salesman_count
from
    salesman
group by city;

--Ex8

create view salesmen_with_multiple_customers as
select
    s.salesman_id,
    s.name as salesman_name,
    s.city,
    count(customers.customer_id) as customer_count
from
    salesman as s
join
    customers as c on s.salesman_id = c.salesman_id
group by
    s.salesman_id, s.name, s.city
having
    count(c.customer_id) > 1;

--Ex9
create role intern with login ;
grant junior_dev to intern;


