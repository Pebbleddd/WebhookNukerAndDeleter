@echo off
:start
cls
title Webhooking
echo Made by _Pebble#0100
echo press 1 for webhook deleter
echo press 2 for webhook spammer
set /p hook=
if %hook%==1 (goto del) else (goto 2)
:2
if %hook%==2 (goto spam) else (goto start)
:del
cls
title Deleting webhook
echo please enter the webhook you would like to deleter
set /p deling=
echo checking if active
curl %deling%
echo ========================================================================================================================================
:isit
echo is it active y/n
set /p active=
if %active%==y (goto deleting) else (goto n)
:n
if %active%==n (goto start) else (goto isit)
:deleting
cls
curl -X DELETE %deling%
cls
echo checking if the webhook is deleted
timeout 2 /nobreak
curl %deling%
pause
goto start
:spam
cls
echo enter the username
set /p user=
echo messeage to send
set /p msg=
echo how many times would you like to say this
set /p times=
echo how many times per second would you like to say this 0 = nodelay
set /p per=
echo webhook url
SET /p WEBHOOK_URL=

for /L %%a in (1,1,%times%) do (
timeout %per%
curl -H "Content-Type: application/json" -d "{\"username\": \"%user%\", \"content\":\"%msg%\"}" %WEBHOOK_URL%
)   

cls
echo Done spamming deleting the webhook now
timeout 3 /nobreak
curl -X DELETE %WEBHOOK_URL%
cls
echo Done! press a key to go back to start
pause
goto start
