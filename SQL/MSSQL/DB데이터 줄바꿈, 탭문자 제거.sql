/*
issue : 데이터를 추출할 때 줄바꿈(엔터)이 있을 경우 데이터 이동 시(ex:엑셀) 줄바꾼채로 데이터가 이동되어 행이 밀리는 현상

데이터 추출 시 엔터, 탭 문자 제거 함수를 활용
Line feed : char(10)
tap : char(9)
carriage return : char(13)

replace([컬럼명], [변경할문자], [변경될문자])
엔터 : replace(repalce([컬럼명]), char(13), ''), char(10), '');
탭 : replace([컬럼명], char(9), '')
*/

SELECT  replace(replace(ISNULL(CQI.GEONUI_SAHANG, ''), char(13), ''), char(10), '')
FROM  [TABLE]
