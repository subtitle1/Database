-- ���� �Լ�
-- ��ҹ��� ��ȯ
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ���ڿ� �߶󳻱�
-- ����Ŭ�� �ε����� 1���� �����Ѵ�
SELECT JOB_ID, SUBSTR(JOB_ID, 4) -- �׹�° ��ġ���� ������ �߶󳻶�� �ǹ�
FROM JOBS;

-- ���ڿ� ���� ��ȸ�ϱ�
-- LENGTH(�÷���) : �ش� �÷��� ����� ���� ���̸� ��ȯ�Ѵ�.
SELECT JOB_ID, LENGTH(JOB_ID)
FROM EMPLOYEES
ORDER BY LENGTH(JOB_ID) DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY JOB_ID_LENGTH DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY 2 DESC;

-- ���ڿ� ä���
SELECT FIRST_NAME, LPAD(FIRST_NAME, 15, '#'), RPAD(FIRST_NAME,15, '#')
FROM EMPLOYEES;

SELECT LPAD('1234', 10, '0'), LPAD('12', 10, '0'), LPAD(123456,10,'0')
FROM DUAL;

-- DUAL�� ����Ŭ�� ����� 1�� 1��¥�� ���̺��̴�.
-- ������ ������ ����� ��ȸ�ؾ� �� �� ���� ����Ѵ�.
SELECT *
FROM DUAL;

-- ���ڿ� �����ϱ�
-- CONCAT(�÷���1, �÷���2) ; ������ �÷��� ������ ���� �̾���δ�.
-- �÷��� || �÷���2 || �÷���3 || ... || �÷Ÿ�N l n�� �÷��� ������ ���� �̾���δ�.
SELECT FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, LAST_NAME), FIRST_NAME || '' || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ���ʿ��� ���� ���ֱ�
-- trim(�÷���) : ������ �÷��� �� ����, �����ʿ� ��ġ�� ���ǹ��� ������ �����Ѵ�.
SELECT TRIM('                                  ABC     ABC    ABC              ')
FROM DUAL;

-- ���ڿ� �ٲٱ�
-- replace(�÷���, ã�� ���ڿ�, ��ü�� ���ڿ�) : ������ �÷����� Ư�� ���ڿ��� ã�Ƽ� �ٸ� ���ڿ��� ��ü��Ų��.
SELECT FIRST_NAME, REPLACE(LOWER(FIRST_NAME), 'a', '*')
FROM EMPLOYEES;

-- ���ڿ� ã��
-- INSTR(�÷���, 'ã�� ���ڿ�') : ������ �÷����� ã�� ���ڿ��� ��ġ�� ã�� ��ȯ�Ѵ�.
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'e')
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- �����Լ�
-- ROUND(�÷���) : ���ڸ� ���ڸ��� �ݿø��Ѵ�.
-- ROUND(�÷���, �ڸ���) : ���ڸ� ������ �ڸ������� �ݿø��Ѵ�.
--                      �ڸ����� ���� ������ �Ҽ��� �ڸ���, �ڸ����� ���� ������ 1, 10, 100�� �ڸ� ������ �ݿø�
--           �Ҽ��� �ι�°�ڸ�    �Ҽ��� ù��°�ڸ�                       10�� �ڸ�
SELECT ROUND(123.45, 2), ROUND(123.45, 1), ROUND(123.45, 0), ROUND(123.45, -1), ROUND(123.45, -2)
FROM DUAL;

-- �Ҽ����� ������
-- TRUNC(�÷���) : �Ҽ� ���θ� �ݿø����� �ʰ� ������ ������
SELECT ROUND(123.45), ROUND(123.55), TRUNC(123.45), TRUNC(123.55)
FROM DUAL;

-- õ�尪�� �ٴڰ� ���ϱ�
-- CEIL : �ڽź��� ū ���� �߿��� ���� ���� ������ ��ȯ�Ѵ�
-- FLOOR : �ڽź��� ���� ���� ���� �߿��� ���� ū ������ ��ȯ�Ѵ�.
SELECT ROUND(2.6), TRUNC(2.6), CEIL(2.5), FLOOR(2.5)
FROM DUAL;

