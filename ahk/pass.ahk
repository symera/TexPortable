#NoTrayIcon
#SingleInstance force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
if 0 = 3
  Run, %A_WorkingDir%\..\Texmaker\texmaker.exe "%1%" "%2%" %3%
else
  MsgBox I'm sorry, but my only purpose is to give exactly 3 arguments to texmaker.
ExitApp
