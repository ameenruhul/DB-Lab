/*select tablespace_name, table_name from all_tables; */


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

CREATE TABLE challan_header
(
	 challan_no varchar2(6) CHECK(challan_no LIKE 'CH%') ,
	 s_order_no varchar2(6),
	 challan_date date NOT NULL,
	 billed_yn char(1) CHECK(dely_type IN('Y','N')) DEFAULT 'N', ,
	 PRIMARY KEY(challan_no);
	 FOREIGN KEY (s_order_no) REFERENCES sales_order(s_order_no),
);