-- ������ ���ϱ�
-- MOD(����1, ����2) : ù��° ���ڸ� �ι�° ���ڷ� ������ �������� ��ȯ�Ѵ�
SELECT MOD(10, 3), MOD(5, 3)
FROM DUAL;

--------------------------------------------------------------------------------
-- ��¥ �Լ�
-- SYSDATE : �ý����� ���� ��¥�� �ð������� ��ȯ�ϴ� �Լ�
SELECT SYSDATE
FROM DUAL;

-- ��¥ �ݿø� �� �ð� ���� �����
-- ROUND(��¥) : �ش� ��¥�� �ð��� ������ �Ѿ��� ��� �Ϸ簡 ������ ���� ��ȯ�ȴ�
-- TRUNC(��¥) : �ش� ��¥�� ��� �ð������� 0���� �ٲ� ���� ��ȯ�ȴ�
SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- MONTH_BETEEN(��¥1, ��¥2) : �� ��¥ ������ �������� ��ȯ�Ѵ�
SELECT FIRST_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ADD_MONTH(��¥, ������) : ��¥���� ������ ��������ŭ ����� ��¥�� ��ȯ�Ѵ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -3), ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- LAST_DAY(��¥) : �ش� ��¥�� ���� ���� �� ��������¥�� ��ȯ�Ѵ�
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- ��¥ ����
-- ��¥ + ���� : ��¥���� ������ ���ڸ�ŭ ����� ��¥�� ��ȯ�Ѵ�
-- ��¥ - ���� : ��¥���� ������ ���ڸ�ŭ ���� ��¥�� ��ȯ�Ѵ�
-- ��¥ - ��¥ : �� ��¥ ������ �ϼ��� ��ȯ�Ѵ�
-- ��¥ + ��¥ : ����
-- ��¥ + ����/24 : ��¥���� ������ �ð���ŭ ����� ��¥�� ��ȯ�Ѵ�
-- ��¥ - ����/24 : ��¥���� ������ �ð���ŭ ���� ��¥�� ��ȯ�Ѵ�

SELECT SYSDATE, 
    SYSDATE + 1/24 AS "1�ð� ���� ��¥",
    SYSDATE + 6/24 AS "6�ð� ���� ��¥",
    SYSDATE + 1    AS "�Ϸ� ������ ��¥",
    TRUNC(SYSDATE - 3)    AS "3�� �� ��¥",
    SYSDATE - 7    AS "������ �� ��¥"
FROM DUAL;

SELECT FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE) - HIRE_DATE AS "�� �ٹ� �ϼ�"
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- ��Ÿ �Լ�
-- nvl(�÷���, null�� �� ��ü�� ��): ������ �÷����� null�� �� ��ü���� ��ȯ�ȴ�
--                               �÷����� ��ü�� ���� ������Ÿ���� ���� ���̴�
--                               NULL ���� �����ϴ� ��Ģ������ ������������ �׻� NULL�̴�
--                               ��Ģ����Ŀ� NULL���� �����ϴ� �÷��� ���ԵǾ� �ִٸ� NVL �Լ��� �����
--                               NULL ���� ������ ������ ��ü�� �� �����ؾ� �Ѵ�.
SELECT NVL(10, 0), NVL(NULL, 0)
FROM DUAL;

-- ��� �������� �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�ϱ�
-- ����: �޿� * 12 + �޿� * Ŀ�̼� * 12
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12
FROM EMPLOYEES;

-- NVL2(�÷���, ��, ��2) : ������ �÷��� ���� NULL�� �ƴϸ� ��1, NULL�̸� ��2�� ��ȯ�ȴ�
--                       ��1�� ��2�� ������Ÿ���� ���� ���̴�.

SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, 'YES', 'NO')
FROM EMPLOYEES;

