-- SELECT ���� �⺻ ����
-- SELECT * Ȥ�� Ŭ����
-- FROM ���̺��;

-- ������ ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM DEPARTMENTS;

-- ����(EMPL0YEES) ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM employees;

-- ����(COUNTRIES) ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM countries;

--------------------------------------------------------------------------------
-- ���̺��� ��� ��, ������ �� ��ȸ�ϱ�
-- SELECT Į����, Į����, Į����, ...
-- FROM ���̺��;

-- ����(EMPLOYEES) ���̺��� ���� ���̵�, ���� �̸�, �Ի���, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, hire_date, salary
FROM employees;

-- ����(EMPLOYEES) ���̺���  ���� ���̵�, ���� �̸�, ��ȭ��ȣ, �̸��� ��ȸ�ϱ�
SELECT employee_id, FIRST_NAME, phone_number, EMAIL
FROM employees;

-- �μ�(DEPARTMENT) ���̺��� �μ� ���̵�, �μ��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- ����(JOBS)���̺��� ���� ���̵�, �������� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE
FROM JOBS;

-- ������(COUNTRIES) ���̺��� ������ ���̵�, �ּ�, ���ø� ��ȸ�ϱ�
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES;

--------------------------------------------------------------------------------
-- SELECT ������ ��������� ����ϱ�
-- �������̺��� ���� �̸�, �����޿�, ���� ������ ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, SALARY * 12
FROM EMPLOYEES;

-- �������̺�(JOBS)���� �������̵�, �����޿�, �ְ�޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�
SELECT JOB_ID, MIN_SALARY, MAX_SALARY, max_salary - min_salary
FROM JOBS;

-- �������̺��� ���� ���̵�, �̸�, �޿�, 10�ۼ�Ʈ �λ�� �޿�, �λ�� �ݾ��� ��ȸ�ϱ�
-- SALARY + SALARY * 0.10, SALARY * 0.10 �ص� �ǰ�
SELECT employee_id, FIRST_NAME, SALARY, SALARY * 1.1, SALARY * 1.1 - SALARY
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- SELECT ���� Į���� ��Ī ����ϱ�
-- SELECT �÷��� AS ��Ī, �÷��� AS ��Ī, �÷��� AS ��Ī
-- FROM ���̺��;

-- SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī
-- FROM ���̺��;

-- * ���� ��Ī�� �����̳� Ư�����ڰ� ���ԵǾ� �ִ� ��� ""�� ���ξ� �Ѵ�.

-- ���� ���̺��� ���� ���̵�, �̸�, �޿� ������ ��ȸ�ϱ�
SELECT employee_id AS �������̵�, FIRST_NAME AS �̸�, SALARY AS �޿�, SALARY*12 AS ����
FROM employees;

-- �������̺��� ���� ���̵�, �����޿�, �ְ�޿�, �ְ�޿��� �����޿� ���̸� ��ȸ�ϱ�
SELECT JOB_ID AS ����, MIN_SALARY AS �����޿�, MAX_SALARY AS �ְ�޿�, MAX_SALARY - MIN_SALARY AS "�޿� ����"
FROM JOBS;
-- * ��Ī�� ������ ���Խ�Ű�� ����!
--------------------------------------------------------------------------------
-- �ߺ��� ��� �����ϱ�
-- SELECT DISTINCT �÷���, �÷���, ...
-- FROM ���̺��;

-- �������̺��� �������� �Ҽӵ� �μ����̵� ��ȸ�ϱ�
SELECT DISTINCT DEPARTMENT_ID
FROM employees;

-- JAVA�� ORACLE�� null
-- JAVA���� null : ���������� ������ ��, ���������� ��ü�� �����ϰ� ���� �ʴ�.
-- ORACLE���� null : �� �÷��� ���� �������� �ʾҴ�.

