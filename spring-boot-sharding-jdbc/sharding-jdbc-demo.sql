------------------------------
--1. sharding-tables：使用取模的方式来实现表分片
------------------------------
CREATE TABLE "ec_demo_0"."public"."user_info0" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."user_info1" (
	id INT8 NOT NULL,
	name varchar(50) NULL,
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);


------------------------------
--2. master-slave：一主多从模式下的读写分离
------------------------------
CREATE TABLE "ec_demo_0"."public"."user_info" (
	id INT8 NOT NULL,
	company_id varchar(32) NOT NULL, 
	name varchar(50) NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."user_info" (
	id INT8 NOT NULL,
	company_id varchar(32) NOT NULL, 
	name varchar(50) NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_2"."public"."user_info" (
	id INT8 NOT NULL,
	company_id varchar(32) NOT NULL, 
	name varchar(50) NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);


------------------------------
--3. sharding-databases：使用取模的方式来实现库分片
------------------------------
CREATE TABLE "ec_demo_0"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);


------------------------------
--4. sharding-databases2：使用固定值的方式来实现库分片
------------------------------
CREATE TABLE "ec_demo_0"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);


------------------------------
--5. sharding-databases3：工程里既有分片的表，也有不分片的表(使用默认的库)
------------------------------
CREATE TABLE "ec_demo_0"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 	
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 	
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_2"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 	
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);


------------------------------
--6. sharding-databases4：分库分表公共表
------------------------------
--0库
CREATE TABLE "ec_demo_0"."public"."area" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."order0" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."order1" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."order2" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."order3" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."order4" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_0"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 	
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

--1库
CREATE TABLE "ec_demo_1"."public"."area" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."order0" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."order1" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."order2" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."order3" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."order4" (
  id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  company_id varchar(32) NOT NULL, 
  name varchar(50) NULL, 
  create_time timestamptz(6),
  update_time timestamptz(6),
  PRIMARY KEY (id)
);

CREATE TABLE "ec_demo_1"."public"."user_info" (
	id INT8 NOT NULL,
	name varchar(50) NULL, 	
	company_id varchar(32) NOT NULL, 
	create_time timestamptz(6),
    update_time timestamptz(6),
	PRIMARY KEY (id)
);
