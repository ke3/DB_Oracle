-- �e�[�u���폜
DROP TABLE job_grades PURGE;
DROP TABLE syain PURGE;
-- syain & busyu create
@Z:\Drive_Z\DB\np08_sample.sql
-- 4.1 
create table job_grades ( grade CHAR(4),
				   lowest_sal  NUMBER(5),
				   highest_sal  NUMBER(5));
-- 4.2
INSERT into job_grades VALUES('A',13000,14999);
INSERT into job_grades VALUES('B',9000,12999);
INSERT into job_grades VALUES('C',6000,8999);
INSERT into job_grades VALUES('D',3000,5999);
INSERT into job_grades VALUES('E',1000,2999);

desc job_grades;
select grade,lowest_sal,highest_sal from job_grades;
/*
 ���O                                      NULL?    �^
 ----------------------------------------- -------- ----------------------------
 GRADE                                              CHAR(4)
 LOWEST_SAL                                         NUMBER(5)
 HIGHEST_SAL                                        NUMBER(5)

GRADE    LOWEST_SAL HIGHEST_SAL
-------- ---------- -----------
A             13000       14999
B              9000       12999
C              6000        8999
D              3000        5999
E              1000        2999
*/

--4.3
desc busyo;
desc syain;
/*
���O                                      NULL?    �^
 ----------------------------------------- -------- ----------------------------
 BUSYO_CD                                  NOT NULL CHAR(4)
 BUSYO_NAME                                         VARCHAR2(30 CHAR)

 ���O                                      NULL?    �^
 ----------------------------------------- -------- ----------------------------
 SYAIN_CD                                  NOT NULL CHAR(4)
 SYAIN_NAME                                         VARCHAR2(30 CHAR)
 BIRTH                                              DATE
 SEIBETU                                            NUMBER(1)
 BUSYO_CD                                           CHAR(4)
*/

-- 4.4
select * from busyo;
select * from syain;

-- 4.5
update syain
set birth = '1972-03-02'
where syain_cd = '0003';

-- 4.6
update syain
set birth = '1976-08-21'
where syain_cd = '0006';

-- 4.7
alter table syain
add nyusya date;

-- 4.8
alter table syain
add buai NUMBER(3,2);

-- 4.9
INSERT into busyo VALUES('1003','������');

-- 4.10
update syain
set nyusya = '2000-04-01'
where syain_cd <> '0001'
		AND
		syain_cd < '1000';

-- 4.11
update syain
set nyusya = '2015-04-01'
where syain_cd >= '1000';

-- 4.12
INSERT into syain(syain_cd,syain_name,busyo_cd,nyusya) 
	VALUES('2001','�� ���Y',1003,'2018-04-01');

-- 4.13
update syain
set buai = 0.05
where busyo_cd = '1002';

-- 4.14
delete from job_grades
where grade = 'E';

COMMIT;
--�������Z�b�g
clear col 
-- JOB_GRAGES
col grade for a5
select * from job_grades;
/*
JOB_GRAGES

GRADE LOWEST_SAL HIGHEST_SAL
----- ---------- -----------
A          13000       14999
B           9000       12999
C           6000        8999
D           3000        5999
*/

-- BUSYO
set null <NULL>;
col busyo_name for a10;
select * from busyo;
/*
BUSYO_CD BUSYO_NAME
-------- ----------
0000     <NULL>
1000     ������
0001     �l����
1002     �c�ƕ�
1003     ������
*/
-- SYAIN
col syain_name for a11
col birth for a10
col nyusya for a10
col buai for '90.00'
select syain_cd,syain_name,to_char(birth,'YYYY-MM-DD') birth
	,seibetu,busyo_cd,to_char(nyusya,'YYYY-MM-DD') nyusya,buai from syain;

/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0001     �� �Ԏq   1961-04-01          1 1000     <NULL>     <NULL>
0002     �≺ �Ƃ� 1979-12-25          0 1001     2000-04-01 <NULL>
0003     ��c ����   1972-03-02          0 1001     2000-04-01 <NULL>
0004     �؉� ����   1979-07-25          0 1002     2000-04-01   0.05
0005     ��c �\��   1970-05-20          0 1000     2000-04-01 <NULL>
0006     �쑺 �L��   1976-08-21          0 1002     2000-04-01   0.05
1000     ���� ������ 1993-06-02          1 1000     2015-04-01 <NULL>
1001     �c�� �^�|   1988-03-18          1 1001     2015-04-01 <NULL>
1002     �Óc ������ 1992-05-03          1 1000     2015-04-01 <NULL>
1003     �[�� �q�q   1966-11-01          1 1002     2015-04-01   0.05
2001     �� ���Y   <NULL>              0 1003     2018-04-01 <NULL>
*/
COMMIT;