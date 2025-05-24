\connect bd_db

create table mock_data(
	id int,
	customer_first_name	varchar,
	customer_last_name varchar,
	customer_age int,
	customer_email varchar,
	customer_country varchar,
	customer_postal_code varchar,
	customer_pet_type varchar,
	customer_pet_name	varchar,
	customer_pet_breed	varchar,
	seller_first_name	varchar,
	seller_last_name	varchar,
	seller_email	varchar,
	seller_country	varchar,
	seller_postal_code	varchar,
	product_name	varchar,
	product_category	varchar,
	product_price	varchar,
	product_quantity	int,
	sale_date	date,
	sale_customer_id int,	
	sale_seller_id	int,
	sale_product_id	int,
	sale_quantity	int,
	sale_total_price	money,
	store_name	varchar,
	store_location	varchar,
	store_city	varchar,
	store_state	varchar,
	store_country	varchar,
	store_phone	varchar,
	store_email	varchar,
	pet_category	varchar,
	product_weight	real,
	product_color	varchar,
	product_size	varchar,
	product_brand	varchar,
	product_material	varchar,
	product_description	varchar,
	product_rating	real,
	product_reviews	int,
	product_release_date date,	
	product_expiry_date	date,
	supplier_name	varchar,
	supplier_contact	varchar,
	supplier_email	varchar,
	supplier_phone	varchar,
	supplier_address	varchar,
	supplier_city	varchar,
	supplier_country varchar
);

copy mock_data
from '/mock_data/MOCK_DATA.csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (1).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (2).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (3).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (4).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (5).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (6).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (7).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (8).csv'
with (format csv, header true);
copy mock_data 
from '/mock_data/MOCK_DATA (9).csv'
with (format csv, header true);


create table pet_category(
	pet_category	varchar,
	id SERIAL primary key
);


create table customer_pet(
	customer_pet_type varchar,
	customer_pet_name	varchar,
	customer_pet_breed	varchar,
	id SERIAL primary key
);

create table customer_location(
	customer_country varchar,
	customer_postal_code varchar,
	id SERIAL primary key
);

create table customer_general(
	customer_first_name	varchar,
	customer_last_name varchar,
	customer_age int,
	id SERIAL primary key
);

create table customer_contacts(
	customer_email varchar,
	id SERIAL primary key
);


create table customer(
	customer_general_id int not null,
	customer_contacts_id int not null,
	customer_location_id int not null,
	customer_pet_id int not null,
	foreign key(customer_general_id) references customer_general(id),
	foreign key(customer_contacts_id) references customer_contacts(id),
	foreign key(customer_location_id) references customer_location(id),
	foreign key(customer_pet_id) references customer_pet(id),
	id SERIAL primary key
);


create table seller_general(
	seller_first_name	varchar,
	seller_last_name	varchar,
	id SERIAL primary key
);

create table seller_location(
	seller_country	varchar,
	seller_postal_code	varchar,
	id SERIAL primary key
);

create table seller_contacts(
	seller_email	varchar,
	id SERIAL primary key
);

create table seller(
	seller_general_id int not null,
	seller_location_id int not null,
	seller_contacts_id int not null,
	foreign key(seller_general_id) references seller_general(id),
	foreign key(seller_location_id) references seller_location(id),
	foreign key(seller_contacts_id) references seller_contacts(id),
	id SERIAL primary key
);


create table store_location_info(
	store_location	varchar,
	store_city	varchar,
	store_state	varchar,
	store_country	varchar,
	id SERIAL primary key
);

create table store_contacts(
	store_phone	varchar,
	store_email	varchar,
	id SERIAL primary key
);

create table store_general(
	store_name	varchar,
	id SERIAL primary key
);

create table store(
	store_general_id int not null,
	store_location_info_id int not null,
	store_contacts_id int not null,
	foreign key(store_general_id) references store_general(id),
	foreign key(store_location_info_id) references store_location_info(id),
	foreign key(store_contacts_id) references store_contacts(id),
	id SERIAL primary key
);



create table product_physical(
	product_weight	real,
	product_color	varchar,
	product_size	varchar,
	product_material	varchar,
	product_description	varchar,
	id SERIAL primary key
);

create table product_feedback(	
	product_rating	real,
	product_reviews	int,
	id SERIAL primary key
);

create table product_branding(
	product_brand	varchar,
	id SERIAL primary key
);

create table product_general(
	product_name	varchar,
	product_category	varchar,
	product_price	varchar,
	product_quantity	int,
	product_release_date date,	
	product_expiry_date	date,
	id SERIAL primary key
);

create table product(
	product_general_id int not null,
	product_physical_id int not null,
	product_feedback_id int not null,
	product_branding_id int not null,
	foreign key(product_general_id) references product_general(id),
	foreign key(product_physical_id) references product_physical(id),
	foreign key(product_feedback_id) references product_feedback(id),
	foreign key(product_branding_id) references product_branding(id),
	id SERIAL primary key
);


