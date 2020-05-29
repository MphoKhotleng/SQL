CREATE DATABASE Umuzi;

USE Umuzi;

CREATE TABLE Customers(
customer_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(7),
address VARCHAR(200),
phone BIGINT,
email VARCHAR(100),
city VARCHAR(20),
country VARCHAR(50),
PRIMARY KEY(customer_id)
);

CREATE TABLE Employees(
employee_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
job_title VARCHAR(20),
PRIMARY KEY(employee_id)
);

CREATE TABLE Products(
product_id INT NOT NULL AUTO_INCREMENT,
product_name VARCHAR(100),
description VARCHAR(300),
buy_price DECIMAL,
PRIMARY KEY(product_id)
);

CREATE TABLE Payments(
payment_id INT NOT NULL AUTO_INCREMENT,
customer_id INT ,
payment_date DATETIME,
amount DECIMAL,	
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id) ON DELETE SET NULL,
PRIMARY KEY(payment_id)
);

CREATE TABLE Orders(
order_id INT NOT NULL AUTO_INCREMENT ,
product_id INT,
payment_id INT,
fullfilled_by_employee_id INT,
date_required DATETIME,
date_shipped DATETIME,
status VARCHAR(20),
FOREIGN KEY(product_id) REFERENCES Products(product_id) ON DELETE SET NULL,
FOREIGN KEY(payment_id) REFERENCES Payments(payment_id) ON DELETE SET NULL,
FOREIGN KEY(fullfilled_by_employee_id) REFERENCES Employees(employee_id) ON DELETE SET NULL,
PRIMARY KEY(order_id)
);

INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('John','Hibert','Male','284 chaucer st',084789657,'john@gmail.com','Johannesburg','South Africa');
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Thando','Sithole','Female','240 Sect 1',0794445584,'thando@gmail.com	','Cape Town','South Africa');
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Leon','Glen','Male','81 Everton Rd,Gillits',0820832830,'Leon@gmail.com','Durban','South Africa');
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Charl','Muller','Male','290A Dorset Ecke',+44856872553	,'Charl.muller@yahoo.com','Berlin','Germany');
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Julia','Stein','Female','2 Wernerring',+448672445058	,'Js234@yahoo.com','Frankfurt','Germany');

INSERT INTO Employees(first_name,last_name ,email ,job_title) VALUES ('Kani','Matthew','mat@gmail.com','Manager');
INSERT INTO Employees(first_name,last_name ,email ,job_title) VALUES ('Lesly','Cronje','LesC@gmail.com','Clerk');
INSERT INTO Employees(first_name,last_name ,email ,job_title) VALUES ('Gideon','Maduku','m@gmail.com','Accountant');

INSERT INTO Products(product_name,description ,buy_price) VALUES ('Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75);
INSERT INTO Products(product_name,description ,buy_price) VALUES ('Classic Car','Turnable front wheels, steering function',550.75);
INSERT INTO Products(product_name,description ,buy_price) VALUES ('Sports car','Turnable front wheels, steering function',700.60);

INSERT INTO Payments(customer_id,payment_date ,amount) VALUES (1,'2018-09-01',150.75);
INSERT INTO Payments(customer_id,payment_date ,amount) VALUES (5,'2018-09-03',150.75);
INSERT INTO Payments(customer_id,payment_date ,amount) VALUES (4,'2018-09-03',700.60);

INSERT INTO Orders(product_id,payment_id ,fullfilled_by_employee_id,date_required,status) VALUES (1,1,2,'2018-09-05','Not shipped');
INSERT INTO Orders(product_id,payment_id ,fullfilled_by_employee_id,date_required,date_shipped,status) VALUES (1,2,2,'2018-09-04','2018-09-03','Shipped');
INSERT INTO Orders(product_id,payment_id ,fullfilled_by_employee_id,date_required,status) VALUES (3,3,3,'2018-09-06','Not shipped');
