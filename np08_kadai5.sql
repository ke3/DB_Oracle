-- syain/busyo drop & create
@Z:\Drive_Z\DB\np08_kadai4.sql


-- 5.1
select syain_cd, syain_name, birth from syain;
/*
SYAIN_CD SYAIN_NAME      BIRTH
-------- --------------- ----------
0001     板橋 花子       61-04-01
0002     岩下 つとむ     79-12-25
0003     上田 健二       92-03-02
0004     木下 順平       79-07-25
0005     坂田 圭吾       70-05-20
0006     野村 伸治       86-08-21
1000     清水 さおり     93-06-02
1001     田中 真弓       88-03-18
1002     津田 あかね     92-05-03
1003     深町 智子       66-11-01
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
0001     板橋 花子   1000
0002     岩下 つとむ 1001
0003     上田 健二   1001
0005     坂田 圭吾   1000
1000     清水 さおり 1000
1001     田中 真弓   1001
1002     津田 あかね 1000
*/

-- 5.4
col syain_name for a12
select syain_name, birth,
	trunc(trunc(months_between(sysdate, birth))/12) 年齢
	from syain;
/*
SYAIN_NAME   BIRTH          年齢
------------ -------- ----------
板橋 花子    61-04-01         59
岩下 つとむ  79-12-25         40
上田 健二    92-03-02         28
木下 順平    79-07-25         41
坂田 圭吾    70-05-20         50
野村 伸治    86-08-21         34
清水 さおり  93-06-02         27
田中 真弓    88-03-18         32
津田 あかね  92-05-03         28
深町 智子    66-11-01         54
*/
-- 5.5

select syain_cd, syain_name,to_char(nyusya,'YYYY-MM-DD') nyusya
	from syain
	where to_char(nyusya,'YYYY') = '2015';
/*
SYAIN_CD SYAIN_NAME  NYUSYA
-------- ----------- ----------
1000     清水 さおり 2015-04-01
1001     田中 真弓   2015-04-01
1002     津田 あかね 2015-04-01
1003     深町 智子   2015-04-01
*/

-- 5.6
select * from syain
	where busyo_cd in ('1001', '1002');
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0002     岩下 つとむ 79-12-25            0 1001     00-04-01   <NULL>
0003     上田 健二   72-03-02            0 1001     00-04-01   <NULL>
0004     木下 順平   79-07-25            0 1002     00-04-01     0.05
0006     野村 伸治   76-08-21            0 1002     00-04-01     0.05
1001     田中 真弓   88-03-18            1 1001     15-04-01   <NULL>
1003     深町 智子   66-11-01            1 1002     15-04-01     0.05
*/

-- 5.7
select * from syain
where syain_name  like '%子';
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0001     板橋 花子   61-04-01            1 1000     <NULL>     <NULL>
1003     深町 智子   66-11-01            1 1002     15-04-01     0.05
*/

-- 5.8
select * from syain
where birth is NULL;
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
2001     板橋 太郎   <NULL>              0 1003     18-04-01   <NULL>
*/

-- 5.9
select * from syain
where birth is not NULL;

/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0001     板橋 花子   61-04-01            1 1000     <NULL>     <NULL>
0002     岩下 つとむ 79-12-25            0 1001     00-04-01   <NULL>
0003     上田 健二   72-03-02            0 1001     00-04-01   <NULL>
0004     木下 順平   79-07-25            0 1002     00-04-01     0.05
0005     坂田 圭吾   70-05-20            0 1000     00-04-01   <NULL>
0006     野村 伸治   76-08-21            0 1002     00-04-01     0.05
1000     清水 さおり 93-06-02            1 1000     15-04-01   <NULL>
1001     田中 真弓   88-03-18            1 1001     15-04-01   <NULL>
1002     津田 あかね 92-05-03            1 1000     15-04-01   <NULL>
1003     深町 智子   66-11-01            1 1002     15-04-01     0.05
*/

-- 5.10
select * from syain
	where to_char(birth,'MM') = '05';
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0005     坂田 圭吾   70-05-20            0 1000     00-04-01   <NULL>
1002     津田 あかね 92-05-03            1 1000     15-04-01   <NULL>
*/

-- 5.11
select syain_name, seibetu, busyo_cd from syain
	order by seibetu desc,
	busyo_cd asc;
/*
SYAIN_NAME     SEIBETU BUSYO_CD
----------- ---------- --------
津田 あかね          1 1000
板橋 花子            1 1000
清水 さおり          1 1000
田中 真弓            1 1001
深町 智子            1 1002
坂田 圭吾            0 1000
岩下 つとむ          0 1001
上田 健二            0 1001
木下 順平            0 1002
野村 伸治            0 1002
板橋 太郎            0 1003
*/
-- 5.12
SQL> select syain_name,
	to_char(nvl2(buai,(1+buai)*270000,270000),'L999999')
	"給与" from syain;
