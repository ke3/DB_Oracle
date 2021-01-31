-- syain/busyo drop & create
@Z:\Drive_Z\DB\np08_kadai5.sql


-- 6.1
select syain_name, birth,
	trunc(months_between(sysdate, birth)/12)
	�N�� from syain
	order by birth asc;
/*
SYAIN_NAME  BIRTH            �N��
----------- ---------- ----------
�� �Ԏq   61-04-01           59
�[�� �q�q   66-11-01           54
��c �\��   70-05-20           50
��c ����   72-03-02           48
�쑺 �L��   76-08-21           44
�؉� ����   79-07-25           41
�≺ �Ƃ� 79-12-25           40
�c�� �^�|   88-03-18           32
�Óc ������ 92-05-03           28
���� ������ 93-06-02           27
�� ���Y   <NULL>     <NULL>
*/

-- 6.2
select count(distinct(busyo_cd)) �����̌��� from syain;
/*
�����̌���
----------
         4
*/

-- 6.3
select count(*) ������ from busyo;
/*
    ������
----------
         5
*/

-- 6.4
select count(buai) from syain
	where buai = '0.05';

select count(buai) from syain
	where buai is not null;
/*
COUNT(BUAI)
-----------
          3
*/

-- 6.5
select count(*) �l��,
	trunc(avg(trunc(months_between(sysdate, birth)/12)),0) ���ϔN��,
	max(trunc(months_between(sysdate, birth)/12)) �ō��N��,
	min(trunc(months_between(sysdate, birth)/12)) �Œ�N��
	from syain where seibetu = 0;
/*
      �l��   ���ϔN��   �ō��N��   �Œ�N��
---------- ---------- ---------- ----------
         6         44         50         40
*/

-- 6.6
select busyo_cd,  count(syain_cd) �Ј��� from syain
	group by busyo_cd
	order by busyo_cd asc;
/*
BUSYO_CD     �Ј���
-------- ----------
1000              4
1001              3
1002              3
1003              1
*/

-- 6.7
select busyo_cd �����ԍ�,
	trunc(avg(trunc(months_between(sysdate, birth)/12)),0) ���ϔN��
	from syain
	group by busyo_cd
	order by busyo_cd asc;
/*
�����ԍ�   ���ϔN��
-------- ----------
1000             41
1001             40
1002             46
1003     <NULL>
*/

-- 6.8
select busyo_cd, max(trunc(months_between(sysdate, birth)/12)) �ō���
	from syain
	group by busyo_cd
	having count(busyo_cd) >= 3
	order by busyo_cd asc;
/*
BUSYO_CD     �ō���
-------- ----------
1000             59
1001             48
1002             54
*/

-- 6.9
select busyo_cd �����ԍ�, avg(to_char(sysdate,'YY')-to_char(nyusya,'YY')) ���ϋΑ��N��
	from syain
	where busyo_cd <> '1002'
	group by busyo_cd
	having avg(to_char(sysdate,'YY')-to_char(nyusya,'YY')) < 10;
/*

�����ԍ� ���ϋΑ��N��
-------- ------------
1003                2
*/

-- 6.10
-- �W�v���ڂŏ��v���v�Z
select nvl(busyo_cd,' ') ����,
   case
    when seibetu = 0 then '�j'
    when seibetu = 1 then '��'
    else ' '
   end ����
   ,count(seibetu) from syain
   group by ROLLUP(busyo_cd,seibetu);
/*
����     ����   COUNT(SEIBETU)
-------- ------ --------------
1000     �j                  1
1000     ��                  3
1000                         4
1001     �j                  2
1001     ��                  1
1001                         3
1002     �j                  2
1002     ��                  1
1002                         3
1003     �j                  1
1003                         1
                            11
*/

-- 6.11
select nvl(to_char(birth,'MM'),'�s��') �a����,
	count(*) �l�� from syain
	group by to_char(birth,'MM')
	order by �a���� asc;
/*
�a����             �l��
------------ ----------
03                    2
04                    1
05                    2
06                    1
07                    1
08                    1
11                    1
12                    1
�s��                  1
*/

-- 6.12
select case trunc(months_between(sysdate, birth)/12,-1)
	when 50 then '50��'
	when 40 then '40��'	
	when 30 then '30��'	
	when 20 then '20��'
	end �N��,
	count(*) �l�� from syain
	where birth is not null
	group by trunc(months_between(sysdate, birth)/12,-1)
	order by �N�� desc;
/*
�N��             �l��
---------- ----------
50��                3
40��                4
30��                1
20��                2
*/
-- 6.13
-- ���Z���ɐ��l�ϊ������̂ł�����xto_char�ň͂�
col �Α��N�� for a10
select nvl(to_char(to_char(sysdate,'YY')-to_char(nyusya,'YY')),'�В�') �Α��N��,
	count(*) �l�� from syain
	group by to_char(to_char(sysdate,'YY')-to_char(nyusya,'YY'))
	order by �l�� asc;
/*
�Α��N��         �l��
---------- ----------
�В�                1
3                   1
6                   4
21                  5
*/



