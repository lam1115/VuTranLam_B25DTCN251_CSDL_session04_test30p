create database ShopManeger;
use ShopManager;

create table Categories (
	category_id int primary key,
    category_name varchar(255)
);

create table products (
	product_id int primary key,
    product_name varchar(255),
    price decimal(18,2),
    stock int not null,
    category_id int not null,
    foreign key(category_id) references categories(category_id)
);

-- Thêm dữ liệu category
insert into categories values
(1, 'Điện tử'),
(2, 'Thời trang');

-- Thêm dữ liệu product
insert into products values
(1, 'iPhone 15', 25000000, 10, 1),
(2, 'Samsung S23 ', 20000000, 5, 1),
(3, 'Áo sơ mi nam ', 500000, 50, 2),
(4, 'Giày thể thao ', 1200000, 20, 2);

-- Cập nhật giá iphone15
update products
set price = 26000000 where product_name = 'iPhone 15';

-- Tăng số lượng tồn kho lên 10 cho tất cả sản phẩm
update products
set stock = stock + 10
where category_id = 1;

-- Xóa sản phẩm có id = 4
delete from products where product_id = 4;

-- Xóa tất cả sản phẩm có giá nhỏ hơn 1000000
delete from products where price < 1000000;

-- Lấy tất cả sản phẩm
select * from products;

-- Lấy danh sách sản phẩm có số lượng lớn hơn 15
select * from products where stock > 15;

-- Lấy danh sách sản phẩm có giá từ 1000000 đến 25000000
select * from products where price >= 1000000 and price <= 25000000;

-- Lấy sản phẩm tên không phải iPhone 15 và còn trong kho
select * from products where product_name <> 'iPhone 15' and stock > 0;

-- Lấy sản phẩm không thục danh mục 1 và có giá hơn 500000
select * from products where category_id <> 1 and price > 500000;
