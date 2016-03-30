#NoTrayIcon                                      ; disables the showing of a tray icon
#SingleInstance force                            ; determines whether a script is allowed to run again when it is already running - FORCE skips the dialog box and replaces the old instance automatically
#NoEnv                                           ; prevents empty variables from being looked up as potential environment variables
SetTitleMatchMode, 2                             ; a window's title can contain WinTitle anywhere inside it to be a match. 
SendMode Input                                   ; recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%                      ; ensures a consistent starting directory

template = "%A_WorkingDir%\Documents\Template\Template.tex"
editor = %A_WorkingDir%\Texmaker\texmaker.exe
editorName = Texmaker
viewer = %A_WorkingDir%\SumatraPDF\SumatraPDF.exe
viewerName = SumatraPDF
texlib = %A_WorkingDir%\MiKTeX\miktex\bin\miktex-taskbar-icon.exe
texlibName = MiKTeX
texlibProcess = miktex-taskbar-icon.tmp

IfNotExist, %editor%
  MsgBox, Can't find %editorName%.
IfNotExist, %viewer%
  MsgBox, Can't find %viewerName%.
IfNotExist, %texlib%
  MsgBox, Can't find %texlibName%.
Process, Exist, %texlibProcess%
if Errorlevel != 0
{
  return
}
else
{
  Run, "%texlib%",,,pidtexlib
}

if (A_PtrSize = 8)
  bitScript = 64
else
  bitScript = 32
if (A_Is64bitOS)
  bitOS = 64
else
  bitOS = 32

RunWait, %A_WorkingDir%\FontsPortable\FontsPortable.exe -add
Run, "%editor%" %template%,,Max,pideditor
WinWaitActive, ahk_pid %pideditor%
  Send, {LWin Down}{Left}{LWin Up}
Sleep, 100
Run, "%viewer%",,Max,pidviewer
WinWaitActive, ahk_pid %pidviewer%
  Send, {LWin Down}{Right}{LWin Up}

IfWinActive, ahk_pid %pideditor%
{
  ~F1::Gosub, activateEditor
}

WinWait, ahk_pid %pideditor%
WinWaitClose
Gosub, closeTexlib
Gosub, closeViewer
RunWait, %A_WorkingDir%\FontsPortable\FontsPortable.exe -remove
ExitApp

activateEditor:
  WinWaitActive, ahk_pid %pidviewer%
  WinActivate, ahk_pid %pideditor%
  return

closeViewer:
  IfWinExist, %viewerName% ahk_pid %pidviewer%
    WinClose
  return

closeTexlib:
  WM_CLOSE=0x10
  WM_QUIT=0x12
  DetectHiddenWindows, On
  Process, Exist, %texlibProcess%
  pid:=errorlevel
  IfWinExist, ahk_pid %pid%
  {
    WinClose
    ;PostMessage, WM_CLOSE
    ;PostMessage, WM_QUIT
  }
  else MsgBox, Can't find %texlibName%! Maybe you closed it already?
  return
