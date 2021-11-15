-- departments ���̺��� ��� ��, ��� ���� ��ȸ�ϱ�
SELECT *
FROM DEPARTMENTS;

-- departments ���̺��� �μ����̵�, �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- ������ ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12��.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*12 ANNUAL_SALARY
FROM EMPLOYEES;

-- �������� �ð� �ִ� �������̵� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- �������� �Ҽӵ� �μ��̸��� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID
                        FROM EMPLOYEES);

-- 90�� �μ����� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

-- �޿��� 15000�޷� �̻� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY >= 15000;

-- �޿��� 2500�޷� �̻� 3500�޷� ���Ϸ� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 2500 AND SALARY <= 3500;

-- Ŀ�̼��� �޴� �������̵�� �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�ϱ�
-- ������ �޿�*12 + �޿�*Ŀ�̼�*12��. Ŀ�̼� �ݾ��� �Ҽ����Ʒ��� ������.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*12 + SALARY*COMMISSION_PCT*12 ANNUAL_SALARY 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- ������ �����Ǿ� ���� �ʴ� ������ ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.SALARY >= MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.MANAGER_ID IS NULL;

-- �޿��� 10000�޷� �̻� �ް�, �������̵� 'MAN'���� ������ ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000
AND JOB_ID LIKE '%MAN';

-- 10,20,40�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �ҼӺμ����� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.DEPARTMENT_ID IN (10, 20, 40);

-- *�޿��� 10000�޷� �̻� �޴� �������� �μ��̸�, �޿�, �������̵�, �̸��� ��ȸ�ϱ� 
-- *�μ��̸��� ��������, �޿��� ���� ������������ �����ؼ� ��ȸ�Ͻÿ�.
SELECT D.DEPARTMENT_NAME, E.SALARY, E.EMPLOYEE_ID, E.FIRST_NAME
FROM EMPLOYEES E, DEPARTMENTS D 
WHERE E.SALARY >= 10000
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_NAME DESC;

-- ������ �������� �������� �ٹ� �������� ��ȸ�ؼ� �������̵�, �̸�, �Ի���, �ٹ��������� ��ȸ�ϱ�
-- �ٹ����� ���� �Ҽ������ϴ� ������, �ٹ��������� �������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) WORKING_MONTHS
FROM EMPLOYEES
ORDER BY WORKING_MONTHS DESC;

-- ������ �������� ���������� �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TRUNC(SYSDATE - 7) AND HIRE_DATE < TRUNC(SYSDATE - 7) + 1;

-- ���� ������ ���� �Ի��� ���� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TRUNC(SYSDATE) - HIRE_DATE <= 7;

-- ������ ���� �Ի��� ��� 
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TRUNC(SYSDATE) - TRUCN(HIRE_DATE) = 7;

--  2007�� ��ݱ⿡ �Ի��� ������� ���̵�, �̸�, �Ի���, �������̵� ��ȸ�ϱ�
-- �Ի����� �������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/06/30') + 1
ORDER BY HIRE_DATE ASC;

-- ��� ������� ������̵�, �̸�, �޿�, Ŀ�̼�, ����, �޿������ ��ȸ�ϰ� �޿���޿� ���� ������������ ��ȸ�Ѵ�.
-- ������ �޿�*12 + �޿�*Ŀ�̼�*12��. Ŀ�̼� �ݾ��� �Ҽ����Ʒ��� ������.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.COMMISSION_PCT, 
       E.SALARY*12 + E.SALARY*NVL(COMMISSION_PCT, 0)*12 ANNUAL_SALARY
FROM EMPLOYEES E, SALARY_GRADE S 
WHERE E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY 
ORDER BY S.GRADE DESC;

-- �޿��� 15000�޷� �̻� ������ 10% �޿��λ�, 10000�޷� �̻� ������ 15% �޿��λ�, �׿ܴ� 20% �޿��� �λ�� ������ ��ȸ�ϱ�
-- ������̵�, �̸�, �޿�, �λ�� �޿��� ��ȸ�Ѵ�. case  ~ when ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, 
       CASE
            WHEN SALARY >= 15000 THEN SALARY + SALARY*0.1
            WHEN SALARY >= 10000 THEN SALARY + SALARY*0.15
            ELSE SALARY + SALARY*0.2
       END AS INCREASED_SALARY
