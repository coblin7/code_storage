/* AUTHOR    : coblin1024	*/
/* HISTORY   : MSSQL 2016버전부터는 SPLIT_STRING 함수를 제공하지만 내가 사용하는 2014버전에는 함수가 없어 직접 생성 */
/* PARAMETER : STRING(문자열), SEPARATOR(구분할문자) */
/* RETURNS   : TABLE */

CREATE FUNCTION UF_SPLIT_STRING
(
   @STRING VARCHAR(MAX)
  ,@STRING SEPARATOR VARCHAR(1)
)
RETURNS @T_SPLIT_STRING TABLE
(
  STRING VARCHAR(MAX)
)

AS

BEGIN
  ----------------------------------------------------------------------------------------------------
  -- 변수 생성 및 설정
  ----------------------------------------------------------------------------------------------------
	DECLARE @RESULT VARCHAR(MAX)						-- 처리 문자열
	DECLARE @STRING_LEN INT			  				-- 문자열 길이
	DECLARE @INDEX INT		        				-- 탐색 인덱스
	DECLARE @BREAK INT				    			-- 반복문 종료 인덱스
	
	SET @STRING_LEN = LEN(@STRING)
	SET @BREAK =  LEN(@STRING)
	
  ----------------------------------------------------------------------------------------------------
  -- 로직
  ----------------------------------------------------------------------------------------------------
	WHILE @BREAK > 0
	BEGIN
		SELECT	@INDEX = PATINDEX('%'+@SEPARATOR+'%', @STRING)        -- 패턴에 해당하는 인덱스 설정
		SELECT	@RESULT = SUBSTRING(@STRING, 0, @INDEX)               -- 문자열 처리
		INSERT INTO @T_SPLIT_STRING VALUES (@RESULT)                  -- 문자열 테이블 삽입
		SELECT	@STRING = SUBSTRING(@STRING, @INDEX+1, @STRING_LEN)   -- 문자열 재설정
		SELECT	@BREAK = LEN(@STRING)                                 -- 반복문 인덱스 설정
	END
	
	RETURN
END