--------------------------------------------------------------------------------
-- ���� �����ϱ� (������ ���͸��ϱ�)
-- SELECT �÷���, �÷���, �÷���, ...
-- FROM ���̺��
-- WHERE ���ǽ�;
-- * ���ǽ��� ���� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�.
-- * ���ǽĿ����� �񱳿�����, ��������, ��Ÿ �����ڵ��� ���ȴ�.
-- * �� ������ : >, <, >=, <=, =, !=, <>(!=�� ���� �ǹ�)
-- * �� ������ : AND OR NOT

-- ����) �޿��� 200000�� �̻� �޴� ����� ��ȸ�ϰ� ���� ��, �̹� �޿� ������ ����� ��ȸ�ϰ� ���� ��,
-- �帣�� �Ҽ��� å�� ��ȸ�ϰ� ���� ��, �й��� 100���� �л��� ������ ��ȸ�ϰ� ���� ��

-- �޿��� 150000�޷� ���� ��������
-- ���� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
-- 1. ��� ���̺� �ִ� �������� ��ȸ�ϱ�

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 15000;

-- 60�� �μ����� ���ϴ� �������� ���� ���̵�, ���� �̸�, �������̵� ��ȸ�ϱ�
-- Employees ���̺��� department_id�� ������ �ҼӺμ� ���̵��.
-- 60�� �μ����� ���ϴ� ������ employees�� department_id�� 60�� ������ ��ȸ�ϴ� ���̴�.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ������ �Ŵ���(SA_MAN)�� �����ϰ� �ִ� ������ ���̵�, �̸�, ��ȭ��ȣ, �̸����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN';

-- �Ʒ��� SELECT ���� ��ȸ�� ����� ����.
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE JOB_ID = 'sa_man';
-- * ����Ŭ�� Ű����� �ĺ���(���̺��, �÷���, ��Ī ��)�� ��ҹ��� �������� �ʴ´�.
-- * ���̺� ����� ���� ��ҹ��ڸ� �����ϰ� �����Ѵ�.

--------------------------------------------------------------------------------
-- WHERE ������ ���� ���� �������� ���� ���͸��ϱ�
-- SELECT �÷���, �÷���, �÷���
-- FROM ���̺��
-- WHERE ���ǽ�1 AND ���ǽ�2 AND ���ǽ�3
-- * �� ���ǽ��� �񱳿�����, ��������, ��Ÿ�����ڸ� ����ؼ� true/false�� �����Ǵ� ���ǽ��̴�.

-- 50�� �μ��� �ҼӵǾ� �ְ�, �޿��� 3000�޷� ���Ϸ� ���� ��������
-- ���� ���̵�, �����̸�, �Ի�����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE department_id = 50 AND SALARY <= 3000;

-- ������ �߿��� �޿��� 10000�޷� �̻� 15000�޷� �̸����� �޴� �������� �������̵�, �̸�, �������̵�, �޿� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY < 15000;

--------------------------------------------------------------------------------
-- ���� �����ϴ� ��Ÿ ������
-- �÷��� ���� null�� ���� ��ȸ�ϱ�
-- SELECT �÷���, �÷���
-- FROM ���̺��
-- WHERE �÷��� IS NULL; / IS NOT NULL

-- �μ������ڰ� ���� �������� ���� �μ��� �μ����̵�, �μ��̸� ��ȸ�ϱ�
SELECT department_id, department_name
FROM DEPARTMENTS
WHERE MANAGER_ID = NULL; 
-- NULL�� �÷��� ���� �������� ���� ���̱� ������ ũ��, �۴�, ����, ���� �ʴ� ���� �� �Ұ�

SELECT department_id, department_name
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL; 

-- �ҼӺμ��� �������� ���� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- �ڽ��� ������(���)�� �������� ���� ����� ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- Ŀ�̼��� �޴� ������ �߿��� �޿��� 10000�޷� �̻� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0 AND SALARY >= 10000;

-- Ŀ�̼��� ���� �ʴ� ������ �߿��� �޿��� 3000�޷� �̻� 5000 �޷� �̸��� ������ ���̵�, �̸�, ���� ���̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL AND SALARY >= 3000 AND SALARY < 5000;

