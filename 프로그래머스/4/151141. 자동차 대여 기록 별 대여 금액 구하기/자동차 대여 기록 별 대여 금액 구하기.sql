WITH A AS (
SELECT H.HISTORY_ID,
H.CAR_ID,
C.DAILY_FEE,
DATEDIFF(H.END_DATE, H.START_DATE)+1 AS 'RENT_DATE',
CASE WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 < 7 THEN '7일 미만'
WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 BETWEEN 7 AND 30 THEN '7일 이상'
WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 BETWEEN 30 AND 90 THEN '30일 이상'
WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 >= 90 THEN '90일 이상'
END AS 'DURATION_TYPE'
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H 
LEFT JOIN CAR_RENTAL_COMPANY_CAR C ON H.CAR_ID = C.CAR_ID
WHERE C.CAR_TYPE = '트럭'),
B AS (
SELECT *
FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
WHERE CAR_TYPE = '트럭'
)

SELECT A.HISTORY_ID,
TRUNCATE (A.RENT_DATE * A.DAILY_FEE * IF(B.DISCOUNT_RATE IS NULL, 1, 1-B.DISCOUNT_RATE*0.01), 0) AS 'FEE'
FROM A LEFT JOIN B ON A.DURATION_TYPE = B.DURATION_TYPE
ORDER BY 2 DESC, 1 DESC