-- その後
-- 1000円未満を切り捨て
set null <NULL>;
select syain_name,buai,
	to_char(nvl2(buai,trunc((1+buai)*270000,-3),270000),'L999,999')
	"給与" from syain;
/*

SYAIN_NAME    BUAI 給与
----------- ------ ------------------------------------
板橋 花子   <NULL>           \270,000
岩下 つとむ <NULL>           \270,000
上田 健二   <NULL>           \270,000
木下 順平     0.05           \283,000
坂田 圭吾   <NULL>           \270,000
野村 伸治     0.05           \283,000
清水 さおり <NULL>           \270,000
田中 真弓   <NULL>           \270,000
津田 あかね <NULL>           \270,000
深町 智子     0.05           \283,000
板橋 太郎   <NULL>           \270,000*/

-- 5.13
select to_char(sysdate,'YY/MM/DD ')
	||to_char(sysdate,'day ')
	||to_char(sysdate,'hh24:mi:ss')
	"本日の日付" from dual;
-- 簡易的に
col 本日の日付 for a30
select to_char(sysdate,'YY/MM/DD day hh24:mi:ss')
	"本日の日付" from dual;
/*
本日の日付
------------------------------
20/12/24 木曜日 11:57:18
*/
-- 米国表記
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
	"入社3年後" from syain
	where busyo_cd = '1000';
/*
SYAIN_NAME  NYUSYA     入社3年後
----------- ---------- ----------------
板橋 花子   <NULL>     <NULL>
坂田 圭吾   00-04-01   03-04-01
清水 さおり 15-04-01   18-04-01
津田 あかね 15-04-01   18-04-01
*/

-- 5.15
select to_char(LAST_DAY(sysdate),'YY"年"MM"月"DD"日" day')
	"今月最終日" from dual;
/*
今月最終日
--------------------------------------------------------
20年12月31日 木曜日
*/

-- 5.16
col 所属一覧 for a45
select syain_name ||'さんの部署のコードは'|| busyo_cd ||'です。'
	"所属一覧" from syain;
/*
所属一覧
---------------------------------------------
板橋 花子さんの部署のコードは1000です。
岩下 つとむさんの部署のコードは1001です。
上田 健二さんの部署のコードは1001です。
木下 順平さんの部署のコードは1002です。
坂田 圭吾さんの部署のコードは1000です。
野村 伸治さんの部署のコードは1002です。
清水 さおりさんの部署のコードは1000です。
田中 真弓さんの部署のコードは1001です。
津田 あかねさんの部署のコードは1000です。
深町 智子さんの部署のコードは1002です。
板橋 太郎さんの部署のコードは1003です。
*/

-- 5.17
col 姓 for a5
col 名 for a7
select substr(syain_name,1,(instr(syain_name,' ')-1)) 姓,
	substr(syain_name,(instr(syain_name,' ')+1)) 名
	from syain;
/*
姓    名
----- -------
板橋  花子
岩下  つとむ
上田  健二
木下  順平
坂田  圭吾
野村  伸治
清水  さおり
田中  真弓
津田  あかね
深町  智子
板橋  太郎*/

-- 5.18
select * from syain
	where length(syain_name)-
	length(substr(syain_name,1,instr(syain_name,' ')))
	= 3;
/*
SYAIN_CD SYAIN_NAME  BIRTH         SEIBETU BUSYO_CD NYUSYA       BUAI
-------- ----------- ---------- ---------- -------- ---------- ------
0002     岩下 つとむ 79-12-25            0 1001     00-04-01   <NULL>
1000     清水 さおり 93-06-02            1 1000     15-04-01   <NULL>
1002     津田 あかね 92-05-03            1 1000     15-04-01   <NULL>
*/

--5.19
select syain_name,
 case
  when seibetu = 0 then '男'
  when seibetu = 1 then '女'
 end 性別
from syain;

/*
SYAIN_NAME  性別
----------- ------
板橋 花子   女
岩下 つとむ 男
上田 健二   男
木下 順平   男
坂田 圭吾   男
野村 伸治   男
清水 さおり 女
田中 真弓   女
津田 あかね 女
深町 智子   女
板橋 太郎   男
*/

-- 5.20
select syain_cd, syain_name,
	to_char(sysdate,'YY')-to_char(nyusya,'YY') 勤続年数 from syain
	where syain_name like '_田%';
/*
SYAIN_CD SYAIN_NAME    勤続年数
-------- ----------- ----------
0003     上田 健二           20
0005     坂田 圭吾           20
1002     津田 あかね          5
*/

COMMIT;