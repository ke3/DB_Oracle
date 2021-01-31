-- �e�[�u���폜
DROP TABLE busyo PURGE;
DROP TABLE syain PURGE;
-- CREATE TABLE 
create table busyo ( busyo_cd CHAR(4)primary key,
				   busyo_name VARCHAR2(30 CHAR));

create table syain ( syain_cd CHAR(4)primary key,
					syain_name VARCHAR2(30 CHAR),
					birth       DATE,
					seibetu     NUMBER(1)DEFAULT(0),
					busyo_cd    CHAR(4));
					
INSERT into busyo VALUES('0000',NULL);
INSERT into busyo VALUES('1000','�o����');
INSERT into busyo VALUES('1001','�l����');
INSERT into busyo VALUES('1002','�c�ƕ�');

INSERT into syain VALUES('0001','�� �Ԏq','1961-04-01',1,'1000');
INSERT into syain VALUES('0002','�≺ �Ƃ�','1979-12-25',0,'1001');
INSERT into syain VALUES('0003','��c ����','1992-03-02',0,'1001');
INSERT into syain VALUES('0004','�؉� ����','1979-07-25',0,'1002');
INSERT into syain VALUES('0005','��c �\��','1970-05-20',0,'1000');
INSERT into syain VALUES('0006','�쑺 �L��','1986-08-21',0,'1002');
INSERT into syain VALUES('1000','���� ������','1993-06-02',1,'1000');
INSERT into syain VALUES('1001','�c�� �^�|','1988-03-18',1,'1001');
INSERT into syain VALUES('1002','�Óc ������','1992-05-03',1,'1000');
INSERT into syain VALUES('1003','�[�� �q�q','1966-11-01',1,'1002');

set null <NULL>;
col syain_name for a15
col birth for a10
select syain_cd,syain_name,to_char(birth,'YYYY-MM-DD') birth,seibetu,busyo_cd from syain;
COMMIT;
/*
BUSYO_CD BUSYO_NAME
-------- ------------------------------------------------------------
0000     <NULL>
1000     ������
0001     �l����
1002     �c�ƕ�

SYAIN_CD SYAIN_NAME      BIRTH         SEIBETU BUSYO_CD
-------- --------------- ---------- ---------- --------
0001     �� �Ԏq       1961-04-01          1 1000
0002     �≺ �Ƃ�     1979-12-25          0 1001
0003     ��c ����       1992-03-02          0 1001
0004     �؉� ����       1979-07-25          0 1002
0005     ��c �\��       1970-05-20          0 1000
0006     �쑺 �L��       1986-08-21          0 1002
1000     ���� ������     1993-06-02          1 1000
1001     �c�� �^�|       1988-03-18          1 1001
1002     �Óc ������     1992-05-03          1 1000
1003     �[�� �q�q       1966-11-01          1 1002
*/