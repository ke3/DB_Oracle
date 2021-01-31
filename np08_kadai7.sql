-- syain/busyo drop & create
@Z:\Drive_Z\DB\np08_kadai4.sql

-- 7-1
select syain_cd,syain_name,syain.busyo_cd,nvl(busyo.busyo_name,'����') busyo_name,busyo.busyo_cd
from syain cross join busyo
order by syain.syain_cd asc;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME BUSYO_CD
-------- ----------- -------- ---------- --------
0001     �� �Ԏq   1000     �l����     1001
0001     �� �Ԏq   1000     �c�ƕ�     1002
0001     �� �Ԏq   1000     �o����     1000
0001     �� �Ԏq   1000     ������     1003
0001     �� �Ԏq   1000     ����       0000
---��---
2001     �� ���Y   1003     �c�ƕ�     1002
2001     �� ���Y   1003     �o����     1000
2001     �� ���Y   1003     �l����     1001
2001     �� ���Y   1003     ������     1003
2001     �� ���Y   1003     ����       0000
55�s���I������܂����B
*/

-- 7.2
select syain_cd,syain_name,syain.busyo_cd,busyo.busyo_name,busyo.busyo_cd
from syain cross join busyo
where syain.busyo_cd = busyo.busyo_cd;

/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME BUSYO_CD
-------- ----------- -------- ---------- --------
0001     �� �Ԏq   1000     �o����     1000
0002     �≺ �Ƃ� 1001     �l����     1001
0003     ��c ����   1001     �l����     1001
0004     �؉� ����   1002     �c�ƕ�     1002
0005     ��c �\��   1000     �o����     1000
0006     �쑺 �L��   1002     �c�ƕ�     1002
1000     ���� ������ 1000     �o����     1000
1001     �c�� �^�|   1001     �l����     1001
1002     �Óc ������ 1000     �o����     1000
1003     �[�� �q�q   1002     �c�ƕ�     1002
2001     �� ���Y   1003     ������     1003
11�s���I������܂����B
*/

-- 7.3
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0001     �� �Ԏq   1000     �o����
0002     �≺ �Ƃ� 1001     �l����
0003     ��c ����   1001     �l����
0004     �؉� ����   1002     �c�ƕ�
0005     ��c �\��   1000     �o����
0006     �쑺 �L��   1002     �c�ƕ�
1000     ���� ������ 1000     �o����
1001     �c�� �^�|   1001     �l����
1002     �Óc ������ 1000     �o����
1003     �[�� �q�q   1002     �c�ƕ�
2001     �� ���Y   1003     ������*/

-- 7.4
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain join busyo
	using(busyo_cd);
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0001     �� �Ԏq   1000     �o����
0002     �≺ �Ƃ� 1001     �l����
0003     ��c ����   1001     �l����
0004     �؉� ����   1002     �c�ƕ�
0005     ��c �\��   1000     �o����
0006     �쑺 �L��   1002     �c�ƕ�
1000     ���� ������ 1000     �o����
1001     �c�� �^�|   1001     �l����
1002     �Óc ������ 1000     �o����
1003     �[�� �q�q   1002     �c�ƕ�
2001     �� ���Y   1003     ������
*/
-- 7.5
select syain_cd, syain_name, busyo.busyo_cd, busyo.busyo_name
	from syain left outer join busyo
	on syain.busyo_cd = busyo.busyo_cd;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0001     �� �Ԏq   1000     �o����
0005     ��c �\��   1000     �o����
1000     ���� ������ 1000     �o����
1002     �Óc ������ 1000     �o����
0002     �≺ �Ƃ� 1001     �l����
0003     ��c ����   1001     �l����
1001     �c�� �^�|   1001     �l����
0004     �؉� ����   1002     �c�ƕ�
0006     �쑺 �L��   1002     �c�ƕ�
1003     �[�� �q�q   1002     �c�ƕ�
2001     �� ���Y   1003     ������
*/
-- 7.6
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo
	where busyo_name = '�c�ƕ�';

/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0004     �؉� ����   1002     �c�ƕ�
0006     �쑺 �L��   1002     �c�ƕ�
1003     �[�� �q�q   1002     �c�ƕ�
*/
-- 7.7
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo
	where busyo_name = '�c�ƕ�'
	and seibetu = 1;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
1003     �[�� �q�q   1002     �c�ƕ�
*/

-- 7.8
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo
	where busyo_name in('�c�ƕ�','�l����')
	and seibetu = 1;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
1001     �c�� �^�|   1001     �l����
1003     �[�� �q�q   1002     �c�ƕ�
*/

-- 7.9
select busyo_name,  count(syain.busyo_cd) �l��
	from syain join busyo
	on syain.busyo_cd = busyo.busyo_cd
	group by busyo_name
	order by �l�� asc;
/*
BUSYO_NAME       �l��
---------- ----------
������              1
�c�ƕ�              3
�l����              3
�o����              4
*/

-- 7.10
select case seibetu
		when 0 then '�j'
		when 1 then '��'
	   end ����,
	busyo_name, count(seibetu) �l��
	from syain join busyo
	on syain.busyo_cd = busyo.busyo_cd
	group by ROLLUP(busyo_name,seibetu)
	order by �l�� asc;

select case seibetu
		when 0 then '�j'
		when 1 then '��'
	   end ����,
	busyo_name, count(seibetu) �l��
	from syain join busyo
	on syain.busyo_cd = busyo.busyo_cd
	group by busyo_name,seibetu
	order by ����, '��' desc;
/*
����   BUSYO_NAME       �l��
------ ---------- ----------
��     �c�ƕ�              1
��     �l����              1
��     �o����              3
�j     �c�ƕ�              2
�j     �l����              2
�j     �o����              1
�j     ������              1
*/


