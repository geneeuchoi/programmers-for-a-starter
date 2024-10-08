-- 코드를 입력하세요
WITH RECURSIVE HOURTABLE AS (
SELECT 0 AS 'HOUR'
    UNION ALL
    SELECT HOUR + 1 FROM HOURTABLE
    WHERE HOUR < 23
)

SELECT H.HOUR,
COUNT(O.ANIMAL_ID) AS 'COUNT'
FROM HOURTABLE H LEFT JOIN ANIMAL_OUTS O ON H.HOUR = HOUR(O.DATETIME)
GROUP BY 1
ORDER BY 1