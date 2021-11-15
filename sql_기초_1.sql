-- SELECT 문의 기본 구조
-- SELECT * 혹은 클럼명
-- FROM 테이블명;

-- 지정한 테이블의 모든 행, 모든 열 조회하기
SELECT *
FROM DEPARTMENTS;

-- 직원(EMPL0YEES) 테이블의 모든 행, 모든 열 조회하기
SELECT *
FROM employees;

-- 국가(COUNTRIES) 테이블의 모든 행, 모든 열 조회하기
SELECT *
FROM countries;

--------------------------------------------------------------------------------
-- 테이블의 모든 행, 지정한 열 조회하기
-- SELECT 칼럼명, 칼럼명, 칼럼명, ...
-- FROM 테이블명;

-- 직원(EMPLOYEES) 테이블에서 직원 아이디, 직원 이름, 입사일, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, hire_date, salary
FROM employees;

-- 직원(EMPLOYEES) 테이블에서  직원 아이디, 직원 이름, 전화번호, 이메일 조회하기
SELECT employee_id, FIRST_NAME, phone_number, EMAIL
FROM employees;

-- 부서(DEPARTMENT) 테이블에서 부서 아이디, 부서명 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- 직종(JOBS)테이블에서 직종 아이디, 직종제목 조회하기
SELECT JOB_ID, JOB_TITLE
FROM JOBS;

-- 소재지(COUNTRIES) 테이블에서 소재지 아이디, 주소, 도시명 조회하기
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES;

--------------------------------------------------------------------------------
-- SELECT 문에서 산술연산자 사용하기
-- 직원테이블에서 직원 이름, 직원급여, 직원 연봉을 조회하기
SELECT FIRST_NAME, SALARY, SALARY * 12
FROM EMPLOYEES;

-- 직종테이블(JOBS)에서 직종아이디, 최저급여, 최고급여, 최고급여와 최저급여의 차이를 조회하기
SELECT JOB_ID, MIN_SALARY, MAX_SALARY, max_salary - min_salary
FROM JOBS;

-- 직원테이블에서 직원 아이디, 이름, 급여, 10퍼센트 인상된 급여, 인상된 금액을 조회하기
-- SALARY + SALARY * 0.10, SALARY * 0.10 해도 되고
SELECT employee_id, FIRST_NAME, SALARY, SALARY * 1.1, SALARY * 1.1 - SALARY
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- SELECT 절의 칼럼명에 별칭 사용하기
-- SELECT 컬럼명 AS 별칭, 컬럼명 AS 별칭, 컬럼명 AS 별칭
-- FROM 테이블명;

-- SELECT 컬럼명 별칭, 컬럼명 별칭, 컬럼명 별칭
-- FROM 테이블명;

-- * 만약 별칭에 공백이나 특수문자가 포함되어 있는 경우 ""로 감싸야 한다.

-- 직원 테이블에서 직원 아이디, 이름, 급여 연봉을 조회하기
SELECT employee_id AS 직원아이디, FIRST_NAME AS 이름, SALARY AS 급여, SALARY*12 AS 연봉
FROM employees;

-- 직종테이블에서 직종 아이디, 최저급여, 최고급여, 최고급여와 최저급여 차이를 조회하기
SELECT JOB_ID AS 직종, MIN_SALARY AS 최저급여, MAX_SALARY AS 최고급여, MAX_SALARY - MIN_SALARY AS "급여 차이"
FROM JOBS;
-- * 별칭에 공백을 포함시키지 말자!
--------------------------------------------------------------------------------
-- 중복된 결과 제거하기
-- SELECT DISTINCT 컬럼명, 컬럼명, ...
-- FROM 테이블명;

-- 직원테이블에서 직원들이 소속된 부서아이디 조회하기
SELECT DISTINCT DEPARTMENT_ID
FROM employees;

