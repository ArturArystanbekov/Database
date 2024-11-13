CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    salary INTEGER,
    department_id INTEGER
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    budget INTEGER
);

INSERT INTO countries (name) VALUES
('United States'),
('Canada'),
('Mexico'),
('Brazil'),
('Argentina'),
('United Kingdom'),
('France'),
('Germany'),
('Italy'),
('Japan');

INSERT INTO employees (name, surname, salary, department_id) VALUES
('John', 'Doe', 50000, 1),
('Jane', 'Smith', 55000, 2),
('Mike', 'Johnson', 60000, 3),
('Emily', 'Davis', 75000, 1),
('William', 'Garcia', 80000, 2),
('David', 'Martinez', 65000, 3),
('Sophia', 'Wilson', 70000, 1),
('James', 'Anderson', 90000, 2),
('Linda', 'Thomas', 85000, 3),
('Michael', 'Moore', 95000, 1);

INSERT INTO departments (budget) VALUES
(100000),
(150000),
(200000),
(250000),
(300000);
--Ex1
create index name_country_index
on countries (name);

select * from countries
         where name = 'Canada';
--Ex2
create index employees_name_surname_index
on employees (name, surname);

select * from employees where name = 'John'
and surname = 'Doe';
--Ex3

create unique index employees_index
on employees(salary);

select * from employees
         where salary < 80000 and salary > 50000;
--Ex4
create index  employees_name_subs_index
on employees(name);

select * from employees
         where substring(name from 1 for 4) = 'John';

--Ex5

create index employees_department_id_index
on employees(department_id, salary);
create index   departments_budget_index
on departments(budget);

select * from employees e
join departments d on d.department_id = e.department_id
where d.budget > 150000 AND e.salary < 80000;