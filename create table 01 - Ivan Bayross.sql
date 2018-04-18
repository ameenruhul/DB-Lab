/*table 1*/
CREATE TABLE client_master
(
	client_no VARCHAR2(6) CHECK (client_no LIKE 'C%'),
	name VARCHAR2(20) NOT NULL,
	address1 VARCHAR2(30),
	address2 VARCHAR2(30),
	city VARCHAR2(15),
	state VARCHAR2(15),
	pincode NUMBER(6),
	bal_due NUMBER(10,2),
	PRIMARY KEY client_no,
);



/*table 3*/
CREATE TABLE salesman_master
(
	salesman_no VARCHAR2(6) CHECK (salesman_no LIKE 'S%'),
	salesman_name VARCHAR2(20) NOT NULL,
	address1 VARCHAR2(30) NOT NULL,
	address2 VARCHAR2(20),
	city VARCHAR2(20),
	pincode VARCHAR2(6),
	state VARCHAR2(20),
	sal_arnt number(8,2) NOT NULL CHECK (sal_arnt > 0),
	tgt_to_get NUMBER(6,2)	NOT NULL CHECK (tgt_to_get > 0),
	ytd_sales NUMBER(6,2) NOT NULL,
	remarks VARCHAR(60),
	PRIMARY KEY salesman_no,
);



/*table 5*/
CREATE TABLE sales_order_details
(
	s_order_no VARCHAR2(6) PRIMARY KEY,
	product_no VARCHAR2(6)PRIMARY KEY,
	qty_ordered NUMBER(8),
	qty_disp NUMBER(8),
	product_rate NUMBER(10,2), 
	FOREIGN KEY (s_order_no) REFERENCES sales_order(s_order_no),
	FOREIGN KEY (product_no) REFERENCES product_master(product_no), 
);


/*table 7*/
CREATE TABLE challan_details 
(
	challan_no VARCHAR2(6),
	product_no VARCHAR2(6),
	qty_disp NUMBER(4,2) NOT NULL,
	PRIMARY KEY (challan_no, product_no),
	FOREIGN KEY challan_no REFERENCES challan_header(challan_no),
	FOREIGN KEY product_no REFERENCES product_master(product_no),
);

