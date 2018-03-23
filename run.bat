::https://www.syneart.com
::v1.2 (20180323) by Syneart
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

SET is_folder=false
FOR %%i IN (%1) DO IF EXIST %%~si\* SET is_folder=true

SET FILE_MASK=*
SET FOLDER_PATH=%1

IF "%is_folder%" EQU "true" (
    ECHO PATH: %FOLDER_PATH%\%FILE_MASK%
) ELSE (
    SET FOLDER_PATH="%~dp1"
    SET FILE_MASK="%~n1%~x1"
    ECHO PATH: %FOLDER_PATH%
)

ECHO Calculate Files Count ...&ECHO.

SET file_cnt=-1
SET file_index=0
FOR /f %%i IN ('dir /s /b /a-d %1 ^| find /v /c "&#@"') DO (
    SET file_cnt=%%i
)

FOR /r %FOLDER_PATH% %%G IN (%FILE_MASK%) DO (
    SET file=%%G
    SET file=!file:^"=!
    SET fileName=%%~nG
    SET fileName=!fileName:^"=!
    SET fileExt=%%~xG
    SET fileExt=!fileExt:^"=!
    SET /a file_index +=1

    FOR /f %%i IN ('%~dp0imageFileTypeIdentify "!file!"') DO (
       ECHO ^(!file_index! of %file_cnt%^) [%%i] "!file!"
       IF /I NOT .%%i == !fileExt! (
           SET correctExt=.%%i
           FOR %%k IN (a b c d e f g h i j k l m n o p q r s t u v w x y z) DO SET correctExt=!correctExt:%%k=%%k!
           ECHO RENAME "!file!" -^> "!fileName!!correctExt!"
           RENAME "!file!" "!fileName!!correctExt!"
       )
    )
)

ECHO.&ECHO All Finish ~

PAUSE