create table sale_payment(
	sale_quantity	int,
	sale_total_price	money,
	id SERIAL primary key
);

create table sale(
	sale_date	date,
	sale_customer_id int not null,	
	sale_seller_id	int not null,
	sale_product_id	int not null,
	sale_payment_id int not null,
	foreign key(sale_payment_id) references sale_payment(id),
	foreign key(sale_customer_id) references customer(id),
	foreign key(sale_seller_id) references seller(id),
	foreign key(sale_product_id) references product(id),
	id SERIAL primary key
);


create table supplier_general(
	supplier_name	varchar,
	id SERIAL primary key
);

create table supplier_contacts(
	supplier_contact	varchar,
	supplier_email	varchar,
	supplier_phone	varchar,
	id SERIAL primary key
);

create table supplier_location(
	supplier_address	varchar,
	supplier_city	varchar,
	supplier_country varchar,
	id SERIAL primary key
);


create table supplier(
	supplier_general_id int not null,
	supplier_contacts_id int not null,
	supplier_location_id int not null,
	foreign key(supplier_general_id) references supplier_general(id),
	foreign key(supplier_contacts_id) references supplier_contacts(id),
	foreign key(supplier_location_id) references supplier_location(id),
	id SERIAL primary key
);


create table mock_data_snowflake(
	id serial primary key,
	customer_id int not null,
	seller_id int not null,
	product_id int not null,
	sale_id int not null,
	store_id int not null,
	supplier_id int not null,
	pet_category_id int not null,
	foreign key(customer_id) references customer(id),
	foreign key(seller_id) references seller(id),
	foreign key(product_id) references product(id),
	foreign key(sale_id) references sale(id),
	foreign key(store_id) references store(id),
	foreign key(supplier_id) references supplier(id),
	foreign key(pet_category_id) references pet_category(id)
);



insert into pet_category
select distinct pet_category from mock_data;


insert into customer_pet 
select distinct customer_pet_type,	customer_pet_name, customer_pet_breed from mock_data;

insert into customer_location 
select distinct customer_country, customer_postal_code from mock_data;

insert into customer_general 
select distinct customer_first_name, customer_last_name, customer_age from mock_data;

insert into customer_contacts
select distinct customer_email from mock_data;

insert into customer (customer_general_id, customer_contacts_id, customer_location_id, customer_pet_id)
select distinct gen.id, con.id, loc.id, pet.id 
from mock_data moc
join customer_pet pet on 
	pet.customer_pet_type = moc.customer_pet_type and 
	pet.customer_pet_name = moc.customer_pet_name and 
	pet.customer_pet_breed = moc.customer_pet_breed	
join customer_location loc on
	loc.customer_country = moc.customer_country and
	loc.customer_postal_code = moc.customer_postal_code 
join customer_general gen on
	gen.customer_first_name = moc.customer_first_name and
	gen.customer_last_name = moc.customer_last_name and
	gen.customer_age = moc.customer_age
join customer_contacts con on
	con.customer_email = moc.customer_email;

insert into seller_general 
select distinct seller_first_name, seller_last_name from mock_data;

insert into seller_location
select distinct seller_country, seller_postal_code from mock_data;

insert into seller_contacts
select distinct seller_email from mock_data;


insert into seller (seller_general_id, seller_contacts_id, seller_location_id)
select distinct gen.id, con.id, loc.id 
from mock_data moc
join seller_contacts con on 
	con.seller_email = moc.seller_email
join seller_location loc on
	loc.seller_country = moc.seller_country and
	loc.seller_postal_code = moc.seller_postal_code 
join seller_general gen on
	gen.seller_first_name = moc.seller_first_name and
	gen.seller_last_name = moc.seller_last_name;



insert into store_location_info 
select distinct store_location, store_city, store_state, store_country from mock_data;

insert into store_contacts
select distinct store_phone, store_email from mock_data;

insert into store_general 
select distinct store_name from mock_data;

insert into store (store_general_id, store_contacts_id, store_location_info_id)
select distinct gen.id, con.id, loc.id 
from mock_data moc
join store_contacts con on 
	con.store_email = moc.store_email and
	con.store_phone = moc.store_phone
join store_location_info loc on
	loc.store_location = moc.store_location and
	loc.store_city = moc.store_city and
	loc.store_state = moc.store_state and
	loc.store_country = moc.store_country
join store_general gen on
	gen.store_name = moc.store_name;

-- Insert into product_physical
INSERT INTO product_physical
SELECT DISTINCT product_weight, product_color, product_size, product_material, product_description 
FROM mock_data;

-- Insert into product_feedback
INSERT INTO product_feedback
SELECT DISTINCT product_rating, product_reviews 
FROM mock_data;

-- Insert into product_branding
INSERT INTO product_branding
SELECT DISTINCT product_brand 
FROM mock_data;

-- Insert into product_general
INSERT INTO product_general 
SELECT DISTINCT product_name, product_category, product_price, product_quantity, product_release_date, product_expiry_date
FROM mock_data;