-- JAVA와 ORACLE의 null
-- JAVA에서 null : 참조변수가 가지는 값, 참조변수가 객체를 참조하고 있지 않다.
-- ORACLE에서 null : 그 컬럼의 값이 결정되지 않았다.

--------------------------------------------------------------------------------
-- 행을 제한하기 (데이터 필터링하기)
-- SELECT 컬럼명, 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- WHERE 조건식;
-- * 조건식의 값이 TRUE로 판정되는 행만 조회된다.
-- * 조건식에서는 비교연산자, 논리연산자, 기타 연산자들이 사용된다.
-- * 비교 연산자 : >, <, >=, <=, =, !=, <>(!=와 같은 의미)
-- * 논리 연산자 : AND OR NOT

-- 예시) 급여를 200000불 이상 받는 사람을 조회하고 싶을 때, 이번 달에 생일인 사람을 조회하고 싶을 때,
-- 장르가 소설인 책을 조회하고 싶을 때, 학번이 100번인 학생의 성적을 조회하고 싶을 때

-- 급여를 150000달러 받은 직원들의
-- 직원 아이디, 이름, 급여를 조회하기
-- 1. 어느 테이블에 있는 값들인지 조회하기

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 15000;

-- 60번 부서에서 일하는 직원들의 직원 아이디, 직원 이름, 직종아이디를 조회하기
-- Employees 테이블의 department_id는 직원의 소속부서 아이디다.
-- 60번 부서에서 일하는 직원은 employees의 department_id가 60인 직원을 조회하는 것이다.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 세일즈 매니저(SA_MAN)로 종사하고 있는 직원의 아이디, 이름, 전화번호, 이메일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN';

-- 아래의 SELECT 문은 조회된 결과가 없다.
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE JOB_ID = 'sa_man';
-- * 오라클의 키워드와 식별자(테이블명, 컬럼명, 별칭 등)은 대소문자 구분하지 않는다.
-- * 테이블에 저장된 값은 대소문자를 엄격하게 구분한다.

--------------------------------------------------------------------------------
-- WHERE 절에서 여러 개의 조건으로 행을 필터링하기
-- SELECT 컬럼명, 컬럼명, 컬럼명
-- FROM 테이블명
-- WHERE 조건식1 AND 조건식2 AND 조건식3
-- * 각 조건식은 비교연산자, 논리연산자, 기타연산자를 사용해서 true/false로 판정되는 조건식이다.

-- 50번 부서에 소속되어 있고, 급여를 3000달러 이하로 받은 직원들의
-- 직원 아이디, 직원이름, 입사일자, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE department_id = 50 AND SALARY <= 3000;

-- 직원들 중에서 급여를 10000달러 이상 15000달러 미만으로 받는 직원들의 직원아이디, 이름, 직종아이디, 급여 조회
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY < 15000;

--------------------------------------------------------------------------------
-- 행을 제한하는 기타 연산자
-- 컬럼의 값이 null인 행을 조회하기
-- SELECT 컬럼명, 컬럼명
-- FROM 테이블명
-- WHERE 컬럼명 IS NULL; / IS NOT NULL

-- 부서관리자가 아직 지정되지 않은 부서의 부서아이디, 부서이름 조회하기
SELECT department_id, department_name
FROM DEPARTMENTS
WHERE MANAGER_ID = NULL; 
-- NULL은 컬럼의 값이 정해지지 않은 것이기 때문에 크다, 작다, 같다, 같지 않다 등의 비교 불가

SELECT department_id, department_name
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL; 

-- 소속부서가 지정되지 않은 사원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- 자신의 관리자(상사)가 지정되지 않은 사원의 아이디, 이름, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 커미션을 받는 직원들 중에서 급여를 10000달러 이상 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0 AND SALARY >= 10000;

-- 커미션을 받지 않는 직원들 중에서 급여가 3000달러 이상 5000 달러 미만인 직원의 아이디, 이름, 직종 아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL AND SALARY >= 3000 AND SALARY < 5000;