-- CASE ~ WHEN ���1
-- CASE
--      WHEN ���ǽ�1 THEN ǥ����1     -- ���ǽ�1�� TRUE�� �����Ǹ� ǥ����1�� ��������� �ȴ�
--      WHEN ���ǽ�2 THEN ǥ����2     -- ���ǽ�2�� TRUE�� �����Ǹ� ǥ����2�� ��������� �ȴ�
--      WHEN ���ǽ�3 THEN ǥ����3     
--      ELSE ǥ����4                 -- ���ǽ�1, ���ǽ�2, ���ǽ�3�� ��� FALSE�� �����Ǹ� ǥ����4�� ��������� �ȴ�
-- END

-- CASE ~ WHEN ���2
-- CASE ��
--      WHEN ��1 THEN ǥ����1     -- ��1�� TRUE�� �����Ǹ� ǥ����1�� ��������� �ȴ�
--      WHEN ��2 THEN ǥ����2     -- ��2�� TRUE�� �����Ǹ� ǥ����2�� ��������� �ȴ�
--      WHEN ��3 THEN ǥ����3     
--      ELSE ǥ����4             -- ��1, ��2, ��3�� ��ο� ��ġ���� ������ ǥ����4�� ��������� �ȴ�
-- END

-- ������ ���� ���� ����ϱ�
-- �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ 20000�޷� �Ұ�: 50%, 15000�޷� �ʰ� 40%, 10000�޷� �ʰ� 30%, 5000�޷� �ʰ� 20% �׿� 10%


SELECT FIRST_NAME, 
    SALARY,
    CASE
        WHEN SALARY > 20000 THEN SALARY * 0.5
        WHEN SALARY < 15000 THEN SALARY * 0.4
        WHEN SALARY < 10000 THEN SALARY * 0.3
        WHEN SALARY < 5000  THEN SALARY * 0.2
        ELSE SALARY * 0.1
    END AS TAX
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- TB_SAMPLE_PRODUCTS ���̺��� ī�װ��� ����Ʈ ���޾��� ��ȸ�ϱ�
-- ī�װ��� ����Ʈ���� ��� 1000��, ��Ʈ���� ��� 500��, �º��� ��� 700��, ����Ʈ��ġ�� ��� 600�� �� �ܴ� 200���̴�

SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_DISCOUNT_PRICE,
    CASE PRODUCT_CATEGORY
        WHEN '����Ʈ��' THEN 1000
        WHEN '��Ʈ��' THEN 700
        WHEN '�º�' THEN 500
        WHEN '����Ʈ��ġ' THEN 600
        ELSE 200
    END AS POINT
FROM TB_SAMPLE_PRODUCTS;

-- DECODE(�÷���, ��1, ǥ����1,        -- �÷��� ���� ��1�� ��ġ�ϸ� ǥ����1�� ��������� �ȴ�
--               ��2, ǥ����2,
--               ��3, ǥ����3)

-- DECODE(�÷���, ��1, ǥ����1,        -- �÷��� ���� ��1�� 1ġ�ϸ� ǥ����1�� ��������� �ȴ�
--               ��2, ǥ����2,
--               ��3, ǥ����3,
--               ǥ����4)            -- �÷��� ���� ��1, 2, 3�� ��ġ���� ������ ǥ���� 4�� �������

-- TB_SAMPLE_PRODUCTS ���̺��� ī�װ��� ����Ʈ ���޾��� ��ȸ�ϱ�
-- ī�װ��� ����Ʈ���� ��� 1000��, ��Ʈ���� ��� 500��, �º��� ��� 700��, ����Ʈ��ġ�� ��� 600�� �� �ܴ� 200���̴�

SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE,
       DECODE(PRODUCT_CATEGORY, '����Ʈ��', 1000,
                                '��Ʈ��', 500,
                                '�º�', 700,
                                '����Ʈ��ġ', 600, 200) AS POINT
FROM TB_SAMPLE_PRODUCTS;

--------------------------------------------------------------------------------
-- ��ȯ�Լ�
-- ����Ŭ�� �Ʒ��� 4���� ��ȯ�� �����Ѵ�
-- ���� -> ����
-- ���� -> ����
-- ��¥ -> ����
-- ���� -> ��¥

-- ������ ��ȯ: RDBMS�� �ڵ����� ������Ÿ���� ��ȯ���ִ� ��
-- ����� ��ȯ: ��ȯ�Լ��� ����ؼ� ������Ÿ���� ��ȯ���ִ� ��

-- ������ ��ȯ
SELECT '1000' * 10, '1000' - 10, '1000' + 10, '1000'/10 -- ���� '1000'�� ���� 1000���� ��ȯ
FROM DUAL;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '100'; -- ���� '100'�� EMPLOYEE_ID�� Ÿ�԰� ���� Ÿ������ ��ȯ

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01'; -- ���� '2007/01/01'�� HIRE_DATE�� Ÿ�԰� ���� Ÿ������ ��ȯ

-- ����� ��ȯ
-- ���� --> �����õ� ����
-- ���Ϲ���: 0 ���� �ϳ��� ����, �ش� �ڸ��� ���ڰ� ��� 0�� ��µȴ�
-- ���Ϲ���: 9 ���� �ϳ��� ����, �ش� �ڸ��� ���ڰ� ������ �����ȴ�
-- ���Ϲ���: , �ڸ���
-- ���Ϲ���: . �Ҽ���

-- 1000�� 9,999 ���� ���İ� ���� �����̸� ���ڷ� �ٲ�
SELECT TO_NUMBER('1,000', '9,999') * 10  -- TO_NUMBER('����', '����)�� ���ڰ� ������ ������ ���������� �� ���ڷ� ��ȯ
FROM DUAL;

SELECT TO_CHAR(1000, '9,999,999,999'), TO_CHAR(10000, '9,999,999,999'), TO_CHAR(1000, '0,000,000')
FROM DUAL;

SELECT TO_CHAR(123.456, '999.99'), TO_CHAR(123.46, '000.00'), TO_CHAR(123.4, '999.99'), TO_CHAR(123.4, '000.00')
FROM DUAL;

-- ��¥ -> �����õ� ���ڿ�
-- ���Ϲ���: yyyy Ȥ�� yyyy
-- ���Ϲ���: MM Ȥ�� mm
-- DD / dd
-- AM / am
-- HH / hh
-- MI / mi
-- SS / ss
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), TO_CHAR(SYSDATE, 'HH24:MI:SS'), TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM DUAL;

SELECT SYSDATE - TO_DATE('2021/10/01')
FROM DUAL;

-- 2007�� ��ݱ⿡ �Ի��� ������� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < '2007/07/01';

SELECT *
FROM EMPLOYEES
-- 7�� 1�� 0�� 0�к��� ���� �� ã�ƾ� �ϴϱ� 30 + 1
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/06/30') + 1;

-- 2007�� 1�� 1�Ϻ��� 3�� 31�� ���̿� �Ի��� ���
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/03/31') + 1;
--------------------------------------------------------------------------------
-- ������ �Լ�
-- NULL�� ���� �࿡�� �����ϰ� ����Ѵ�
-- SUM(�÷���)         : �ش� �÷��� �հ踦 ��ȯ�Ѵ�
-- AVG(�÷���)         : �ش� �÷��� ��հ��� ��ȯ�Ѵ�
-- MAX(�÷���)         : �ش� �÷��� �ִ밪�� ��ȯ�Ѵ�
-- MIN(�÷���)         : �ش� �÷��� �ּҰ��� ��ȯ�Ѵ�
-- COUNT(* Ȥ�� �÷���) : ���� ������ ��ȯ�Ѵ� / *�� ��� �ش� �÷��� ���� NULL�̾ ���Խ�Ų��
--                      �÷����� ������ �ش� �÷��� NULL�̸� ���ܵȴ�

-- 60�� �μ��� �Ҽӵ� �������� �ִ�/�ּ� �޿� ��ȸ
SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ��ü ����� ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES;

-- Ŀ�̼��� �޴� ����� ���� ��ȸ�ϱ�
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES; -- NULL�� �ƴ� ���� �˾Ƽ� ����

SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL; -- NULL ���� �ƴ� ���� ���� ã�� ī������

-- ������ �Լ��� �� �׷�� ����� �� �ุ ����� ������ ������ ������ �Լ��� �ƴ� �Ͱ� ���� ����� �� ����
-- �Ʒ� �ڵ�� ����
-- 
--SELECT FIRST_NAME, MAX(SALARY)
--FROM EMPLOYEES;

