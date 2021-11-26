-- 문자 함수
-- 대소문자 반환
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 문자열 잘라내기
-- 오라클은 인덱스가 1부터 시작한다
SELECT JOB_ID, SUBSTR(JOB_ID, 4) -- 네번째 위치부터 끝까지 잘라내라는 의미
FROM JOBS;

-- 문자열 길이 조회하기
-- LENGTH(컬럼명) : 해당 컬럼에 저장된 값의 길이를 반환한다.
SELECT JOB_ID, LENGTH(JOB_ID)
FROM EMPLOYEES
ORDER BY LENGTH(JOB_ID) DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY JOB_ID_LENGTH DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY 2 DESC;

-- 문자열 채우기
SELECT FIRST_NAME, LPAD(FIRST_NAME, 15, '#'), RPAD(FIRST_NAME,15, '#')
FROM EMPLOYEES;

SELECT LPAD('1234', 10, '0'), LPAD('12', 10, '0'), LPAD(123456,10,'0')
FROM DUAL;

-- DUAL은 오라클에 내장된 1행 1열짜리 테이블이다.
-- 간단한 연산의 결과를 조회해야 할 때 많이 사용한다.
SELECT *
FROM DUAL;

-- 문자열 연결하기
-- CONCAT(컬럼명1, 컬럼명2) ; 지정된 컬럼의 값들을 서로 이어붙인다.
-- 컬럼명 || 컬럼명2 || 컬럼명3 || ... || 컬렴명N l n개 컬럼의 값들을 서로 이어붙인다.
SELECT FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, LAST_NAME), FIRST_NAME || '' || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 불필요한 공백 없애기
-- trim(컬럼명) : 지정된 컬럼의 값 왼쪽, 오른쪽에 위치한 무의미한 공백을 제거한다.
SELECT TRIM('                                  ABC     ABC    ABC              ')
FROM DUAL;

-- 문자열 바꾸기
-- replace(컬럼명, 찾는 문자열, 대체할 문자열) : 지정한 컬럼에서 특정 문자열을 찾아서 다른 문자열로 대체시킨다.
SELECT FIRST_NAME, REPLACE(LOWER(FIRST_NAME), 'a', '*')
FROM EMPLOYEES;

-- 문자열 찾기
-- INSTR(컬럼명, '찾는 문자열') : 지정한 컬럼에서 찾는 문자열의 위치를 찾아 반환한다.
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'e')
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- 숫자함수
-- ROUND(컬럼명) : 숫자를 일자리로 반올림한다.
-- ROUND(컬럼명, 자리수) : 숫자를 지정된 자리수까지 반올림한다.
--                      자리수가 양의 정수면 소수점 자리수, 자리수가 음의 정수면 1, 10, 100의 자리 등으로 반올림
--           소숫점 두번째자리    소숫점 첫번째자리                       10의 자리
SELECT ROUND(123.45, 2), ROUND(123.45, 1), ROUND(123.45, 0), ROUND(123.45, -1), ROUND(123.45, -2)
FROM DUAL;

-- 소수점값 버리기
-- TRUNC(컬럼명) : 소수 전부를 반올림하지 않고 무조건 버린다
SELECT ROUND(123.45), ROUND(123.55), TRUNC(123.45), TRUNC(123.55)
FROM DUAL;

-- 천장값과 바닥값 구하기
-- CEIL : 자신보다 큰 정수 중에서 가장 작은 정수를 반환한다
-- FLOOR : 자신보다 가장 작은 정수 중에서 가장 큰 정수를 반환한다.
SELECT ROUND(2.6), TRUNC(2.6), CEIL(2.5), FLOOR(2.5)
FROM DUAL;

-- 나머지 구하기
-- MOD(숫자1, 숫자2) : 첫번째 숫자를 두번째 숫자로 나누어 나머지를 반환한다
SELECT MOD(10, 3), MOD(5, 3)
FROM DUAL;

--------------------------------------------------------------------------------
-- 날짜 함수
-- SYSDATE : 시스템의 현재 날짜와 시간정보를 반환하는 함수
SELECT SYSDATE
FROM DUAL;