--------------------------------------------------------------------------------
-- ������ ������ ���ϴ� �� ��ȸ�ϱ�
-- BETWEEN A AND B
-- ���ǽ��� ���� A �̻� B ������ ���� ��ȯ�Ѵ�.

-- �޿��� 3000 �̻� 5000 ���Ϸ� �޴� ������ ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

--------------------------------------------------------------------------------
-- ���õ� �� �� �ϳ��� �÷��� ������ ������ TRUE�� �����ϱ�
SELECT �÷���, �÷���, ...
FROM ���̺��
WHERE �÷��� IN (��1, ��2, ��3); -- IN �����ڴ� OR �����ڸ� ��ü�� �� �ִ�
-- IN �����ڴ� �÷���� ���õ� ���� ���ؼ� EQUAL �񱳸� �Ѵ�

-- �Ҽ� �μ� ���̵� 10�̰ų�, 20�̰ų�, 30���� ������ ���̵�, �̸�, �μ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE department_id IN (10, 20, 30);

-- �Ҽ� �μ� ���̵� 10, 20, 30 �� �ϳ��� �޿��� 10000�޷� �̻� �޴� ������
-- ���� ���̵�, �̸�, �Ҽ� �μ� ���̵�, �޿� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE department_id IN (10, 20, 30) AND SALARY >= 10000;
-- * AND�� OR�� ���ǽĿ��� ���� ���Ǹ� OR ���ǳ��� ����� �Ѵ�

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30 AND SALARY >= 10000;

--------------------------------------------------------------------------------
-- ���� �˻��ϱ�
-- SELECT �÷���, �÷���, �÷���
-- FROM ���̺��
-- WHERE �÷��� LIKE '����';
-- ���� ���� : _, %�� �ִ�.

-- �Ŵ����� ���ϰ� �ִ� ������ ���̵�, �̸�, ���� ��ȸ�ϱ�
-- (�Ŵ����� ���ϰ� �ִ� ������ �������̵� XX_MAN�̴�.)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

--------------------------------------------------------------------------------
-- ��ȸ�� �� �����ϱ�

-- ORDER BY ���� ����ϸ� ��ȸ�� ���� ������ �� �ִ�
-- ORDER BY ���� �÷����̳� ǥ������ �����ϸ� �ش� ���� ���ؼ� ������������ ���ĵȴ�
-- ASC, DESC�� �����ϸ� ���Ĺ���� ��������, ������������ ���� �����ϴ� (�������� ������ �������� ����)

-- SELECT �÷���, �÷���, �÷���
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- ORDER BY �÷��� [ASC | DESC] ASCENDIDNG(��������), DESCENDING(��������)
-- []�� ���� �����ϴٴ� �ǹ�

-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �Ի���, �޿��� ��ȸ�ϱ� (�̸����� �������� ����)
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY FIRST_NAME;

-- �޿��� ��������
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY ASC;

-- �Ի��� �� ��������
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY HIRE_DATE DESC;

-- ���� ���� ���̺��� ��� ���������� ���̵�, ����, �����޿��� ��ȸ�ϱ�
-- �����޿��� �������� �������� �����ϱ�
SELECT JOB_ID, JOB_TITLE, MIN_SALARY
FROM JOBS
ORDER BY MIN_SALARY DESC;

-- 6O���� 80�� �μ����� �ٹ����� ������� �޿�, �̸�, �Ի��� ��ȸ�ϱ�
SELECT SALARY, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (60, 80)
ORDER BY SALARY DESC, FIRST_NAME ASC;

--------------------------------------------------------------------------------
-- ���̺� ������ �߰�/����/�����ϱ�

-- �л� �̸�, ��/��/�� ������ �����ϴ� ���̺��� �����ϰ�
-- �ش� ���̺� ���������� �߰�/����/�����ϱ�

-- ���̺� �����ϱ�
CREATE TABLE TB_SCORES (
    -- �л��̸�, ������Ÿ��: �������� ���ڿ�, ���� 20, NULL �� ��� X
    STUDENT_NAME VARCHAR2(20) NOT NULL, 
    -- ���� ����, ������Ÿ��: NUMBER, ����: 3, �Ҽ��� ���� �ִ� 3�ڸ� ����, �⺻��: 0
    KOR_SCORE NUMBER(3,0) DEFAULT 0,   
    ENG_SCORE NUMBER(3,0) DEFAULT 0,   
    MATH_SCORE NUMBER(3,0) DEFAULT 0 
);

-- ���ο� �� �߰��ϱ�
-- INSERT INTO ���̺��(�÷�1, �÷�2, �÷�3, ...) VALUES(��1, ��2, ��3, ...);

-- ���̺��� ��� �÷��� ���� �����ϰ�(NULL���� ����) �÷�������� ���� �����ϴ� ��쿡�� �÷����� �������� �ʾƵ� �ȴ�
-- INSERT INTO ���̺�� VALUES (��1, ��2, ��3, ...); (BUT ��ȣ���� �ʴ� ���)

-- TB_SCORES ���̺� �������� �߰��ϱ�
-- ������, 100, 90, 90
-- ������, 80, 80, 70

INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('������', 100, 90, 90);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('������', 80, 80, 70);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('�̼���', 100, 80, 70);
INSERT INTO TB_SCORES VALUES ('���߱�', 80, 60, 60);
INSERT INTO TB_SCORES VALUES ('������', 90, 90, 90);

-- COMMIT�� ROLLBACK
-- COMMIT: INSERT/UPDATE/DELETE ��ɾ� �������� ���̺� �ݿ���Ų��.
-- ROLLBACK: INSERT/UPDATE/DELETE ��ɾ� �������� ���̺� �ݿ���Ű�� �ʴ´�. ���̺��� �����Ͱ� INSERT/UPDATE/DELETE ���� ������ �ǵ��ư���.
-- * COMMIT�� ROLLBACK�� ����� �Ŀ��� �� �۾��� �ǵ��� �� ����.
-- * ����, COMMIT ���� �� ���̺� �ݿ��� ���� ROLLBACK ��ų �� ����.
-- * ROLLBACK���� �ݿ��� ��ҵ� ���� COMMIT���� �ݿ���ų �� ����.

-- COMMIT ��ɾ �����ϸ� INSERT INTO�� ���̺� �߰��� ���� ���� ���̺� �ݿ��ȴ�
COMMIT;

--------------------------------------------------------------------------------
-- ���̺��� ������ �����ϱ�

-- UPDATE ���̺��
-- SET 
--  �÷���1 = ��1,
--  �÷���2 = ��2,
--  ...
-- [WHERE ���ǽ�]; -- WHERE �������� ���� �����ϴ�. �����ϸ� ���̺��� ��� �࿡ �����۾��� ����ȴ�.
-- ���� WHERE ���� �����ϴ� ���� ���� ����.

UPDATE EMPLOYEES
SET 
    SALARY = 50000
WHERE DEPARTMENT_ID = 60;

UPDATE EMPLOYEES
SET
    SALARY = 50000
WHERE DEPARTMENT_ID IN (10, 20, 30);

-- ROLLBACK ������ �����ߴ� ��� �����۾��� ���̺� �ݿ��� ��ҽ�Ų��.
ROLLBACK;

-- ������ �л��� ���������� ���������� ���� 95�� 85������ �����ϱ�
UPDATE TB_SCORES
SET
    ENG_SCORE = 95,
    MATH_SCORE = 85
WHERE STUDENT_NAME = '������';

-- ������ ��� �÷��� ���� �����ϱ�
UPDATE TB_SCORES
SET
    TOTAL_SCORE = KOR_SCORE + ENG_SCORE + MATH_SCORE,
    AVERAGE = (KOR_SCORE + ENG_SCORE + MATH_SCORE)/3;
-- * �÷��� ���� �����ϱ� ���ؼ� ���� �÷��� ���� ����ϴ� ���� �����ϴ�.
-- * �÷��� ���� �����ϱ� ���ؼ� ��Ģ ������ �����ϴ� ǥ���ĵ� �������.

COMMIT;

