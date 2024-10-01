-- 코드를 입력하세요
WITH A AS (SELECT COUNT(USER_ID) AS 'COUNT_USER'
FROM USER_INFO
WHERE YEAR(JOINED) = '2021')

SELECT YEAR(SALES_DATE) AS 'YEAR',
MONTH(SALES_DATE) AS 'MONTH',
COUNT(DISTINCT(USER_ID)) AS 'PURCHASED_USERS',
ROUND(COUNT(DISTINCT(USER_ID)) / 158, 1) AS 'PUCHASED_RATIO'
FROM ONLINE_SALE
WHERE USER_ID IN (SELECT USER_ID
FROM USER_INFO
WHERE YEAR(JOINED) = '2021')
GROUP BY 1, 2
ORDER BY 1, 2