--Ex1
create database lab2;
--Ex2
create table Countries(
    country_id serial primary key,
    country_name varchar,
    region_id int,
    population int
);
--Ex3
insert into Countries(country_name, region_id, population)
values ('USA', 34, 14000000);
--Ex4
insert into Countries(country_id, country_name)
values ( 2, 'France');
--Ex5
insert into Countries(country_name, region_id, population)
values ('Japan', null, 2300000);
--Ex6
insert into Countries(country_name, region_id, population)
values('Qatar', 5, 33443),
      ('Ukraine', 7, 805354),
      ('Brazil', 8, 129345);
--Ex7
alter table Countries
alter column country_name set default 'Kazakhstan';
--Ex8
insert into Countries (country_name)
values(default);
--Ex9
insert into Countries default values;
--Ex10
create table Countries_new (like Countries including all);
--Ex11
insert into Countries_new select * from Countries;
--Ex12
update Countries
set region_id = 1
where region_id is null;
--Ex13
select country_name, population * 1.1 as "New Population" from Countries;
--Ex14
delete from countries where population < 100000;
--Ex15
delete from countries_new where country_id in (select country_id from countries) returning *;
--Ex16
delete from countries returning *;

