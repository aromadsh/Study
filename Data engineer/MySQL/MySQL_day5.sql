SELECT * FROM TB_POPLTN_DATA;
SELECT * FROM TB_POPLTN;
-- 데이터를 데이터 마트화 시키는 과정을 melting 또는 피보치화 라고 한다.

INSERT INTO TB_POPLTN
SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.STD_MT
     , CASE WHEN LVL1 = 1 THEN 'M' WHEN LVL1 = 2 THEN 'F' WHEN LVL1 = 3 THEN 'T' END AS POPLTN_SE_CD
     , CASE WHEN LVL2 = 1  THEN '000' WHEN LVL2 = 2  THEN '010' WHEN LVL2 = 3  THEN '020'
            WHEN LVL2 = 4  THEN '030' WHEN LVL2 = 5  THEN '040' WHEN LVL2 = 6  THEN '050'
            WHEN LVL2 = 7  THEN '060' WHEN LVL2 = 8  THEN '070' WHEN LVL2 = 9  THEN '080'
            WHEN LVL2 = 10 THEN '090' WHEN LVL2 = 11 THEN '100'
       END AS AGRDE_SE_CD
     , CASE WHEN LVL1 = 1 AND LVL2 = 1  THEN MALE_POPLTN_CO_0_9     WHEN LVL1 = 1 AND LVL2 = 2  THEN MALE_POPLTN_CO_10_19
            WHEN LVL1 = 1 AND LVL2 = 3  THEN MALE_POPLTN_CO_20_29   WHEN LVL1 = 1 AND LVL2 = 4  THEN MALE_POPLTN_CO_30_39
            WHEN LVL1 = 1 AND LVL2 = 5  THEN MALE_POPLTN_CO_40_49   WHEN LVL1 = 1 AND LVL2 = 6  THEN MALE_POPLTN_CO_50_59
            WHEN LVL1 = 1 AND LVL2 = 7  THEN MALE_POPLTN_CO_60_69   WHEN LVL1 = 1 AND LVL2 = 8  THEN MALE_POPLTN_CO_70_79
            WHEN LVL1 = 1 AND LVL2 = 9  THEN MALE_POPLTN_CO_80_89   WHEN LVL1 = 1 AND LVL2 = 10 THEN MALE_POPLTN_CO_90_99
            WHEN LVL1 = 1 AND LVL2 = 11 THEN MALE_POPLTN_CO_100     WHEN LVL1 = 2 AND LVL2 = 1  THEN FEMALE_POPLTN_CO_0_9
            WHEN LVL1 = 2 AND LVL2 = 2  THEN FEMALE_POPLTN_CO_10_19 WHEN LVL1 = 2 AND LVL2 = 3  THEN FEMALE_POPLTN_CO_20_29
            WHEN LVL1 = 2 AND LVL2 = 4  THEN FEMALE_POPLTN_CO_30_39 WHEN LVL1 = 2 AND LVL2 = 5  THEN FEMALE_POPLTN_CO_40_49
            WHEN LVL1 = 2 AND LVL2 = 6  THEN FEMALE_POPLTN_CO_50_59 WHEN LVL1 = 2 AND LVL2 = 7  THEN FEMALE_POPLTN_CO_60_69
            WHEN LVL1 = 2 AND LVL2 = 8  THEN FEMALE_POPLTN_CO_70_79 WHEN LVL1 = 2 AND LVL2 = 9  THEN FEMALE_POPLTN_CO_80_89
            WHEN LVL1 = 2 AND LVL2 = 10 THEN FEMALE_POPLTN_CO_90_99 WHEN LVL1 = 2 AND LVL2 = 11 THEN FEMALE_POPLTN_CO_100
            WHEN LVL1 = 3 AND LVL2 = 1  THEN POPLTN_CO_0_9          WHEN LVL1 = 3 AND LVL2 = 2  THEN POPLTN_CO_10_19
            WHEN LVL1 = 3 AND LVL2 = 3  THEN POPLTN_CO_20_29        WHEN LVL1 = 3 AND LVL2 = 4  THEN POPLTN_CO_30_39
            WHEN LVL1 = 3 AND LVL2 = 5  THEN POPLTN_CO_40_49        WHEN LVL1 = 3 AND LVL2 = 6  THEN POPLTN_CO_50_59
            WHEN LVL1 = 3 AND LVL2 = 7  THEN POPLTN_CO_60_69        WHEN LVL1 = 3 AND LVL2 = 8  THEN POPLTN_CO_70_79
            WHEN LVL1 = 3 AND LVL2 = 9  THEN POPLTN_CO_80_89        WHEN LVL1 = 3 AND LVL2 = 10 THEN POPLTN_CO_90_99
            WHEN LVL1 = 3 AND LVL2 = 11 THEN POPLTN_CO_100 END AS POPLTN_CNT
  FROM
     (
      SELECT SUBSTR(ADMINIST_ZONE, INSTR(ADMINIST_ZONE, '(') + 1, 10) AS ADMINIST_ZONE_NO
           , SUBSTR(ADMINIST_ZONE, 1, INSTR(ADMINIST_ZONE, '(')-1) AS ADMINIST_ZONE_NM,
             '202304' AS STD_MT
           , MALE_POPLTN_CO_0_9    , MALE_POPLTN_CO_10_19  , MALE_POPLTN_CO_20_29
           , MALE_POPLTN_CO_30_39  , MALE_POPLTN_CO_40_49  , MALE_POPLTN_CO_50_59
           , MALE_POPLTN_CO_60_69  , MALE_POPLTN_CO_70_79  , MALE_POPLTN_CO_80_89  , MALE_POPLTN_CO_90_99  , MALE_POPLTN_CO_100
           , FEMALE_POPLTN_CO_0_9  , FEMALE_POPLTN_CO_10_19, FEMALE_POPLTN_CO_20_29
           , FEMALE_POPLTN_CO_30_39, FEMALE_POPLTN_CO_40_49, FEMALE_POPLTN_CO_50_59
           , FEMALE_POPLTN_CO_60_69, FEMALE_POPLTN_CO_70_79, FEMALE_POPLTN_CO_80_89, FEMALE_POPLTN_CO_90_99, FEMALE_POPLTN_CO_100
           , POPLTN_CO_0_9         , POPLTN_CO_10_19, POPLTN_CO_20_29
           , POPLTN_CO_30_39       , POPLTN_CO_40_49, POPLTN_CO_50_59
           , POPLTN_CO_60_69       , POPLTN_CO_70_79, POPLTN_CO_80_89, POPLTN_CO_90_99, POPLTN_CO_100
           , LVL1, LVL2
        FROM TB_POPLTN_DATA,
             (SELECT (tmp1.idx) AS LVL1 FROM (SELECT 1 as idx UNION SELECT 2 UNION SELECT 3) tmp1) LVL1,
             (SELECT (tmp2.idx) AS LVL2 FROM (SELECT 1 as idx UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11) tmp2) LVL2
     ) A ;
     
