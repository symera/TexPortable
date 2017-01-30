#NoTrayIcon                                      ; disables the showing of a tray icon
#SingleInstance force                            ; determines whether a script is allowed to run again when it is already running - FORCE skips the dialog box and replaces the old instance automatically
#NoEnv                                           ; prevents empty variables from being looked up as potential environment variables
SetTitleMatchMode, 2                             ; a window's title can contain WinTitle anywhere inside it to be a match
SendMode Input                                   ; recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%                      ; ensures a consistent starting directory

; get monitor work area for splitting windows vertically
SysGet, workArea, MonitorWorkArea
winWidth := (workAreaRight-workAreaLeft)//2
winHeight := workAreaBottom-workAreaTop

; check "bit"ness
if (A_PtrSize = 8)
  bitScript = 64
else ;if (A_PtrSize = 4)
  bitScript = 32
if (A_Is64bitOS)
  bitOS = 64
else
  bitOS = 32

; set variables for path and names
template = %A_WorkingDir%\Documents\Template\Template.tex
editor = %A_WorkingDir%\Texmaker\texmaker.exe
editorName = Texmaker
editorProcess := RegExReplace(editor, "^.*\\(.+$)", "$1")
viewer = %A_WorkingDir%\SumatraPDF\SumatraPDF%bitOS%.exe
viewerName = SumatraPDF
viewerProcess := RegExReplace(viewer, "^.*\\(.+$)", "$1")
texlib = %A_WorkingDir%\MiKTeX\miktex\bin\miktex-taskbar-icon.exe
texlibName = MiKTeX
texlibProcess := RegExReplace(texlib, "^.*\\(.+)\.exe$", "$1.tmp")

; save fonts list
fontsDir = %A_ScriptDir%\fonts
fontsList := list_files(fontsDir)
;if fontsList = 
;  MsgBox, No fonts have been found in`n`n%fontsDir%

; check for components
IfNotExist, %editor%
  missing(editorName)
IfNotExist, %viewer%
  missing(viewerName)
IfNotExist, %texlib%
  missing(texlibName)

; check for texlib process and run only if necessary
Process, Exist, %texlibProcess%
if Errorlevel != 0
{
  return
}
else
{
  Run, "%texlib%",,,pidtexlib
}

; add custom fonts for the session from "Fonts"
RunWait, %A_ScriptDir%\fonts\bin\regfont%bitOS%.exe -a %fontsList%,%fontsDir%,Hide

; adjust path to viewer in editor settings
IniWrite, "./SumatraPDF/SumatraPDF%bitOS%.exe -reuse-instance `%.pdf -forward-search #.tex @", %A_WorkingDir%\Texmaker\texmaker.ini, texmaker, Tools\Pdf

; get last (most recent) document from editor settings
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
  WinWaitActive, Document ahk_exe %editorProcess% ahk_pid %pideditor%
else WinWaitActive, %editorName% ahk_exe %editorProcess% ahk_pid %pideditor%
  WinMove, , , 0, 0, %winWidth%, %winHeight%

; wait a little while before continuing (fix for Windows 10)
Sleep, 250

; open viewer (maximized), save pid for later
Run, "%viewer%",,Max,pidviewer
; wait for window to pop up and move it to the right half (only supported by >=win7)
WinWaitActive, %viewerName% ahk_exe %viewerProcess% ahk_pid %pidviewer%
  WinMove, , , %winWidth%, 0, %winWidth%, %winHeight%

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

; remove custom temporary registered fonts
RunWait, %A_ScriptDir%\fonts\bin\regfont%bitOS%.exe -r %fontsList%,%fontsDir%,Hide

; exit texportable launcher
ExitApp

; list_files function for registering fonts
list_files(Directory)
{
	files =
	Loop %Directory%\*.otf
	{
		files = %files% "%A_LoopFileName%"
	}
	Loop %Directory%\*.ttf
	{
		files = %files% "%A_LoopFileName%"
	}
	return files
}

; show message in case components are missing
missing(component)
{
  MsgBox % "Can't find " . component . "."
  ExitApp
}

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
