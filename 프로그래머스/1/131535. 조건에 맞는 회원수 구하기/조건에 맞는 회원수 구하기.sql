-- 코드를 입력하세요
SELECT COUNT(*) USERS
FROM USER_INFO
WHERE JOINED BETWEEN DATE '2021-01-01' AND DATE '2021-12-31'
AND AGE BETWEEN 20 AND 29