-- 날짜 반올림 및 시간 정보 지우기
-- ROUND(날짜) : 해당 날짜의 시간이 정오를 넘었을 경우 하루가 증가된 값이 반환된다
-- TRUNC(날짜) : 해당 날짜의 모든 시간정보를 0으로 바꾼 값이 반환된다
SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- MONTH_BETEEN(날짜1, 날짜2) : 두 날짜 사이의 개월수를 반환한다
SELECT FIRST_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ADD_MONTH(날짜, 개월수) : 날짜에서 지정된 개월수만큼 변경된 날짜를 반환한다
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -3), ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- LAST_DAY(날짜) : 해당 날짜가 속한 달의 맨 마지막날짜를 반환한다
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- 날짜 연산
-- 날짜 + 숫자 : 날짜에서 지정된 숫자만큼 경과된 날짜를 반환한다
-- 날짜 - 숫자 : 날짜에서 지정된 숫자만큼 이전 날짜를 반환한다
-- 날짜 - 날짜 : 두 날짜 사이의 일수를 반환한다
-- 날짜 + 날짜 : 오류
-- 날짜 + 숫자/24 : 날짜에서 지정된 시간만큼 경과된 날짜를 반환한다
-- 날짜 - 숫자/24 : 날짜에서 지정된 시간만큼 이전 날짜를 반환한다

SELECT SYSDATE, 
    SYSDATE + 1/24 AS "1시간 이후 날짜",
    SYSDATE + 6/24 AS "6시간 이후 날짜",
    SYSDATE + 1    AS "하루 증가된 날짜",
    TRUNC(SYSDATE - 3)    AS "3일 전 날짜",
    SYSDATE - 7    AS "일주일 전 날짜"
FROM DUAL;

SELECT FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE) - HIRE_DATE AS "총 근무 일수"
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- 기타 함수
-- nvl(컬럼명, null일 때 대체할 값): 지정된 컬럼값이 null일 때 대체값이 반환된다
--                               컬럼값과 대체할 값은 데이터타입이 같은 값이다
--                               NULL 값을 포함하는 사칙연산의 최종연산결과는 항상 NULL이다
--                               사칙연산식에 NULL값을 포함하는 컬럼이 포함되어 있다면 NVL 함수를 사용해
--                               NULL 값을 적절한 값으로 대체한 후 연산해야 한다.
SELECT NVL(10, 0), NVL(NULL, 0)
FROM DUAL;

-- 모든 직원들의 이름, 급여, 커미션, 연봉을 조회하기
-- 연봉: 급여 * 12 + 급여 * 커미션 * 12
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12
FROM EMPLOYEES;

-- NVL2(컬럼명, 값, 값2) : 지정된 컬럼의 값이 NULL이 아니면 값1, NULL이면 값2가 반환된다
--                       값1과 값2는 데이터타입이 같은 값이다.

SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, 'YES', 'NO')
FROM EMPLOYEES;

-- CASE ~ WHEN 용법1
-- CASE
--      WHEN 조건식1 THEN 표현식1     -- 조건식1이 TRUE로 판정되면 표현식1이 최종결과가 된다
--      WHEN 조건식2 THEN 표현식2     -- 조건식2가 TRUE로 판정되면 표현식2이 최종결과가 된다
--      WHEN 조건식3 THEN 표현식3     
--      ELSE 표현식4                 -- 조건식1, 조건식2, 조건식3이 모두 FALSE로 판정되면 표현식4가 최종결과가 된다
-- END

-- CASE ~ WHEN 용법2
-- CASE 값
--      WHEN 값1 THEN 표현식1     -- 값1이 TRUE로 판정되면 표현식1이 최종결과가 된다
--      WHEN 값2 THEN 표현식2     -- 값2가 TRUE로 판정되면 표현식2이 최종결과가 된다
--      WHEN 값3 THEN 표현식3     
--      ELSE 표현식4             -- 값1, 값2, 값3이 모두와 일치하지 않으면 표현식4가 최종결과가 된다
-- END

-- 연봉에 따른 세금 계산하기
-- 이름, 급여, 세금을 조회하기
-- 세금은 20000달러 촤과: 50%, 15000달러 초과 40%, 10000달러 초과 30%, 5000달러 초과 20% 그외 10%


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

-- TB_SAMPLE_PRODUCTS 테이블에서 카테고리별 포인트 지급액을 조회하기
-- 카테고리가 스마트폰인 경우 1000점, 노트북인 경우 500점, 태블릿인 경우 700점, 스마트워치인 경우 600점 그 외는 200점이다

SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_DISCOUNT_PRICE,
    CASE PRODUCT_CATEGORY
        WHEN '스마트폰' THEN 1000
        WHEN '노트북' THEN 700
        WHEN '태블릿' THEN 500
        WHEN '스마트워치' THEN 600
        ELSE 200
    END AS POINT