-- Insert into product (joining all product dimension tables)
INSERT INTO product (
    product_general_id, product_physical_id, 
    product_feedback_id, product_branding_id
)
SELECT DISTINCT 
    gen.id, phys.id, fb.id, br.id
FROM mock_data moc
JOIN product_general gen ON
    gen.product_name = moc.product_name AND
    gen.product_category = moc.product_category AND
    gen.product_price = moc.product_price
JOIN product_physical phys ON
    phys.product_weight = moc.product_weight AND
    phys.product_color = moc.product_color AND
    phys.product_size = moc.product_size AND
    phys.product_material = moc.product_material
JOIN product_feedback fb ON
    fb.product_rating = moc.product_rating AND
    fb.product_reviews = moc.product_reviews
JOIN product_branding br ON
    br.product_brand = moc.product_brand;

   
-- Insert into supplier_general
INSERT INTO supplier_general
SELECT DISTINCT supplier_name 
FROM mock_data;

-- Insert into supplier_contacts
INSERT INTO supplier_contacts 
SELECT DISTINCT supplier_contact, supplier_email, supplier_phone 
FROM mock_data;

-- Insert into supplier_location
INSERT INTO supplier_location 
SELECT DISTINCT supplier_address, supplier_city, supplier_country 
FROM mock_data;

-- Insert into supplier (joining all supplier dimension tables)
INSERT INTO supplier (
    supplier_general_id, supplier_contacts_id, supplier_location_id
)
SELECT DISTINCT 
    gen.id, con.id, loc.id
FROM mock_data moc
JOIN supplier_general gen ON
    gen.supplier_name = moc.supplier_name
JOIN supplier_contacts con ON
    con.supplier_contact = moc.supplier_contact AND
    con.supplier_email = moc.supplier_email AND
    con.supplier_phone = moc.supplier_phone
JOIN supplier_location loc ON
    loc.supplier_address = moc.supplier_address AND
    loc.supplier_city = moc.supplier_city AND
    loc.supplier_country = moc.supplier_country;

-- Insert into sale_payment
INSERT INTO sale_payment 
SELECT DISTINCT sale_quantity, sale_total_price 
FROM mock_data;

INSERT INTO sale (
    sale_date,
	sale_customer_id,	
	sale_seller_id,
	sale_product_id,
	sale_payment_id
)
SELECT DISTINCT 
	moc.sale_date,
	moc.sale_customer_id,
	moc.sale_seller_id,
	moc.sale_product_id,
	pay.id 
FROM mock_data moc
JOIN sale_payment pay ON
    pay.sale_quantity = moc.sale_quantity and
    pay.sale_total_price = moc.sale_total_price;


INSERT INTO mock_data_snowflake (
    customer_id,
    seller_id,
    product_id,
    sale_id,
    store_id,
    supplier_id,
    pet_category_id
)
SELECT DISTINCT
    cust.id AS customer_id,
    sell.id AS seller_id,
    prod.id AS product_id,
    sal.id AS sale_id,
    sto.id AS store_id,
    sup.id AS supplier_id,
    cat.id AS pet_category_id
FROM mock_data moc
JOIN customer cust ON 
    cust.id = moc.sale_customer_id
JOIN seller sell ON 
    sell.id = moc.sale_seller_id
JOIN product prod ON 
    prod.id = moc.sale_product_id
JOIN sale sal ON 
    sal.sale_customer_id = cust.id AND
    sal.sale_seller_id = sell.id AND
    sal.sale_product_id = prod.id AND
    sal.sale_date = moc.sale_date
JOIN store_contacts scon ON 
    scon.store_email = moc.store_email AND 
    scon.store_phone = moc.store_phone
JOIN store_location_info sloc ON 
    sloc.store_location = moc.store_location AND
    sloc.store_city = moc.store_city AND
    sloc.store_state = moc.store_state AND
    sloc.store_country = moc.store_country
JOIN store_general sgen ON 
    sgen.store_name = moc.store_name
JOIN store sto ON 
    sto.store_contacts_id = scon.id AND 
    sto.store_location_info_id = sloc.id AND 
    sto.store_general_id = sgen.id
JOIN supplier_contacts supcon ON 
    supcon.supplier_contact = moc.supplier_contact AND 
    supcon.supplier_email = moc.supplier_email AND 
    supcon.supplier_phone = moc.supplier_phone
JOIN supplier_location suploc ON 
    suploc.supplier_address = moc.supplier_address AND 
    suploc.supplier_city = moc.supplier_city AND 
    suploc.supplier_country = moc.supplier_country
JOIN supplier_general supgen ON 
    supgen.supplier_name = moc.supplier_name
JOIN supplier sup ON 
    sup.supplier_contacts_id = supcon.id AND 
    sup.supplier_location_id = suploc.id AND 
    sup.supplier_general_id = supgen.id
JOIN pet_category cat ON 
    cat.pet_category = moc.pet_category;

select * from mock_data_snowflake