--------------------------------------------------------------------------------
-- 지정된 범위에 속하는 행 조회하기
-- BETWEEN A AND B
-- 조건식의 값이 A 이상 B 이하인 참을 반환한다.

-- 급여를 3000 이상 5000 이하로 받는 직원의 아이디, 이름, 급여, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

--------------------------------------------------------------------------------
-- 제시된 값 중 하나를 컬럼이 가지고 있으면 TRUE로 판정하기
SELECT 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 컬럼명 IN (값1, 값2, 값3); -- IN 연산자는 OR 연산자를 대체할 수 있다
-- IN 연산자는 컬럼명과 제시된 값에 대해서 EQUAL 비교만 한다

-- 소속 부서 아이디가 10이거나, 20이거나, 30번인 직원의 아이디, 이름, 부서 아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE department_id IN (10, 20, 30);

-- 소속 부서 아이디가 10, 20, 30 중 하나고 급여를 10000달러 이상 받는 직원의
-- 직원 아이디, 이름, 소속 부서 아이디, 급여 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE department_id IN (10, 20, 30) AND SALARY >= 10000;
-- * AND와 OR가 조건식에서 같이 사용되면 OR 조건끼리 묶어야 한다

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30 AND SALARY >= 10000;

--------------------------------------------------------------------------------
-- 패턴 검색하기
-- SELECT 컬럼명, 컬럼명, 컬럼명
-- FROM 테이블명
-- WHERE 컬럼명 LIKE '패턴';
-- 패턴 문자 : _, %가 있다.

-- 매니저로 일하고 있는 직원의 아이디, 이름, 직종 조회하기
-- (매니저로 일하고 있는 직원은 직종아이디가 XX_MAN이다.)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

--------------------------------------------------------------------------------
-- 조회된 행 정렬하기

-- ORDER BY 절을 사용하면 조회된 행을 정렬할 수 있다
-- ORDER BY 절에 컬럼명이나 표현식을 지정하면 해당 값에 대해서 오름차순으로 정렬된다
-- ASC, DESC을 지정하면 정렬방식을 오름차순, 내림차순으로 변경 가능하다 (지정하지 않으면 오름차순 정렬)

-- SELECT 컬럼명, 컬럼명, 컬럼명
-- FROM 테이블명
-- [WHERE 조건식]
-- ORDER BY 컬럼명 [ASC | DESC] ASCENDIDNG(오름차순), DESCENDING(내림차순)
-- []는 생략 가능하다는 의미

-- 60번 부서에 소속된 직원들의 아이디, 이름, 입사일, 급여를 조회하기 (이름으로 오름차순 정렬)
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY FIRST_NAME;

-- 급여순 오름차순
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY ASC;

-- 입사일 순 내림차순
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY HIRE_DATE DESC;

-- 직종 정보 테이블에서 모든 직종정보의 아이디, 제목, 최저급여를 조회하기
-- 최저급여를 기준으로 내림차순 정렬하기
SELECT JOB_ID, JOB_TITLE, MIN_SALARY
FROM JOBS
ORDER BY MIN_SALARY DESC;

-- 6O번과 80번 부서에서 근무중인 사원들의 급여, 이름, 입사일 조회하기
SELECT SALARY, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (60, 80)
ORDER BY SALARY DESC, FIRST_NAME ASC;

--------------------------------------------------------------------------------
-- 테이블에 데이터 추가/변경/삭제하기

-- 학생 이름, 국/영/수 점수를 저장하는 테이블을 정의하고
-- 해당 테이블에 성적정보를 추가/변경/삭제하기