FROM TB_SAMPLE_PRODUCTS;

-- DECODE(컬럼명, 값1, 표현식1,        -- 컬럼의 값이 값1가 일치하면 표현식1이 최종결과가 된다
--               값2, 표현식2,
--               값3, 표현식3)

-- DECODE(컬럼명, 값1, 표현식1,        -- 컬럼의 값이 값1과 1치하면 표현식1이 최종결과가 된다
--               값2, 표현식2,
--               값3, 표현식3,
--               표현식4)            -- 컬럼의 값이 값1, 2, 3과 일치하지 않으면 표현식 4가 최종결과

-- TB_SAMPLE_PRODUCTS 테이블에서 카테고리별 포인트 지급액을 조회하기
-- 카테고리가 스마트폰인 경우 1000점, 노트북인 경우 500점, 태블릿인 경우 700점, 스마트워치인 경우 600점 그 외는 200점이다

SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE,
       DECODE(PRODUCT_CATEGORY, '스마트폰', 1000,
                                '노트북', 500,
                                '태블릿', 700,
                                '스마트워치', 600, 200) AS POINT
FROM TB_SAMPLE_PRODUCTS;

--------------------------------------------------------------------------------
-- 변환함수
-- 오라클은 아래의 4가지 변환을 지원한다
-- 숫자 -> 문자
-- 문자 -> 숫자
-- 날짜 -> 문자
-- 문자 -> 날짜

-- 묵시적 변환: RDBMS가 자동으로 데이터타입을 변환해주는 것
-- 명시적 변환: 변환함수를 사용해서 데이터타입을 변환해주는 것

-- 묵시적 변환
SELECT '1000' * 10, '1000' - 10, '1000' + 10, '1000'/10 -- 문자 '1000'이 숫자 1000으로 변환
FROM DUAL;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '100'; -- 문자 '100'이 EMPLOYEE_ID의 타입과 같은 타입으로 변환

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01'; -- 문자 '2007/01/01'이 HIRE_DATE의 타입과 같은 타입으로 변환

-- 명시적 변환
-- 숫자 --> 포맷팅된 문자
-- 패턴문자: 0 숫자 하나와 대응, 해당 자리에 숫자가 없어도 0이 출력된다
-- 패턴문자: 9 숫자 하나와 대응, 해당 자리에 숫자가 없으면 생략된다
-- 패턴문자: , 자리수
-- 패턴문자: . 소수점

-- 1000이 9,999 숫자 형식과 같은 패턴이면 숫자로 바뀜
SELECT TO_NUMBER('1,000', '9,999') * 10  -- TO_NUMBER('문자', '패턴)은 문자가 지정된 패턴의 숫자형식일 때 숫자로 변환
FROM DUAL;

SELECT TO_CHAR(1000, '9,999,999,999'), TO_CHAR(10000, '9,999,999,999'), TO_CHAR(1000, '0,000,000')
FROM DUAL;

SELECT TO_CHAR(123.456, '999.99'), TO_CHAR(123.46, '000.00'), TO_CHAR(123.4, '999.99'), TO_CHAR(123.4, '000.00')
FROM DUAL;

-- 날짜 -> 포맷팅된 문자열
-- 패턴문자: yyyy 혹은 yyyy
-- 패턴문자: MM 혹은 mm
-- DD / dd
-- AM / am
-- HH / hh
-- MI / mi
-- SS / ss
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), TO_CHAR(SYSDATE, 'HH24:MI:SS'), TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM DUAL;

SELECT SYSDATE - TO_DATE('2021/10/01')
FROM DUAL;

-- 2007년 상반기에 입사한 사원들의 목록을 조회
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < '2007/07/01';

SELECT *
FROM EMPLOYEES
-- 7월 1일 0시 0분보다 작은 걸 찾아야 하니까 30 + 1
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/06/30') + 1;

-- 2007년 1월 1일부터 3월 31일 사이에 입사한 사원
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/03/31') + 1;
--------------------------------------------------------------------------------
-- 다중행 함수
-- NULL인 값은 행에서 제외하고 계산한다
-- SUM(컬럼명)         : 해당 컬럼의 합계를 반환한다
-- AVG(컬럼명)         : 해당 컬럼의 평균값을 반환한다
-- MAX(컬럼명)         : 해당 컬럼의 최대값을 반환한다
-- MIN(컬럼명)         : 해당 컬럼의 최소값을 반환한다
-- COUNT(* 혹은 컬럼명) : 행의 개수를 반환한다 / *인 경우 해당 컬럼의 값이 NULL이어도 포함시킨다
--                      컬럼명을 적으면 해당 컬럼이 NULL이면 제외된다

