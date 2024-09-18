--Ex2
create table Users(
    ID int,
    Firstname varchar(50),
    Lastname varchar(50)
);

--Ex3
alter table Users
    add isadmin int;

--Ex4
alter table Users alter column isadmin type boolean using(isadmin::boolean);

--Ex5
alter table Users alter column isadmin set default false;

--Ex6
alter table Users
add primary key(Id);

--Ex7
create table tasks(
    Id serial primary key,
    name varchar(50),
    user_id int
);

--Ex8
drop table tasks;

--Ex9
drop database "lab1";