SELECT * FROM EMP
WHERE SAL + NVL(COMM, 0) > 2500;

-- again the concept of NULL
-- we use NVL function to replace the NULL value
-- with any other integer value