SELECT * FROM TB_POPLTN;
    
-- 2024년 4월 기준 전국 주요 시/도의 연령별 인구수 합계
SELECT 
	AGRDE_SE_CD,
	SUM(POPLTN_CNT) AS AGRDE_POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304' 
	AND ADMINIST_ZONE_NO LIKE '__00000000' 
	AND POPLTN_SE_CD ='T'
GROUP BY AGRDE_SE_CD
ORDER BY AGRDE_SE_CD;
    
    
-- 2024년 4월 기준 전국 주요 시/도의 연령별 인구수 합계
SELECT
	A.AGRDE_SE_CD,
    A.AGRDE_POPLTN_CNT,
    SUM(AGRDE_POPLTN_CNT) OVER() AS SUM_AGRDE_POPLTN_CNT,
    A.AGRDE_POPLTN_CNT / SUM(AGRDE_POPLTN_CNT) OVER() AS AGRDE_POPLTN_RATE
FROM (
		SELECT 
			AGRDE_SE_CD,
			SUM(POPLTN_CNT) AS AGRDE_POPLTN_CNT
		FROM TB_POPLTN
		WHERE STD_MT = '202304' 
			AND ADMINIST_ZONE_NO LIKE '__00000000' 
			AND POPLTN_SE_CD ='T'
		GROUP BY AGRDE_SE_CD
		ORDER BY AGRDE_SE_CD
	) AS A;
    
    
-- 서브 쿼리 대신에 WITH ~ AS 구문 사용하기
-- WITH ~ AS 구문 : FROM 절 서브쿼리에서 조회할 결과를 미리 임시 테이블 형식으로 만들어 놓는 방법
-- 임시 테이블 이기 때문에 1회성. 한번 사용되면 사라진다. VIEW와 다르다!

WITH TEMP_AGRED_POPLTN_CNT AS (
	SELECT 
		AGRDE_SE_CD,
		SUM(POPLTN_CNT) AS AGRDE_POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304' 
		AND ADMINIST_ZONE_NO LIKE '__00000000' 
		AND POPLTN_SE_CD ='T'
	GROUP BY AGRDE_SE_CD
	ORDER BY AGRDE_SE_CD
)
SELECT
	AGRDE_SE_CD,
    AGRDE_POPLTN_CNT,
    AGRDE_POPLTN_CNT / SUM(AGRDE_POPLTN_CNT) OVER() AS AGRDE_POPLTN_RATE
