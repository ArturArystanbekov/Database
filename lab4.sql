--Ex1
create database lab4;
--Ex2
create table Warehouses(
    code serial primary key,
    location varchar(255),
    capacity integer
);
create table Boxes(
    code varchar(4),
    contents varchar(255),
    value integer,
    warehouse integer
);
insert into Warehouses(location, capacity) values ('Chicago', 3),
                                                 ('Chicago', 4),
                                                 ('New York', 7),
                                                 ('Los Angeles', 2),
                                                 ('San Francisco', 8);

insert into Boxes(code, contents, value, warehouse)  values ('0MN7', 'Rocks', 180, 3),
                                                           ('4H8P', 'Rocks', 250, 1),
                                                           ('4RT3', 'Scissors', 190, 4),
                                                           ('7G3H', 'Rocks', 200, 1),
                                                           ('8JN6','Papers', 75, 1),
                                                           ('8Y6U', 'Papers', 50 ,3),
                                                           ('9J6F', 'Papers', 175, 2),
                                                           ('LL08', 'Rocks', 140, 4),
                                                           ('P0H6', 'Scissors', 125, 1),
                                                           ('P2T6', 'Scissors', 150, 2),
                                                           ('TU55', 'Papers', 90, 5);
--Ex4
select *from Warehouses;

--Ex5
select *from Boxes
where value > 150;

--Ex6
select distinct contents from Boxes;

--Ex7
select warehouse, count(*) as number_of_boxes from Boxes
group by warehouse
order by warehouse asc;

--Ex8
select warehouse, count(*)  as number_of_boxes from Boxes
group by warehouse
having count(*) > 2
order by warehouse asc;

--Ex9
insert into Warehouses(location, capacity) values ('New York', 3);

--Ex10
insert into boxes(code, contents, value, warehouse) values ('H5RT', 'Papers', 200, 6);

--Ex11
update boxes
set value = value * 0.85
    where value = (
        select value from boxes
        order by value desc
        offset 2 limit 1
        );
--Ex12
delete from boxes
where value < 150;

--Ex13
delete from boxes
where warehouse = (
select code from Warehouses
            where location = 'New York'
            )
returning *;

select *from warehouses;