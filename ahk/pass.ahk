#NoTrayIcon
#SingleInstance force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
if 0 = 3
{
  Run, %A_WorkingDir%\..\Texmaker\texmaker.exe "%1%" "%2%" %3%
}
else
{
  MsgBox Sorry, I can only pass these 3 arguments to texmaker: "`%f" -line `%l
}
ExitApp
