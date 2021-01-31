-- syain/busyo drop & create
@Z:\Drive_Z\DB\np08_kadai5.sql


-- 6.1
select syain_name, birth,
	trunc(months_between(sysdate, birth)/12)
	年齢 from syain
	order by birth asc;
/*
SYAIN_NAME  BIRTH            年齢
----------- ---------- ----------
板橋 花子   61-04-01           59
深町 智子   66-11-01           54
坂田 圭吾   70-05-20           50
上田 健二   72-03-02           48
野村 伸治   76-08-21           44
木下 順平   79-07-25           41
岩下 つとむ 79-12-25           40
田中 真弓   88-03-18           32
津田 あかね 92-05-03           28
清水 さおり 93-06-02           27
板橋 太郎   <NULL>     <NULL>
*/

-- 6.2
select count(distinct(busyo_cd)) 部署の件数 from syain;
/*
部署の件数
----------
         4
*/

-- 6.3
select count(*) 部署数 from busyo;
/*
    部署数
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
select count(*) 人数,
	trunc(avg(trunc(months_between(sysdate, birth)/12)),0) 平均年齢,
	max(trunc(months_between(sysdate, birth)/12)) 最高年齢,
	min(trunc(months_between(sysdate, birth)/12)) 最低年齢
	from syain where seibetu = 0;
/*
      人数   平均年齢   最高年齢   最低年齢
---------- ---------- ---------- ----------
         6         44         50         40
*/

-- 6.6
select busyo_cd,  count(syain_cd) 社員数 from syain
	group by busyo_cd
	order by busyo_cd asc;
/*
BUSYO_CD     社員数
-------- ----------
1000              4
1001              3
1002              3
1003              1
*/

-- 6.7
select busyo_cd 部署番号,
	trunc(avg(trunc(months_between(sysdate, birth)/12)),0) 平均年齢
	from syain
	group by busyo_cd
	order by busyo_cd asc;
/*
部署番号   平均年齢
-------- ----------
1000             41
1001             40
1002             46
1003     <NULL>
*/

-- 6.8
select busyo_cd, max(trunc(months_between(sysdate, birth)/12)) 最高齢
	from syain
	group by busyo_cd
	having count(busyo_cd) >= 3
	order by busyo_cd asc;
/*
BUSYO_CD     最高齢
-------- ----------
1000             59
1001             48
1002             54
*/

-- 6.9
select busyo_cd 部署番号, avg(to_char(sysdate,'YY')-to_char(nyusya,'YY')) 平均勤続年数
	from syain
	where busyo_cd <> '1002'
	group by busyo_cd
	having avg(to_char(sysdate,'YY')-to_char(nyusya,'YY')) < 10;
/*

部署番号 平均勤続年数
-------- ------------
1003                2
*/

-- 6.10
-- 集計項目で小計を計算
select nvl(busyo_cd,' ') 部署,
   case
    when seibetu = 0 then '男'
    when seibetu = 1 then '女'
    else ' '
   end 性別
   ,count(seibetu) from syain
   group by ROLLUP(busyo_cd,seibetu);
/*
部署     性別   COUNT(SEIBETU)
-------- ------ --------------
1000     男                  1
1000     女                  3
1000                         4
1001     男                  2
1001     女                  1
1001                         3
1002     男                  2
1002     女                  1
1002                         3
1003     男                  1
1003                         1
                            11
*/

-- 6.11
select nvl(to_char(birth,'MM'),'不明') 誕生月,
	count(*) 人数 from syain
	group by to_char(birth,'MM')
	order by 誕生月 asc;
/*
誕生月             人数
------------ ----------
03                    2
04                    1
05                    2
06                    1
07                    1
08                    1
11                    1
12                    1
不明                  1
*/

-- 6.12
select case trunc(months_between(sysdate, birth)/12,-1)
	when 50 then '50代'
	when 40 then '40代'	
	when 30 then '30代'	
	when 20 then '20代'
	end 年代,
	count(*) 人数 from syain
	where birth is not null
	group by trunc(months_between(sysdate, birth)/12,-1)
	order by 年代 desc;
/*
年代             人数
---------- ----------
50代                3
40代                4
30代                1
20代                2
*/
-- 6.13
-- 減算時に数値変換されるのでもう一度to_charで囲む
col 勤続年数 for a10
select nvl(to_char(to_char(sysdate,'YY')-to_char(nyusya,'YY')),'社長') 勤続年数,
	count(*) 人数 from syain
	group by to_char(to_char(sysdate,'YY')-to_char(nyusya,'YY'))
	order by 人数 asc;
/*
勤続年数         人数
---------- ----------
社長                1
3                   1
6                   4
21                  5
*/



