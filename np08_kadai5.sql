-- syain/busyo drop & create
@Z:\Drive_Z\DB\np08_kadai4.sql


-- 5.1
select syain_cd, syain_name, birth from syain;
/*
SYAIN_CD SYAIN_NAME      BIRTH
-------- --------------- ----------
0001     �� �Ԏq       61-04-01
0002     �≺ �Ƃ�     79-12-25
0003     ��c ����       92-03-02
0004     �؉� ����       79-07-25
0005     ��c �\��       70-05-20
0006     �쑺 �L��       86-08-21
1000     ���� ������     93-06-02
1001     �c�� �^�|       88-03-18
1002     �Óc ������     92-05-03
1003     �[�� �q�q       66-11-01
*/

--5.2
select distinct(busyo_cd) from syain;
/*BUSYO_CD
--------
1002
1001
1000
*/

-- 5.3
col syain_name for a11	
select syain_cd, syain_name, busyo_cd from syain
	where busyo_cd <> '1002';
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD
-------- ----------- --------
0001     �� �Ԏq   1000
0002     �≺ �Ƃ� 1001
0003     ��c ����   1001
0005     ��c �\��   1000
1000     ���� ������ 1000
1001     �c�� �^�|   1001
1002     �Óc ������ 1000
*/

-- 5.4
col syain_name for a12
select syain_name, birth,
	trunc(trunc(months_between(sysdate, birth))/12) �N��
	from syain;
/*
SYAIN_NAME   BIRTH          �N��
------------ -------- ----------
�� �Ԏq    61-04-01         59
�≺ �Ƃ�  79-12-25         40
��c ����    92-03-02         28
�؉� ����    79-07-25         41
��c �\��    70-05-20         50
�쑺 �L��    86-08-21         34
���� ������  93-06-02         27
�c�� �^�|    88-03-18         32
�Óc ������  92-05-03         28
�[�� �q�q    66-11-01         54
*/
-- 5.5

select syain_cd, syain_name,to_char(nyusya,'YYYY-MM-DD') nyusya
	from syain
	where to_char(nyusya,'YYYY') = '2015';
/*
SYAIN_CD SYAIN_NAME  NYUSYA
-------- ----------- ----------
1000     ���� ������ 2015-04-01
1001     �c�� �^�|   2015-04-01
1002     �Óc ������ 2015-04-01
1003     �[�� �q�q   2015-04-01
*/

