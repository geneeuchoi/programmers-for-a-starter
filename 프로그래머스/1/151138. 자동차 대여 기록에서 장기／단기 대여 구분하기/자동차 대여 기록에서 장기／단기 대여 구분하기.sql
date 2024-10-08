-- 코드를 입력하세요
SELECT HISTORY_ID,
CAR_ID,
DATE_FORMAT(START_DATE, '%Y-%m-%d') START_DATE,
DATE_FORMAT(END_DATE, '%Y-%m-%d') END_DATE,
IF (DATEDIFF(END_DATE, START_DATE) >= 29, '장기 대여', '단기 대여') AS 'RENT_TYPE'
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE > '2022-08-31' AND START_DATE < '2022-10-01'
ORDER BY HISTORY_ID DESC