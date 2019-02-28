CREATE DATABASE My_Classicmodels;

USE My_Classicmodels;

CREATE TABLE orders(
    	orderNumber int(11) NOT NULL PRIMARY KEY,
    	orderDate DATETIME NOT NULL,
    	requiredDate DATETIME NOT NULL,
    	shippedDate DATETIME NULL,
    	status VARCHAR(15) NOT NULL,
    	comments TEXT NULL,
    	customerNumber INT(11) NOT NULL
);

CREATE TABLE productlines(
    	productLine VARCHAR(50) NOT NULL PRIMARY KEY,
    	textDescription VARCHAR(4000) NULL,
    	htmlDescription MEDIUMTEXT NULL,
    	image MEDIUMBLOB NULL
);

CREATE TABLE orderdetails(
	orderNumber INT(11) NOT NULL AUTO_INCREMENT,
	productCode VARCHAR(15) NOT NULL,
	quanityOrdered INT(11) NOT NULL,
	priceEach DOUBLE NOT NULL,
	orderLineNumber SMALLINT(6) NOT NULL,
	PRIMARY KEY (orderNumber, productCode)
);

CREATE TABLE products(
	productCode VARCHAR(15) NOT NULL PRIMARY KEY,
	productName VARCHAR(70) NOT NULL,
	productLine VARCHAR(10) NOT NULL,
	productScale VARCHAR(50) NOT NULL,
	productDescription TEXT NOT NULL,
	quanlityInStock SMALLINT(6),
	buyPrice DOUBLE NOT NULL
);

ALTER TABLE orderdetails
ADD FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON UPDATE CASCADE;

ALTER TABLE orderdetails
ADD FOREIGN KEY (productCode) REFERENCES products(productCode) ON UPDATE CASCADE;

ALTER TABLE products
ADD FOREIGN KEY (productLine) REFERENCES productlines(productLine);

