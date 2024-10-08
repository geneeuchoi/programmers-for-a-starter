-- 코드를 입력하세요
SELECT O.PRODUCT_ID,
P.PRODUCT_NAME,
SUM(O.AMOUNT * P.PRICE) TOTAL_SALES
FROM FOOD_ORDER O INNER JOIN FOOD_PRODUCT P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE YEAR(O.PRODUCE_DATE) = 2022 AND MONTH(O.PRODUCE_DATE) = 05
GROUP BY P.PRODUCT_NAME
ORDER BY 3 DESC, 1 