FROM EMPLOYEES;

-- �μ���ȣ�� 10���� ��� 10% �޿��λ�, 20���� ��� 15% �޿��λ�, �׿� 20% �޿��� �λ�� ���� ��ȸ�ϱ�
-- ������̵�, �̸�, �޿�, �λ�� �޿��� ��ȸ�Ѵ�. decode() �Լ� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       DECODE(DEPARTMENT_ID, 10, SALARY + SALARY*0.1,
                             20, SALARY + SALARY*0.15,
                             SALARY + SALARY*0.2) AS INCREASED_SALARY
FROM EMPLOYEES;                             

-- ������̵�, ����̸�, ����� �Ҽӵ� �μ���ȣ�� �μ��̸��� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- �μ����̵�, �μ��̸�, �μ�����ھ��̵�, �μ������ �̸� ��ȸ�ϱ�
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
ORDER BY D.DEPARTMENT_ID;

-- ����� ���̵�, ����̸�, �ҼӺμ� ���̵�, �ҼӺμ��̸�, �ҼӺμ��� ��ġ�� ���� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY 
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

-- �μ����̵�, �μ��̸�, �μ�����ھ��̵�, �μ������ �̸�, �� �μ��� ��ġ�� ���� ��ȸ�ϱ�
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME, L.CITY
FROM DEPARTMENTS D, EMPLOYEES E, LOCATIONS L
WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY DEPARTMENT_ID;

-- ��� ���̵�, ����̸�, �ڽ��� �Ŵ��� ���̵�, �Ŵ��� �̸� ��ȸ�ϱ�
SELECT EMP.EMPLOYEE_ID EMP_ID, EMP.FIRST_NAME EMP_NAME, MGR.EMPLOYEE_ID MGR_ID, MGR.FIRST_NAME MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID(+)
ORDER BY EMP.EMPLOYEE_ID;

-- ����� �߿��� �޿��� ���� ���� �޴� ���� 3���� �������̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 3; 

-- ��ü ������ ��ձ޿����� ���� �޿��� �޴� ����� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES)
ORDER BY EMPLOYEE_ID;

-- �μ��� �޿������ ��ȸ�ؼ� �μ����̵�, ��ձ޿��� ǥ���ϱ�
-- ��ձ޿��� �Ҽ������� �κ��� �ݿø��Ѵ�.
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- ������� ���� ���� �μ� 2���� �μ����̵�, �μ���, ������� ��ȸ�ϱ�
SELECT A.DEPARTMENT_ID, D.DEPARTMENT_NAME, A.CNT
FROM (SELECT DEPARTMENT_ID, CNT
      FROM (SELECT DEPARTMENT_ID, COUNT(*) CNT
            FROM EMPLOYEES
            WHERE DEPARTMENT_ID IS NOT NULL
            GROUP BY DEPARTMENT_ID 
            ORDER BY CNT DESC)
      WHERE ROWNUM <= 2) A, DEPARTMENTS D
WHERE A.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY A.CNT DESC;

-- 80�� �μ��� �Ҽӵ� ������� �޿� ������ �������� �����ؼ� ��ŷ, ������̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT SALARY_RANK, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY ASC) SALARY_RANK,
             EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES
      WHERE DEPARTMENT_ID = 80);

-- ������� �޿������� �����ϰ�, ������ �ο����� �� 6~10��°�� ���ϴ� ������� ����, ������̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT SALARY_ROW_NUMBER, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) SALARY_ROW_NUMBER,
             EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES)
WHERE SALARY_ROW_NUMBER >= 6 AND SALARY_ROW_NUMBER <= 10;
 
-- Employees ���̺��� �����ں� ������� ����ϰ�, �� �������� �̸��� �����ϴ� ������� ��ȸ�ϱ�
SELECT MGR.EMPLOYEE_ID, MGR.FIRST_NAME, EMP.CNT
FROM (SELECT MANAGER_ID, COUNT(*) CNT
      FROM EMPLOYEES 
      WHERE MANAGER_ID IS NOT NULL
      GROUP BY MANAGER_ID) EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID;
