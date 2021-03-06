
  CREATE TABLE "HR"."TB_SAMPLE_FOOD_CUSTOMERS" 
   (	"CUSTOMER_NO" NUMBER(4,0), 
	"CUSTOMER_NAME" VARCHAR2(100 BYTE) CONSTRAINT "CUSTOMER_NAME_NN" NOT NULL ENABLE, 
	"CUSTOMER_TEL" VARCHAR2(20 BYTE) CONSTRAINT "CUSTOMER_TEL_NN" NOT NULL ENABLE, 
	"CUSTOMER_POINT" NUMBER(7,0) DEFAULT 0, 
	"CUSTOMER_IN_OUT" VARCHAR2(10 BYTE) DEFAULT '????', 
	"CUSTOMER_CREATED_DATE" DATE DEFAULT SYSDATE, 
	 CONSTRAINT "CUSTOMER_NO_PK" PRIMARY KEY ("CUSTOMER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "CUSTOMER_TEL_UK" UNIQUE ("CUSTOMER_TEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

