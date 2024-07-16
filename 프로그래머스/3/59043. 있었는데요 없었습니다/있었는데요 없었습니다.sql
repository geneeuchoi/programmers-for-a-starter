-- 코드를 입력하세요
SELECT i.ANIMAL_ID,
i.NAME
FROM (SELECT ANIMAL_ID,
DATETIME "OUT_DATETIME"
FROM ANIMAL_OUTS) o RIGHT JOIN ANIMAL_INS i on i.ANIMAL_ID = o.ANIMAL_ID
WHERE o.OUT_DATETIME < i.DATETIME
ORDER BY i.DATETIME
