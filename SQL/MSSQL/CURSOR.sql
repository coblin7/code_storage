/*
커서란 :
행 단위 작업을 효율적으로 처리하기 위한 방식이다.
테이블에서 여러개의 행을 조회한 후 쿼리의 결과를 한 행씩 처리하는 방식이다.
*/

-- 커서에서 사용할 변수 선언
DECLARE @TEMP INT

-- 사용할 테이블 커서 연결
DECLARE [CUR] CURSOR FOR
SELECT   [NUM]
FROM    [TABLE]

-- 커서 오픈
OPEN CUR

-- 포인터 이동
-- 커서 테이블에서 이동한 행의 값을 @TEMP 변수에 삽입
FETCH NEXT FROM CUR INTO @TEMP

-- 반복문 및 로직
WHILE @@FETCH_STATUS = 0
BEGIN
    . . .
    -- 포인터 이동
    FETCH NEXT FROM CUR INTO @TEMP
END

-- 커서 닫기
CLOSE CUR
-- 메모리해제
DEALLOCATE CUR