SELECT MAX(SALARY)
FROM EMPLOYEES;

-- �޿��� ���� ���� ���� ����� �̸��� �޿��� ��ȸ�ϱ�
-- ��������(SUB QUERY) : SELECT���� ����� ���� �Ǵ� ����
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);
                
--------------------------------------------------------------------------------
-- EMPLOYEES ���̺��� �̸��� 8������ �������� �̸��� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 8;

-- EMPLOYEES ���̺��� �̸��� 8���� �̻��� �������� �̸��� ���ڼ��� ��ȸ�ϱ�
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 8;

-- EMPLOYEES ���̺��� ������ �̸��� ���� ��ȯ���� �� ����° ���ڰ� E�� ��� ������ �̸��� ��ȸ�ϱ�
-- ����
SELECT FIRST_NAME, SUBSTR(UPPER(FIRST_NAME), 3, 1)
FROM EMPLOYEES
WHERE SUBSTR(UPPER(FIRST_NAME), 3, 1) = 'E';

-- EMPLOYEES ���̺��� 2007�⵵�� �Ի��� �������� �������̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

-- �Ʒ��� ����� �� ������

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/12/31') + 1;

-- EMPLOYEES ���̺��� 2005�⿡ �Ի��� ���� �߿��� Ŀ�̼��� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
AND HIRE_DATE >= '2005.01.01' AND HIRE_DATE < TO_DATE('2005.12.31') + 1;

-- EMPLOYEES ���̺��� ������ �Ի����� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TRUNC(SYSDATE);

-- EMPLOYEES ���̺��� 10���޿� �Ի��� ��� ������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
-- ����
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM') = 10; 

-- EMPLOYEES ���̺��� �̹��޿� �Ի��� ��� ������� ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/') || '01');

-- EMPLOYEES ���̺��� �޿��� 5000�̻� �޴� �������� ���̵�, �̸�, �޿�, �޿� ����� ��ȸ�ϱ�
-- �޿� ���: 20000�̻� A, 15000�̻� B, 10000�̻� C, �� �ܴ� D ��.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
    CASE
        WHEN SALARY >= 20000 THEN 'A'
        WHEN SALARY >= 15000 THEN 'B'
        WHEN SALARY >= 10000 THEN 'C'
        ELSE 'D'
    END AS GRADE
FROM EMPLOYEES
WHERE SALARY >= 5000
ORDER BY GRADE ASC, SALARY DESC;

-- EMPLOYEES ���̺��� 60�� �μ��� �Ҽӵ� ������� �ٹ��������� ������ �������� ����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- �������̵�, �̸�, �Ի���, �ٹ��������� ��ȸ�Ǿ�� �ϰ�, �ٹ��������� �������� �������� �����Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS ������
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY ������ ASC;

-- ����� �̸��� �޿��� ǥ���ϰ�, �޿��� ���ؼ� #�� ǥ���ϱ�
-- '#'�ϳ��� �޿� 1000�� �ش��Ѵ�.

-- ��¿���
-- ȫ�浿 4300 ####
-- ������ 8700 ########
-- ������ 6500 ######
--                               ����� ����, ����� ������ ����, ä�� ����
SELECT FIRST_NAME, SALARY, LPAD('#', TRUNC(SALARY/1000), '#')
FROM EMPLOYEES;

-- EMPLOYEES ���̺��� 2006�� ��ݱ⿡ �Ի��� �������� �������̵�, �̸�, �Ի���, ������ ����ϱ�
-- ������ �޿�*12 + �޿�*Ŀ�̼�*12��.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12 ANUAL_SALARY
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01' AND HIRE_DATE < TO_DATE('2006/06/30') + 1;

-- EMPLOYEES ���̺��� 100�� ��翡�� �����ϴ� �����߿��� Ŀ�̼��� ���� �������� �������̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
AND MANAGER_ID = 100;

-- EMPLOYEES ���̺��� 80���μ��� �Ҽӵ� �������� ��ձ޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
SELECT ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- EMPLOYEES ���̺��� 100�� ��翡�� �����ϴ� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID = 100;