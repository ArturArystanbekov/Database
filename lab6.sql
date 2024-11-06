--Ex2
create table locations(
    location_id serial primary key,
    street_adress varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
create table departments(
    department_id serial primary key ,
    department_name varchar(50) unique ,
    budget int,
    location_id integer references locations
);
create table employees(
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    department_id integer references departments
);
insert into locations (street_adress, postal_code, city, state_province) VALUES
('123 Main St', '12345', 'Springfield', 'IL'),
('456 Elm St', '54321', 'Gotham', 'NY'),
('789 Maple Ave', '67890', 'Metropolis', 'CA');

insert into departments (department_name, budget, location_id) VALUES
('HR', 50000, 1),
('Engineering', 150000, 2),
('Marketing', 75000, 3),
('Finance', 100000, 1),
('Support', 60000, NULL);

insert into employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
('John', 'Doe', 'johndoe@example.com', '123-456-7890', 60000, 1),
('Jane', 'Smith', 'janesmith@example.com', '987-654-3210', 80000, 2),
('Alice', 'Johnson', 'alicej@example.com', '555-123-4567', 70000, 3),
('Bob', 'Brown', 'bobb@example.com', '444-987-6543', 50000, 4),
('Charlie', 'Davis', 'charlied@example.com', '333-444-5555', 45000, NULL);
--Ex3
select
    employees.first_name,
    employees.last_name,
    employees.department_id,
    departments.department_name
from
    employees
join
    departments ON employees.department_id = departments.department_id;
--Ex4
select
    employees.first_name,
    employees.last_name,
    employees.department_id,
    departments.department_name
from
    employees
join
    departments ON employees.department_id = departments.department_id
where employees.department_id in (80, 40);
--Ex5
select
    employees.first_name,
    employees.last_name,
    employees.department_id,
    departments.department_name,
    locations.city,
    locations.state_province
from
    employees
join
    departments on employees.department_id = departments.department_id
join
    locations on locations.location_id = departments.department_id;
--Ex6
select
    departments.department_id,
    departments.department_name,
    employees.first_name,
    employees.last_name,
    employees.department_id
from
    departments
left join
    employees on departments.department_id = employees.department_id;
--Ex7
select
    employees.first_name,
    employees.last_name,
    employees.department_id,
    departments.department_name
from
    employees
left join
    departments on employees.department_id = departments.department_id;