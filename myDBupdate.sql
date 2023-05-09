-- Team 15
-- Members: Urmi Sheth 1002064934, 
--          Yash Patel 1002084351,
--          Keya Shah  1002079489 

--- 1 ---
UPDATE F22_S004_15_ART SET STATUS = 'SOLD' WHERE ART_ID = 111;
UPDATE F22_S004_15_ART SET STATUS = 'SOLD' WHERE ART_ID = 112;
UPDATE F22_S004_15_ART SET STATUS = 'SOLD' WHERE ART_ID = 116;
UPDATE F22_S004_15_ART SET CREATED_DATE = '20-JUL-2020' WHERE ART_ID = 111;

--- 2 ---
UPDATE F22_S004_15_ART_GALLERY SET ZIP = 73301 WHERE ART_GALLERY_ID = 906;

--- 3 --
UPDATE F22_S004_15_ORGANIZATION_TYPE_OF_ART SET TYPE_OF_ART = 'SKETCHING' WHERE ORGANIZATION_ID = 6014 AND TYPE_OF_ART = 'PAINTING';
UPDATE F22_S004_15_ORGANIZATION_TYPE_OF_ART SET TYPE_OF_ART = 'HANDCRAFT' WHERE ORGANIZATION_ID = 6001 AND TYPE_OF_ART = 'KNITTING';

--- 4 ---
UPDATE F22_S004_15_PERSON SET DOB='16-OCT-1960' WHERE PERSON_ID = 1034;
UPDATE F22_S004_15_PERSON SET DOB='10-NOV-1967' WHERE PERSON_ID = 1120;
UPDATE F22_S004_15_PERSON SET DOB='29-DEC-1960' WHERE PERSON_ID = 1007;
UPDATE F22_S004_15_PERSON SET DOB='05-JAN-1979' WHERE PERSON_ID = 1030;
UPDATE F22_S004_15_PERSON SET DOB='10-FEB-1986' WHERE PERSON_ID = 1056;
UPDATE F22_S004_15_PERSON SET DOB='18-MAR-1970' WHERE PERSON_ID = 1078;
UPDATE F22_S004_15_PERSON SET DOB='26-APR-1985' WHERE PERSON_ID = 1012;
UPDATE F22_S004_15_PERSON SET DOB='06-OCT-1998' WHERE PERSON_ID = 1087;
UPDATE F22_S004_15_PERSON SET DOB='11-MAR-1967' WHERE PERSON_ID = 1045;
UPDATE F22_S004_15_PERSON SET DOB='11-FEB-1990' WHERE PERSON_ID = 1023;

--- 5 ---
UPDATE F22_S004_15_ART SET PRICE=3500 WHERE ART_ID=111;
UPDATE F22_S004_15_ART SET PRICE=1900 WHERE ART_ID=138;
UPDATE F22_S004_15_ART SET PRICE=2000 WHERE ART_ID=145;
UPDATE F22_S004_15_ART SET PRICE=6000 WHERE ART_ID=149;

--- 6 ---
UPDATE F22_S004_15_ORGANIZATION_TYPE_OF_ART SET TYPE_OF_ART = 'HANDCRAFT' WHERE ORGANIZATION_ID = 6001 AND TYPE_OF_ART = 'KNITTING';



