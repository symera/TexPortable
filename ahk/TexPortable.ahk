#NoTrayIcon                                      ; disables the showing of a tray icon
#SingleInstance force                            ; determines whether a script is allowed to run again when it is already running - FORCE skips the dialog box and replaces the old instance automatically
#NoEnv                                           ; prevents empty variables from being looked up as potential environment variables
;#Persistent                                     ; keeps a script permanently running (that is, until the user closes it or ExitApp is encountered)
SetTitleMatchMode, 2                             ; a window's title can contain WinTitle anywhere inside it to be a match. 
SendMode Input                                   ; recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%                      ; ensures a consistent starting directory

template = "%A_WorkingDir%\Documents\Template\Template.tex"
editor = %A_WorkingDir%\Texmaker\texmaker.exe
editorName = Texmaker
viewer = %A_WorkingDir%\SumatraPDF\SumatraPDF.exe
viewerName = SumatraPDF
texlib = %A_WorkingDir%\MiKTeX\miktex\bin\miktex-taskbar-icon.exe
texlibProcess = miktex-taskbar-icon.tmp
texlibName = MiKTeX

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

Run, "%editor%" %template%,,Max,pideditor
WinWaitActive, Document ahk_pid %pideditor%
  Send, {LWin Down}{Left}{LWin Up}
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
