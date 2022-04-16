@echo off
:start
cls
title Webhooking
echo Made by _Pebble#0100
echo press 1 for webhook deleter
echo press 2 for webhook spammer
echo press 3 for active check
set /p hook=
if %hook%==1 (goto del) else (goto 2)
:2
if %hook%==2 (goto spam) else (goto 3)
:3
if %hook%==3 (goto alive) else (goto start)
:alive
title Active?
cls
echo Enter webhook to check if its alive
set /p alive=
curl %alive%
timeout 2 /nobreak
echo if it says "Unknown webhook" this means the webhook has already been deleted and cannot be nuked
pause
goto start
:del
cls
title Deleting webhook
echo please enter the webhook you would like to delete
set /p deling=
:deleting
cls
curl -X DELETE %deling%
cls
echo checking if the webhook is deleted
timeout 5 /nobreak
cls
curl %deling%
timeout 0
echo "Unknown webhook" means it worked!!
pause
goto start
:spam
title nuking hook
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