-- 테이블 생성하기
CREATE TABLE TB_SCORES (
    -- 학생이름, 데이터타입: 가변길이 문자열, 길이 20, NULL 값 허용 X
    STUDENT_NAME VARCHAR2(20) NOT NULL, 
    -- 국어 점수, 데이터타입: NUMBER, 길이: 3, 소숫점 없는 최대 3자리 정수, 기본값: 0
    KOR_SCORE NUMBER(3,0) DEFAULT 0,   
    ENG_SCORE NUMBER(3,0) DEFAULT 0,   
    MATH_SCORE NUMBER(3,0) DEFAULT 0 
);

-- 새로운 행 추가하기
-- INSERT INTO 테이블명(컬럼1, 컬럼2, 컬럼3, ...) VALUES(값1, 값2, 값3, ...);

-- 테이블의 모든 컬럼에 값을 지정하고(NULL값도 가능) 컬럼순서대로 값을 지정하는 경우에는 컬럼명을 나열하지 않아도 된다
-- INSERT INTO 테이블명 VALUES (값1, 값2, 값3, ...); (BUT 선호하지 않는 방법)

-- TB_SCORES 테이블에 성적정보 추가하기
-- 김유신, 100, 90, 90
-- 강감찬, 80, 80, 70

INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('김유신', 100, 90, 90);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('강감찬', 80, 80, 70);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('이순신', 100, 80, 70);
INSERT INTO TB_SCORES VALUES ('안중근', 80, 60, 60);
INSERT INTO TB_SCORES VALUES ('유관순', 90, 90, 90);

-- COMMIT과 ROLLBACK
-- COMMIT: INSERT/UPDATE/DELETE 명령어 실행결과를 테이블에 반영시킨다.
-- ROLLBACK: INSERT/UPDATE/DELETE 명령어 실행결과를 테이블에 반영시키지 않는다. 테이블의 데이터가 INSERT/UPDATE/DELETE 실행 전으로 되돌아간다.
-- * COMMIT과 ROLLBACK이 실행된 후에는 그 작업을 되돌릴 수 없다.
-- * 따라서, COMMIT 실행 후 테이블에 반영된 것을 ROLLBACK 시킬 수 없다.
-- * ROLLBACK으로 반영이 취소된 것을 COMMIT으로 반영시킬 수 없다.

-- COMMIT 명령어를 실행하면 INSERT INTO로 테이블에 추가한 행이 실제 테이블에 반영된다
COMMIT;

--------------------------------------------------------------------------------
-- 테이블의 데이터 변경하기

-- UPDATE 테이블명
-- SET 
--  컬럼명1 = 값1,
--  컬럼명2 = 값2,
--  ...
-- [WHERE 조건식]; -- WHERE 조건절은 생략 가능하다. 생략하면 테이블의 모든 행에 변경작업이 실행된다.
-- 따라서 WHERE 절을 생략하는 경우는 거의 없다.

UPDATE EMPLOYEES
SET 
    SALARY = 50000
WHERE DEPARTMENT_ID = 60;

UPDATE EMPLOYEES
SET
    SALARY = 50000
WHERE DEPARTMENT_ID IN (10, 20, 30);

-- ROLLBACK 위에서 실행했던 모든 변경작업의 테이블 반영을 취소시킨다.
ROLLBACK;

-- 김유신 학생의 영어점수와 수학점수를 각각 95점 85점으로 변경하기
UPDATE TB_SCORES
SET
    ENG_SCORE = 95,
    MATH_SCORE = 85
WHERE STUDENT_NAME = '김유신';

-- 총점과 평균 컬럼의 값을 변경하기
UPDATE TB_SCORES
SET
    TOTAL_SCORE = KOR_SCORE + ENG_SCORE + MATH_SCORE,
    AVERAGE = (KOR_SCORE + ENG_SCORE + MATH_SCORE)/3;
-- * 컬럼의 값을 변경하기 위해서 기존 컬럼의 값을 사용하는 것이 가능하다.
-- * 컬럼의 값을 변경하기 위해서 사칙 연산을 포함하는 표현식도 상관없다.

COMMIT;