FROM TEMP_AGRED_POPLTN_CNT;

-- 2023년 4월 기준 전국 주요 시/도의 성별(남 -> 'M', 여 -> 'F') 인구수 합계 구하기
SELECT * FROM TB_POPLTN;
SELECT
	POPLTN_SE_CD,
    SUM(POPLTN_CNT) AS SE_POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304'
	AND ADMINIST_ZONE_NO LIKE '__00000000'
    AND POPLTN_SE_CD IN ('M', 'F')
GROUP BY POPLTN_SE_CD;

-- 2023년 4월 기준 전국의 성별 인구수 합계를 구하여, 남성과 여성의 각각의 비율 구하기 - 남성/여성 남성/전체인구 여성/전체인구

SELECT
    CASE WHEN  POPLTN_SE_CD = 'M' THEN SUM(POPLTN_CNT) ELSE 0 END AS MALE_POPLTN_CNT,
    CASE WHEN  POPLTN_SE_CD = 'F' THEN SUM(POPLTN_CNT) ELSE 0 END AS FEMALE_POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304'
	AND ADMINIST_ZONE_NO LIKE '__00000000'
    AND POPLTN_SE_CD IN ('M', 'F')
GROUP BY POPLTN_SE_CD;

-- WITH AS 구문 이용해서 REDUCTION
WITH 
	TEMP_SE_POPLTN_CNT AS (
	SELECT
		CASE WHEN  POPLTN_SE_CD = 'M' THEN SUM(POPLTN_CNT) ELSE 0 END AS MALE_POPLTN_CNT,
		CASE WHEN  POPLTN_SE_CD = 'F' THEN SUM(POPLTN_CNT) ELSE 0 END AS FEMALE_POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304'
		AND ADMINIST_ZONE_NO LIKE '__00000000'
		AND POPLTN_SE_CD IN ('M', 'F')
	GROUP BY POPLTN_SE_CD
),
TEMP_PIVOT_POPLTN_CNT AS (
	SELECT
		MAX(MALE_POPLTN_CNT) AS MALE_POPLTN_CNT,
		MAX(FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT
	FROM TEMP_SE_POPLTN_CNT
)
SELECT
	MALE_POPLTN_CNT,
    FEMALE_POPLTN_CNT,
    
    MALE_POPLTN_CNT / FEMALE_POPLTN_CNT AS "남성/여성 비율",
    MALE_POPLTN_CNT / (MALE_POPLTN_CNT + FEMALE_POPLTN_CNT) AS "전체 인구수 대비 남성 비율",
    FEMALE_POPLTN_CNT / (MALE_POPLTN_CNT + FEMALE_POPLTN_CNT) AS "전체 인구수 대비 여성 비율"
FROM TEMP_PIVOT_POPLTN_CNT;

-- 2023년 4월 기준 전국의 읍/면/동 인구수 조회하기. 인구수 내림차순 정렬
SELECT * FROM TB_POPLTN;
SELECT
	AGRDE_SE_CD,
    ADMINIST_ZONE_NO,
	ADMINIST_ZONE_NM,
    POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304'
	AND ADMINIST_ZONE_NO NOT LIKE '_____00000'
    AND POPLTN_SE_CD = 'T'
    AND POPLTN_CNT > 0
ORDER BY POPLTN_CNT DESC;

-- 2023년 4월 기준 전국의 읍/면/동의 인구수를 조회 후 연령대별 인구가 가장 많은 지역을 조회한다.
WITH
	TEMP_EMD_POPLTN_CNT AS (
    SELECT
		AGRDE_SE_CD,
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304'
		AND ADMINIST_ZONE_NO NOT LIKE '_____00000'
		AND POPLTN_SE_CD = 'T'
		AND POPLTN_CNT > 0
	ORDER BY POPLTN_CNT DESC
),
TEMP_AGRDE_POPLTN_RANK AS(
	SELECT
		AGRDE_SE_CD,
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		POPLTN_CNT,
		RANK() OVER(PARTITION BY AGRDE_SE_CD ORDER BY POPLTN_CNT DESC) AS POPLTN_RANK
	FROM TEMP_EMD_POPLTN_CNT
)
SELECT
	AGRDE_SE_CD,
	ADMINIST_ZONE_NO,
	ADMINIST_ZONE_NM,
	POPLTN_CNT
FROM TEMP_AGRDE_POPLTN_RANK
WHERE POPLTN_RANK = 1
ORDER BY AGRDE_SE_CD;