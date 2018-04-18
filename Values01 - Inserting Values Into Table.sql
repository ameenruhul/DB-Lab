INSERT INTO table_name
	( '  ',  '  ',  '  ',  '  ',  '  ',
	  '  ',  '  ',  '  ',)

VALUES ( '  ',  '  ',  '  ',  '  ',  '  ',
	  '  ',  '  ',  '  ',)	  

/*-----------------------------------------*/

/*table 1*/
INSERT INTO client_master
	( ' client_no ',  ' client_no ',  ' address1 ',  ' address2 ',  '  ',
	  ' state ',  ' pincode ',  ' bal_due ',)

VALUES ( ' C00001 ',  ' Ivan Bayross ',  ' Bombay ',  ' 400054 ',  '  ',
	  '  ',  '  ',  '  ',);	  

INSERT INTO client_master
	( ' client_no ',  ' client_no ',  ' address1 ',  ' address2 ',  '  ',
	  ' state ',  ' pincode ',  ' bal_due ',)

VALUES ( ' C00002 ',  ' Vandana Saitwal ',  ' Madras ',  ' 780001 ',  '  ',
	  '  ',  '  ',  '  ',);	  

INSERT INTO client_master
	( ' client_no ',  ' client_no ',  ' address1 ',  ' address2 ',  '  ',
	  ' state ',  ' pincode ',  ' bal_due ',)

VALUES ( ' C00003 ',  ' Pramada Jaguste ',  ' Bombay ',  ' 400057 ',  '  ',
	  '  ',  '  ',  '  ',);	  

INSERT INTO client_master
	( ' client_no ',  ' client_no ',  ' address1 ',  ' address2 ',  '  ',
	  ' state ',  ' pincode ',  ' bal_due ',)

VALUES ( ' C00004 ',  ' Basu Navindgi ',  ' Bombay ',  ' 400056 ',  '  ',
	  '  ',  '  ',  '  ',);	  


INSERT INTO client_master
	( ' client_no ',  ' client_no ',  ' address1 ',  ' address2 ',  '  ',
	  ' state ',  ' pincode ',  ' bal_due ',)

VALUES ( ' C00005 ',  ' Ravi Sreedaran ',  ' Delhi ',  ' 100001 ',  '  ',
	  '  ',  '  ',  '  ',);	  

INSERT INTO client_master
	( ' client_no ',  ' client_no ',  ' address1 ',  ' address2 ',  '  ',
	  ' state ',  ' pincode ',  ' bal_due ',)

VALUES ( ' C00006 ',  ' Rukmini ',  ' Bombay ',  ' 400050 ',  '  ',
	  '  ',  '  ',  '  ',);	  




/*-----------------------------------------*/


CREATE TABLE client_master
(
	client_no VARCHAR2(6) CHECK (client_no LIKE 'C%'),
	client_no VARCHAR2(20) NOT NULL,
	address1 VARCHAR2(30),
	address2 VARCHAR2(30),
	city VARCHAR2(15),
	state VARCHAR2(15),
	pincode NUMBER(6),
	bal_due NUMBER(10,2),
	PRIMARY KEY client_no,
);