-- 60번 부서에 소속된 직원들의 최대/최소 급여 조회
SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 전체 사원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES;

-- 커미션을 받는 사원의 수를 조회하기
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES; -- NULL이 아닌 값은 알아서 제외

SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL; -- NULL 값이 아닌 것을 먼저 찾고 카운팅함

-- 다중행 함수는 행 그룹당 출력이 한 행만 결과가 나오기 때문에 다중행 함수가 아닌 것과 같이 사용할 수 없다
-- 아래 코드는 에러
-- 
--SELECT FIRST_NAME, MAX(SALARY)
--FROM EMPLOYEES;

SELECT MAX(SALARY)
FROM EMPLOYEES;

-- 급여를 가장 많이 받은 사람의 이름과 급여를 조회하기
-- 서브쿼리(SUB QUERY) : SELECT문의 결과가 값이 되는 쿼리
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);
                
--------------------------------------------------------------------------------
-- EMPLOYEES 테이블에서 이름이 8글자인 직원들의 이름을 조회하기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 8;

-- EMPLOYEES 테이블에서 이름이 8글자 이상인 직원들의 이름과 글자수를 조회하기
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 8;

-- EMPLOYEES 테이블에서 직원의 이름을 전부 변환했을 때 세번째 글자가 E인 모든 직원의 이름을 조회하기
-- 몰라
SELECT FIRST_NAME, SUBSTR(UPPER(FIRST_NAME), 3, 1)
FROM EMPLOYEES
WHERE SUBSTR(UPPER(FIRST_NAME), 3, 1) = 'E';

-- EMPLOYEES 테이블에서 2007년도에 입사한 직원들의 직원아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

-- 아래의 방법을 더 권장함

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/12/31') + 1;

-- EMPLOYEES 테이블에서 2005년에 입사한 직원 중에서 커미션을 받는 직원의 아이디, 이름, 급여, 커미션을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
AND HIRE_DATE >= '2005.01.01' AND HIRE_DATE < TO_DATE('2005.12.31') + 1;

-- EMPLOYEES 테이블에서 오늘이 입사일인 직원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TRUNC(SYSDATE);

-- EMPLOYEES 테이블에서 10월달에 입사한 모든 사원들의 아이디, 이름, 입사일을 조회하기
-- 몰라
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM') = 10; 

-- EMPLOYEES 테이블에서 이번달에 입사한 모든 사원들의 아이디, 이름, 입사일 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/') || '01');

-- EMPLOYEES 테이블에서 급여를 5000이상 받는 직원들의 아이디, 이름, 급여, 급여 등급을 조회하기
-- 급여 등급: 20000이상 A, 15000이상 B, 10000이상 C, 그 외는 D 다.
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

-- EMPLOYEES 테이블에서 60번 부서에 소속된 사원들의 근무개월수를 오늘을 기준으로 계산해서 조회하기
SELECT FIRST_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 직원아이디, 이름, 입사일, 근무개월수가 조회되어야 하고, 근무개월수를 기준으로 오름차순 정렬한다.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS 개월수
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY 개월수 ASC;

-- 사원의 이름과 급여를 표시하고, 급여에 대해서 #로 표시하기
-- '#'하나는 급여 1000에 해당한다.

-- 출력예시
-- 홍길동 4300 ####
-- 김유신 8700 ########
-- 강감찬 6500 ######
--                               출력할 문자, 출력할 문자의 개수, 채울 문자
SELECT FIRST_NAME, SALARY, LPAD('#', TRUNC(SALARY/1000), '#')
FROM EMPLOYEES;

-- EMPLOYEES 테이블에서 2006년 상반기에 입사한 직원들의 직원아이디, 이름, 입사일, 연봉을 계산하기
-- 연봉은 급여*12 + 급여*커미션*12다.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12 ANUAL_SALARY
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01' AND HIRE_DATE < TO_DATE('2006/06/30') + 1;

-- EMPLOYEES 테이블에서 100번 상사에게 보고하는 직원중에서 커미션을 받은 직원들의 직원아이디, 이름, 급여, 커미션을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
AND MANAGER_ID = 100;

-- EMPLOYEES 테이블에서 80번부서에 소속된 직원들의 평균급여, 최소급여, 최대급여를 조회하기
SELECT ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- EMPLOYEES 테이블에서 100번 상사에게 보고하는 직원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID = 100;