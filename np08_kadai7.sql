-- syain/busyo drop & create
@Z:\Drive_Z\DB\np08_kadai4.sql

-- 7-1
select syain_cd,syain_name,syain.busyo_cd,nvl(busyo.busyo_name,'未定') busyo_name,busyo.busyo_cd
from syain cross join busyo
order by syain.syain_cd asc;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME BUSYO_CD
-------- ----------- -------- ---------- --------
0001     板橋 花子   1000     人事部     1001
0001     板橋 花子   1000     営業部     1002
0001     板橋 花子   1000     経理部     1000
0001     板橋 花子   1000     総務部     1003
0001     板橋 花子   1000     未定       0000
---略---
2001     板橋 太郎   1003     営業部     1002
2001     板橋 太郎   1003     経理部     1000
2001     板橋 太郎   1003     人事部     1001
2001     板橋 太郎   1003     総務部     1003
2001     板橋 太郎   1003     未定       0000
55行が選択されました。
*/

-- 7.2
select syain_cd,syain_name,syain.busyo_cd,busyo.busyo_name,busyo.busyo_cd
from syain cross join busyo
where syain.busyo_cd = busyo.busyo_cd;

/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME BUSYO_CD
-------- ----------- -------- ---------- --------
0001     板橋 花子   1000     経理部     1000
0002     岩下 つとむ 1001     人事部     1001
0003     上田 健二   1001     人事部     1001
0004     木下 順平   1002     営業部     1002
0005     坂田 圭吾   1000     経理部     1000
0006     野村 伸治   1002     営業部     1002
1000     清水 さおり 1000     経理部     1000
1001     田中 真弓   1001     人事部     1001
1002     津田 あかね 1000     経理部     1000
1003     深町 智子   1002     営業部     1002
2001     板橋 太郎   1003     総務部     1003
11行が選択されました。
*/

-- 7.3
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0001     板橋 花子   1000     経理部
0002     岩下 つとむ 1001     人事部
0003     上田 健二   1001     人事部
0004     木下 順平   1002     営業部
0005     坂田 圭吾   1000     経理部
0006     野村 伸治   1002     営業部
1000     清水 さおり 1000     経理部
1001     田中 真弓   1001     人事部
1002     津田 あかね 1000     経理部
1003     深町 智子   1002     営業部
2001     板橋 太郎   1003     総務部*/

-- 7.4
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain join busyo
	using(busyo_cd);
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0001     板橋 花子   1000     経理部
0002     岩下 つとむ 1001     人事部
0003     上田 健二   1001     人事部
0004     木下 順平   1002     営業部
0005     坂田 圭吾   1000     経理部
0006     野村 伸治   1002     営業部
1000     清水 さおり 1000     経理部
1001     田中 真弓   1001     人事部
1002     津田 あかね 1000     経理部
1003     深町 智子   1002     営業部
2001     板橋 太郎   1003     総務部
*/
-- 7.5
select syain_cd, syain_name, busyo.busyo_cd, busyo.busyo_name
	from syain left outer join busyo
	on syain.busyo_cd = busyo.busyo_cd;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0001     板橋 花子   1000     経理部
0005     坂田 圭吾   1000     経理部
1000     清水 さおり 1000     経理部
1002     津田 あかね 1000     経理部
0002     岩下 つとむ 1001     人事部
0003     上田 健二   1001     人事部
1001     田中 真弓   1001     人事部
0004     木下 順平   1002     営業部
0006     野村 伸治   1002     営業部
1003     深町 智子   1002     営業部
2001     板橋 太郎   1003     総務部
*/
-- 7.6
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo
	where busyo_name = '営業部';

/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
0004     木下 順平   1002     営業部
0006     野村 伸治   1002     営業部
1003     深町 智子   1002     営業部
*/
-- 7.7
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo
	where busyo_name = '営業部'
	and seibetu = 1;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
1003     深町 智子   1002     営業部
*/

-- 7.8
select syain_cd, syain_name, busyo_cd, busyo_name
	from syain natural join busyo
	where busyo_name in('営業部','人事部')
	and seibetu = 1;
/*
SYAIN_CD SYAIN_NAME  BUSYO_CD BUSYO_NAME
-------- ----------- -------- ----------
1001     田中 真弓   1001     人事部
1003     深町 智子   1002     営業部
*/

-- 7.9
select busyo_name,  count(syain.busyo_cd) 人数
	from syain join busyo
	on syain.busyo_cd = busyo.busyo_cd
	group by busyo_name
	order by 人数 asc;
/*
BUSYO_NAME       人数
---------- ----------
総務部              1
営業部              3
人事部              3
経理部              4
*/

-- 7.10
select case seibetu
		when 0 then '男'
		when 1 then '女'
	   end 性別,
	busyo_name, count(seibetu) 人数
	from syain join busyo
	on syain.busyo_cd = busyo.busyo_cd
	group by ROLLUP(busyo_name,seibetu)
	order by 人数 asc;

select case seibetu
		when 0 then '男'
		when 1 then '女'
	   end 性別,
	busyo_name, count(seibetu) 人数
	from syain join busyo
	on syain.busyo_cd = busyo.busyo_cd
	group by busyo_name,seibetu
	order by 性別, '女' desc;
/*
性別   BUSYO_NAME       人数
------ ---------- ----------
女     営業部              1
女     人事部              1
女     経理部              3
男     営業部              2
男     人事部              2
男     経理部              1
男     総務部              1
*/


