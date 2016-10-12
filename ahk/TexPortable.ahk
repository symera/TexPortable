#NoTrayIcon                                      ; disables the showing of a tray icon
#SingleInstance force                            ; determines whether a script is allowed to run again when it is already running - FORCE skips the dialog box and replaces the old instance automatically
#NoEnv                                           ; prevents empty variables from being looked up as potential environment variables
SendMode Input                                   ; recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%                      ; ensures a consistent starting directory

; set variables for path and names
template = %A_WorkingDir%\Documents\Template\Template.tex
editor = %A_WorkingDir%\Texmaker\texmaker.exe
editorName = Texmaker
viewer = %A_WorkingDir%\SumatraPDF\SumatraPDF.exe
viewerName = SumatraPDF
texlib = %A_WorkingDir%\MiKTeX\miktex\bin\miktex-taskbar-icon.exe
texlibProcess = miktex-taskbar-icon.tmp
texlibName = MiKTeX

; check for components
IfNotExist, %editor%
  MsgBox, Can't find %editorName%.
IfNotExist, %viewer%
  MsgBox, Can't find %viewerName%.
IfNotExist, %texlib%
  MsgBox, Can't find %texlibName%.

; check for texlib and run only if it is not already running
Process, Exist, %texlibProcess%
if Errorlevel != 0
{
  return
}
else
{
  Run, "%texlib%",,,pidtexlib
}

; check whether script or os are running on x86 or x64 (not needed right now, but won't hurt anyway)
if (A_PtrSize = 8)
  bitScript = 64
else ;if (A_PtrSize = 4)
  bitScript = 32
if (A_Is64bitOS)
  bitOS = 64
else
  bitOS = 32

; add custom fonts from "FontsPortable\fonts" (temporary)
RunWait, %A_WorkingDir%\FontsPortable\FontsPortable.exe -add

IniRead, lastDoc, %A_WorkingDir%\Texmaker\texmaker.ini, texmaker, Files\Last`%20Document
StringReplace, lastDoc, lastDoc, \\, \, All

; if template exists open editor (maximized) with template (Documents\Template\Template.tex)
; save pid for later, load last document if no template
IfExist, %template%
  Run, "%editor%" "%template%",,Max,pideditor
else Run, "%editor%" "%lastDoc%",,Max,pideditor
; wait for window to pop up and move it to the left half (only supported by >=win7)
; if last document does not exist, winwait for different title "Texmaker" instead of "Document"
IfExist, %lastDoc%
  WinWaitActive, Document ahk_pid %pideditor%
else WinWaitActive, Texmaker ahk_pid %pideditor%
  Send, {LWin Down}{Left}{LWin Up}

; wait a little while before continuing (fix for Windows 10)
Sleep, 250

; open viewer (maximized), save pid for later
Run, "%viewer%",,Max,pidviewer
; wait for window to pop up and move it to the right half (only supported by >=win7)
WinWaitActive, %viewerName% ahk_pid %pidviewer%
  Send, {LWin Down}{Right}{LWin Up}

; if viewer gets active after hitting f1 (= compiling) switch back to editor (to continue editing without switching back)
IfWinActive, ahk_pid %pideditor%
{
  ~F1::Gosub, activateEditor
}

; no need for texlib and viewer after editor gets closed
WinWait, ahk_pid %pideditor%
WinWaitClose
Gosub, closeTexlib
Gosub, closeViewer

; remove custom and temporary registered fonts from "FontsPortable\fonts"
RunWait, %A_WorkingDir%\FontsPortable\FontsPortable.exe -remove

; exit texportable
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
