create database SmartPhoneStore;
use SmartPhoneStore;

create table Product (
	product_id int primary key,
    product_name varchar(100) not null,
    product_type varchar(100) not null,
    price decimal(10,2),
    quantity int
);

create table Customer (
	customer_id int primary key,
    customer_name varchar(100) not null,
    customer_email varchar(100),
    phone varchar(10),
    membership_level varchar(10)
);

create table Orders (
	order_id int primary key,
    customer_id int,
    order_date date,
    total_price decimal(10,2),
    primary key (order_id, customer_id),
    foreign key (customer_id) references Customer(customer_id)
);

create table Order_Detail (
	order_id int primary key,
    product_id int,
    quantity int,
    selling_price decimal(10,2),
    foreign key (order_id) references Orders(order_id)
);

alter table Product
add column warranty_period date;

alter table Customer
change membership_level customer_level varchar(10);

set sql_safe_updates = 0;

-- delete from Customer;
-- delete from Orders;
-- delete from Order_Detail;
-- delete from Product;
drop table Order_Detail;
drop table Orders;

insert into Product
values 
(101,'iPhone 15', 'SmartPhone',17000000, 10),
(202,'Samsung Galaxy Note 8', 'SmartPhone', 12000000, 23),
(303,'Dây Sạc', 'Accessories', 700000, 15),
(404,'iPhone 17 Air', 'SmartPhone', 24000000, 20),
(505,'Macbook Air M4', 'Laptop', 36000000, 16);

insert into Customer
values
(1,'Nguyễn Văn A', 'nguyenvana@gmail.com', '0123456789', 'Gold'),
(2,'Phạm Thị B', 'phamthib@gmail.com', '0147852369', 'Bronze'),
(3,'Lê Thị C', 'lethic@gmail.com', '0112233444', 'Silver'),
(4,'Hoàng Văn D', 'hoangvand@gmail.com', '0265879426', 'Bronze'),
(5,'Huỳnh Văn E', 'huynhvane@gmail.com', '0597483615', 'Gold');

insert into Orders
values
(1,1,'2026-5-2',24000000),
(2,2,'2026-1-5',1400000),
(3,3,'2026-1-10',17000000),
(4,4,'2026-2-6', 17000000),
(5,5,'2026-5-8', 0);

insert into Order_Detail
values
(1,404,1,24100000),
(2,303,1,1410000),
(3,101,1,17110000),
(4,101,1,17110000),
(5,202,0,0);

update Product
set price = price*0.9
where product_type= 'Accessories';

delete from Orders
where total_price = 0;

select * from Product
where price > 15000000;

select * from Customer
where customer_level = 'Gold' or customer_level = 'Silver';

select * from Product
where  product_name = 'Samsung Galaxy Note 8' and quantity > 20;

alter table Order_Detail
add column totalPrice decimal(10,2);



















