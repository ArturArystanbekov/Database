CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    salary NUMERIC(10, 2) NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- Insert data into Employees
INSERT INTO employees (name, salary) VALUES
('John Doe', 5000.00),
('Jane Smith', 7000.50),
('Alice Brown', 6000.25),
('Bob White', 4500.75);

-- Insert data into Products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 1000.00),
('Headphones', 'Electronics', 150.00),
('Desk Chair', 'Furniture', 200.00),
('Table Lamp', 'Furniture', 50.00),
('Mouse', 'Electronics', 25.00);

--1
create or replace function increase_value(value integer)
returns integer as $$
    begin
        return value + 10;
    end;
    $$ language plpgsql;

select increase_value(20);
--2
create or replace function compare_numbers(num1 integer, num2 integer)
returns text as $$
    begin
    if num1 > num2 then
        return 'Greater';
    elseif num1 = num2 then
        return 'Equal';
    else
        return 'Lesser';
    end if;
    end;
$$ language plpgsql;

select compare_numbers(10, 20);
select compare_numbers(10, 10);
select compare_numbers(10, 5);
--3
create or replace function number_series(n integer)
returns setof integer as $$
declare
       i integer;
begin
     for i in 1..n loop
         return next i;
     end loop;
     return;
end;
$$ language plpgsql;

select number_series(10);

--4
create or replace function find_employee(em_name text)
returns table(emp_id int, emp_name text, emp_salary numeric) as $$
    begin
        return query
        select id, name, salary
        from employees
        where name = emp_name;
end;
$$ language plpgsql;
select * from find_employee('John%');

--5
create or replace function fetch_product(category_name text)
returns table(product_id int, product_name text, product_price numeric) as $$
    begin
        return query
        select id, name, price
        from products
        where category = category_name;
    end;
    $$ language plpgsql;

select fetch_product('Electronics');

--6a
create or replace function calc_bonus(emp_id integer)
returns numeric as $$
    declare bonus numeric;
    begin
        select salary * 0.1 into bonus
        from employees
        where id = emp_id;
        return bonus;
    end;
    $$ language plpgsql;

--6b
create or replace function update_salary(emp_id integer)
returns void as $$
    declare bonus numeric;
    begin
        bonus := calc_bonus(emp_id);
        update employees set salary = salary + bonus where id = emp_id;
    end;
    $$ language plpgsql;

select calc_bonus(1);
select update_salary(1);

--7
create or replace function combined_calc(num integer, str text)
returns text as $$
declare
    num_result integer;
    str_result text;
begin
    begin
        num_result := (num * 2) + 5;
    end;

    begin
        str_result := 'Processed: ' || upper(str);
    end;

    return 'Numeric: ' || num_result || ', String: ' || str_result;
end;
$$ language plpgsql;

select combined_calc(3, 'hello');