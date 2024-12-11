create table Books(
    book_id integer primary key,
    title varchar(255),
    author varchar(255),
    price decimal,
    quantity integer
);

create table Orders(
    order_id integer primary key,
    book_id integer,
    customer_id integer,
    order_date DATE,
    quantity integer,
    foreign key (book_id) references Books(book_id)
);

create table Customers(
    customer_id integer primary key,
    name varchar(255),
    email varchar(255)
);

insert into Books values
  (1, 'Database 101', 'A. Smith', 40.00, 10),
  (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
  (3, 'Advanced DB', 'C.Lee', 50.00, 5);

insert into Customers values
  (101, 'John Doe', 'johndoe@example.com'),
  (102, 'John Doe', 'johndoe@example.com');
--Ex1
begin transaction;

insert into Orders values
    (1, 1, 101, '2024-12-05', 2);
update Books
set quantity = quantity - 2
where book_id = 1;

commit;
--Ex2
begin transaction;

insert into Orders values
    (2, 3, 102, '2024-12-15', 10);
do $$
    begin
        if(select quantity from Books where book_id = 3) >= 10
            then  update  Books set quantity = quantity - 10 where  book_id = 3;
        else
            raise notice 'unsufficient quantity';
        end if;
end $$;
rollback;
--Ex3
begin transaction isolation level read committed;
update Books set price = 25
where book_id = 2;
commit;
--Ex4
begin transaction;

update Customers set email = 'newemail@com'
where customer_id = 102;

commit;