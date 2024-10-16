--Ex1
create database lab5;
--Ex2
create table customers(
    customer_id int primary key,
    cust_name varchar(255),
    city varchar(255),
    grade int,
    salesman_id int
);

create table orders(
    order_no int primary key,
    purch_amt double precision,
    ord_date date,
    customer_id int,
    salesman_id int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (salesman_id) references salesmen(salesman_id)
);
create table salesmen(
    salesman_id int primary key,
    name varchar(255),
    city varchar(255),
    comission double precision
);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

INSERT INTO salesmen (salesman_id, name, city, comission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

--Ex3
select sum(purch_amt) as total_purch_amount
from orders;

--Ex4
select avg(purch_amt) as average_pur_amount
from orders;

--Ex5
select count(cust_name) from customers
where cust_name notnull;

--Ex6
select min(purch_amt) as min_purch_amount
from orders;

--Ex7
select *from customers
where cust_name like '%b';

--Ex8
select order_no from orders
where customer_id in (
    select customer_id from customers
                       where city = 'New York'
);

--Ex9
select *from customers
where customer_id in(
    select customer_id from orders
                       where purch_amt > 10
    );

--Ex10
select sum(grade) as total_grade
from customers;

--Ex11
select *from customers
where cust_name notnull;

--Ex12
select max(grade) as max_grade
from customers;