-- 5.6
select * from syain
	where busyo_cd in ('1001', '1002');
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0002     �≺ �Ƃ� 79-12-25            0 1001     00-04-01   <NULL>
0003     ��c ����   72-03-02            0 1001     00-04-01   <NULL>
0004     �؉� ����   79-07-25            0 1002     00-04-01     0.05
0006     �쑺 �L��   76-08-21            0 1002     00-04-01     0.05
1001     �c�� �^�|   88-03-18            1 1001     15-04-01   <NULL>
1003     �[�� �q�q   66-11-01            1 1002     15-04-01     0.05
*/

-- 5.7
select * from syain
where syain_name  like '%�q';
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0001     �� �Ԏq   61-04-01            1 1000     <NULL>     <NULL>
1003     �[�� �q�q   66-11-01            1 1002     15-04-01     0.05
*/

-- 5.8
select * from syain
where birth is NULL;
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
2001     �� ���Y   <NULL>              0 1003     18-04-01   <NULL>
*/

-- 5.9
select * from syain
where birth is not NULL;

/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0001     �� �Ԏq   61-04-01            1 1000     <NULL>     <NULL>
0002     �≺ �Ƃ� 79-12-25            0 1001     00-04-01   <NULL>
0003     ��c ����   72-03-02            0 1001     00-04-01   <NULL>
0004     �؉� ����   79-07-25            0 1002     00-04-01     0.05
0005     ��c �\��   70-05-20            0 1000     00-04-01   <NULL>
0006     �쑺 �L��   76-08-21            0 1002     00-04-01     0.05
1000     ���� ������ 93-06-02            1 1000     15-04-01   <NULL>
1001     �c�� �^�|   88-03-18            1 1001     15-04-01   <NULL>
1002     �Óc ������ 92-05-03            1 1000     15-04-01   <NULL>
1003     �[�� �q�q   66-11-01            1 1002     15-04-01     0.05
*/

-- 5.10
select * from syain
	where to_char(birth,'MM') = '05';
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0005     ��c �\��   70-05-20            0 1000     00-04-01   <NULL>
1002     �Óc ������ 92-05-03            1 1000     15-04-01   <NULL>
*/

-- 5.11
select syain_name, seibetu, busyo_cd from syain
	order by seibetu desc,
	busyo_cd asc;
/*
SYAIN_NAME     SEIBETU BUSYO_CD
----------- ---------- --------
�Óc ������          1 1000
�� �Ԏq            1 1000
���� ������          1 1000
�c�� �^�|            1 1001
�[�� �q�q            1 1002
��c �\��            0 1000
�≺ �Ƃ�          0 1001
��c ����            0 1001
�؉� ����            0 1002
�쑺 �L��            0 1002
�� ���Y            0 1003
*/
-- 5.12
SQL> select syain_name,
	to_char(nvl2(buai,(1+buai)*270000,270000),'L999999')
	"���^" from syain;
-- ���̌�
-- 1000�~������؂�̂�
set null <NULL>;
select syain_name,buai,
	to_char(nvl2(buai,trunc((1+buai)*270000,-3),270000),'L999,999')
	"���^" from syain;
/*

SYAIN_NAME    BUAI ���^
----------- ------ ------------------------------------
�� �Ԏq   <NULL>           \270,000
�≺ �Ƃ� <NULL>           \270,000
��c ����   <NULL>           \270,000
�؉� ����     0.05           \283,000
��c �\��   <NULL>           \270,000
�쑺 �L��     0.05           \283,000
���� ������ <NULL>           \270,000
�c�� �^�|   <NULL>           \270,000
�Óc ������ <NULL>           \270,000
�[�� �q�q     0.05           \283,000
�� ���Y   <NULL>           \270,000*/

-- 5.13
select to_char(sysdate,'YY/MM/DD ')
	||to_char(sysdate,'day ')
	||to_char(sysdate,'hh24:mi:ss')
	"�{���̓��t" from dual;
-- �ȈՓI��
col �{���̓��t for a30
select to_char(sysdate,'YY/MM/DD day hh24:mi:ss')
	"�{���̓��t" from dual;
/*
�{���̓��t
------------------------------
20/12/24 �ؗj�� 11:57:18
*/
-- �č��\�L
col "TODAY IS DATE" for a30
select to_char(sysdate,'YY/MM/DD day hh24:mi:ss',
	'NLS_DATE_LANGUAGE = AMERICAN') "TODAY IS DATE" 
	from dual;
/*
TODAY IS DATE
------------------------------
20/12/24 thursday  11:56:39
*/

-- 5.14
select syain_name, nyusya ,to_char(add_months(nyusya,36),'YY-MM-DD')
	"����3�N��" from syain
	where busyo_cd = '1000';
/*
SYAIN_NAME  NYUSYA     ����3�N��
----------- ---------- ----------------
�� �Ԏq   <NULL>     <NULL>
��c �\��   00-04-01   03-04-01
���� ������ 15-04-01   18-04-01
�Óc ������ 15-04-01   18-04-01
*/

-- 5.15
select to_char(LAST_DAY(sysdate),'YY"�N"MM"��"DD"��" day')
	"�����ŏI��" from dual;
/*
�����ŏI��
--------------------------------------------------------
20�N12��31�� �ؗj��
*/

-- 5.16
col �����ꗗ for a45
select syain_name ||'����̕����̃R�[�h��'|| busyo_cd ||'�ł��B'
	"�����ꗗ" from syain;
/*
�����ꗗ
---------------------------------------------
�� �Ԏq����̕����̃R�[�h��1000�ł��B
�≺ �Ƃނ���̕����̃R�[�h��1001�ł��B
��c ���񂳂�̕����̃R�[�h��1001�ł��B
�؉� ��������̕����̃R�[�h��1002�ł��B
��c �\�Ⴓ��̕����̃R�[�h��1000�ł��B
�쑺 �L������̕����̃R�[�h��1002�ł��B
���� �����肳��̕����̃R�[�h��1000�ł��B
�c�� �^�|����̕����̃R�[�h��1001�ł��B
�Óc �����˂���̕����̃R�[�h��1000�ł��B
�[�� �q�q����̕����̃R�[�h��1002�ł��B
�� ���Y����̕����̃R�[�h��1003�ł��B
*/

-- 5.17
col �� for a5
col �� for a7
select substr(syain_name,1,(instr(syain_name,' ')-1)) ��,
	substr(syain_name,(instr(syain_name,' ')+1)) ��
	from syain;
/*
��    ��
----- -------
��  �Ԏq
�≺  �Ƃ�
��c  ����
�؉�  ����
��c  �\��
�쑺  �L��
����  ������
�c��  �^�|
�Óc  ������
�[��  �q�q
��  ���Y*/

-- 5.18
select * from syain
	where length(syain_name)-
	length(substr(syain_name,1,instr(syain_name,' ')))
	= 3;
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0002     �≺ �Ƃ� 79-12-25            0 1001     00-04-01   <NULL>
1000     ���� ������ 93-06-02            1 1000     15-04-01   <NULL>
1002     �Óc ������ 92-05-03            1 1000     15-04-01   <NULL>
*/

--5.19
select syain_name,
 case
  when seibetu = 0 then '�j'
  when seibetu = 1 then '��'
 end ����
from syain;

/*
SYAIN_NAME  ����
----------- ------
�� �Ԏq   ��
�≺ �Ƃ� �j
��c ����   �j
�؉� ����   �j
��c �\��   �j
�쑺 �L��   �j
���� ������ ��
�c�� �^�|   ��
�Óc ������ ��
�[�� �q�q   ��
�� ���Y   �j
*/

-- 5.20
select syain_cd, syain_name,
	to_char(sysdate,'YY')-to_char(nyusya,'YY') �Α��N�� from syain
	where syain_name like '_�c%';
/*
SYAIN_CD SYAIN_NAME    �Α��N��
-------- ----------- ----------
0003     ��c ����           20
0005     ��c �\��           20
1002     �Óc ������          5
*/

COMMIT;