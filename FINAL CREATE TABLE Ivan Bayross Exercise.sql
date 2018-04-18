/*select tablespace_name, table_name from all_tables; */

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

/*table 2*/
CREATE TABLE product_master
(
   product_no varchar2(6) CHECK ( SUBSTR(Product_id,1,1) = 'P'),
   description varchar2(5) NOT NULL,
   profit_percent number (2,2) NOT NULL,
   unit_measure varchar2(10) NOT NULL,
   qty_on hand number (8) NOT NULL,
   reorder_level number(8) NOT NULL,
   sell_price number(8,2) NOT NULL CHECK(sell_price>0 ) , 
   cost_price number(8,2) NOT NULL CHECK(cost_price>0 ),
   PRIMARY KEY(product_no),

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



/*table 4*/
CREATE TABLE sales_order
(
	s_order_no varchar2(6) CHECK ( SUBSTR(Product_id,1,1) = 'O'),
	s_orde_date date,
	client_no varchar2(6),
	dely_Addr varchar2(25),
	salesman_no varchar2(6),
	dely_type char(1) CHECK(dely_type IN('F','P')) DEFAULT 'F', 
	billed_yn char(1),
	dely_date date CHECK(dely_date > s_orde_date_),
	order_status varchar2(10) CHECK(order_status IN('In Process','Fulfilled','BackOrder','Canceled')),
	PRIMARY KEY(s_order_no),
	FOREIGN KEY (client_no) REFERENCES client_master(client_no),
	FOREIGN KEY (salesman_no) REFERENCES salesman_master(salesman_no),


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




/*table 6*/
CREATE TABLE challan_header
(
	 challan_no varchar2(6) CHECK(challan_no LIKE 'CH%') ,
	 s_order_no varchar2(6),
	 challan_date date NOT NULL,
	 billed_yn char(1) CHECK(dely_type IN('Y','N')) DEFAULT 'N', ,
	 PRIMARY KEY(challan_no);
	 FOREIGN KEY (s_order_no) REFERENCES sales_order(s_order_no),
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

