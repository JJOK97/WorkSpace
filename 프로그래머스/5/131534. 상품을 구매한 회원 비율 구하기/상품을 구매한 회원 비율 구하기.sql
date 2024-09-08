-- 코드를 입력하세요
SELECT YEAR, TO_NUMBER(MONTH) AS MONTH, COUNT(DISTINCT USER_ID)  AS PURCHASED_USERS, 
       ROUND(COUNT(DISTINCT USER_ID)/ JOIN_USERS,1) AS PUCHASED_RATIO FROM (
SELECT TO_CHAR(SALES_DATE,'YYYY') AS YEAR, 
       TO_CHAR(SALES_DATE,'MM') AS MONTH,
       COUNT(DISTINCT A.USER_ID) OVER (PARTITION BY TO_CHAR(JOINED,'YYYY') )AS JOIN_USERS, 
       B.*
  FROM USER_INFO A
  LEFT OUTER JOIN ONLINE_SALE B
    ON (A.USER_ID = B.USER_ID)
 WHERE TO_CHAR(JOINED,'YYYYMMDD') BETWEEN '20210101' AND '20211231'
)
WHERE YEAR IS NOT NULL
GROUP BY YEAR, MONTH, JOIN_USERS
ORDER BY YEAR, MONTH