; TexPortable 1.6
; https://symera.de/texportable
;
; miktex-portable-2.9.6615.exe
; sha256 87e7ed8e5a953d050ebe77625c5361627aea7f8a9cfbcea0e279c02929672152
;
; SumatraPDF-3.1.2-64.zip
; sha256 3c07b3fe267251d32a17f67ed5070018d69c8436df33e6db3ce757889b734676
;
; texmakerwin64usb.zip (5.0.2)
; sha256 cdb45fde89e100beabdf42a7ce24c0cadaecba953cfa731350691d70d88b0a02

#NoTrayIcon                                      ; disables the showing of a tray icon
#SingleInstance force                            ; determines whether a script is allowed to run again when it is already running - FORCE skips the dialog box and replaces the old instance automatically
#NoEnv                                           ; prevents empty variables from being looked up as potential environment variables
SetTitleMatchMode, 2                             ; a window's title can contain WinTitle anywhere inside it to be a match
SendMode Input                                   ; recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%                      ; ensures a consistent starting directory

; reset paths and settings in the texmaker.ini
if 1 = reset
  Gosub, resetTmIni

; get monitor work area for splitting windows vertically
SysGet, workArea, MonitorWorkArea
winWidth := (workAreaRight-workAreaLeft)//2
winHeight := workAreaBottom-workAreaTop
; borderless window splitting (support for windows 10)
if % SubStr(A_OSVersion, 1, 2) = 10
{
  winBorder := 7
  winWidth2 := winWidth-winBorder
  winWidth += 2*winBorder
  winHeight += winBorder
}

; check support for 64-bit
if (!A_Is64bitOS)
{
  MsgBox Sorry, TexPortable only supports 64-bit platform since version 1.6 and is not compatible with a 32-bit version of Windows.
}

; set variables for path and names
template = %A_WorkingDir%\Documents\Template\Template.tex
editor = %A_WorkingDir%\Texmaker\texmaker.exe
editorName = Texmaker
editorProcess := RegExReplace(editor, "^.*\\(.+$)", "$1")
viewer = %A_WorkingDir%\SumatraPDF\SumatraPDF.exe
viewerName = SumatraPDF
viewerProcess := RegExReplace(viewer, "^.*\\(.+$)", "$1")
texlib = %A_WorkingDir%\MiKTeX\texmfs\install\miktex\bin\miktex-console.exe
texlibName = MiKTeX
texlibProcess := RegExReplace(texlib, "^.*\\(.+$)", "$1")
; upcoming support for TeXLive
;texlib = %A_WorkingDir%\TeXLive\tl-tray-menu.exe
;texlibName = TeXLive
;texlibProcess := RegExReplace(texlib, "^.*\\(.+$)", "$1")

; save fonts list
fontsDir = %A_ScriptDir%\fonts
fontsList := list_files(fontsDir)
;if fontsList = 
;  MsgBox, No fonts have been found in`n`n%fontsDir%

; check for components and show message in case components are missing
components = editor,viewer,texlib
Loop, parse, components, `,
{
  i = %A_LoopField%
  if !FileExist(%i%)
  {
    MsgBox % "Can't find " . %i%Name . "."
    ExitApp
  }
}

; in case texlib is already running
Gosub, closeTexlib

; check for texlib process and run only if necessary
Process, Exist, %texlibProcess%
if Errorlevel != 0
{
  ;Process, Close, %texlibProcess% ; only needed for TeX Live (tl-tray-menu.exe)
  ;Run, "%texlib%",,,pidtexlib ; only needed for TeX Live (tl-tray-menu.exe)
  return
}
else
{
  Run, "%texlib%",,hide,pidtexlib
}

; add custom fonts for the session from "Fonts"
RunWait, %A_ScriptDir%\fonts\bin\regfont.exe -a %fontsList%,%fontsDir%,Hide

; get last (most recent) document from editor settings
IniRead, lastDoc, %A_WorkingDir%\Texmaker\texmaker.ini, texmaker, Files\Last`%20Document
StringReplace, lastDoc, lastDoc, \\, \, All

; if template exists open editor (maximized) with template (Documents\Template\Template.tex)
; save pid for later, load last document if no template
if FileExist(template)
  Run, "%editor%" "%template%",,Max,pideditor
else Run, "%editor%" "%lastDoc%",,Max,pideditor
; wait for window to pop up and move it to the left half
; if last document does not exist, winwait for different title "Texmaker" instead of "Document"
if FileExist(lastDoc)
  WinWaitActive, Document ahk_exe %editorProcess% ahk_pid %pideditor%
else WinWaitActive, %editorName% ahk_exe %editorProcess% ahk_pid %pideditor%
if % SubStr(A_OSVersion, 1, 2) = 10
  WinMove, , , -7, 0, %winWidth%, %winHeight%
else 
  WinMove, , , 0, 0, %winWidth%, %winHeight%

; open viewer (maximized), save pid for later
Run, "%viewer%",,Max,pidviewer
; wait for window to pop up and move it to the right half
WinWaitActive, %viewerName% ahk_exe %viewerProcess% ahk_pid %pidviewer%
if % SubStr(A_OSVersion, 1, 2) = 10
  WinMove, , , %winWidth2%, 0, %winWidth%, %winHeight%
else 
  WinMove, , , %winWidth%, 0, %winWidth%, %winHeight%


; if viewer gets active after hitting f1 (= compiling) switch back to editor (to continue editing without switching back)
IfWinActive, ahk_pid %pideditor%
{
  ~F1::Gosub, activateEditor
}

; no need for texlib and viewer after editor gets closed
WinWait, ahk_pid %pideditor%
WinWaitClose
end = true
Gosub, closeTexlib
Gosub, closeViewer

; remove custom temporary registered fonts
RunWait, %A_ScriptDir%\fonts\bin\regfont.exe -r %fontsList%,%fontsDir%,Hide

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
    Process, Close, %texlibProcess%
    ;PostMessage, WM_CLOSE
    ;PostMessage, WM_QUIT
    if (!end)
      MsgBox %texlibName% is already running.
  }
  else return
  DetectHiddenWindows, Off
return

resetTmIni:
  tmIni = %A_WorkingDir%\Texmaker\texmaker.ini
  mtBin = ./MiKTeX/texmfs/install/miktex/bin

  ; GUI
  IniWrite, false,                                                                                  %tmIni%, texmaker, GUI\New`%20Version

  ; Font
  IniWrite, Source Code Pro,                                                                        %tmIni%, texmaker, Editor\Font`%20Family
  IniWrite, 9,                                                                                      %tmIni%, texmaker, Editor\Font`%20Size

  ; Show  
  IniWrite, false,                                                                                  %tmIni%, texmaker, Show\Structureview

  ; Tools
  IniWrite, "./SumatraPDF/SumatraPDF.exe -reuse-instance `%.pdf -forward-search #.tex @",           %tmIni%, texmaker, Tools\Pdf
  IniWrite, false,                                                                                  %tmIni%, texmaker, Tools\IntegratedPdfViewer

  IniWrite, "%mtBin%/latex -interaction=nonstopmode `%.tex",                                        %tmIni%, texmaker, Tools\Latex
  IniWrite, "%mtBin%/yap.exe `%.dvi",                                                               %tmIni%, texmaker, Tools\Dvi
  IniWrite, "%mtBin%/dvips -Pdownload35 -o `%.ps `%.dvi",                                           %tmIni%, texmaker, Tools\Dvips
  IniWrite, "%mtBin%/ps2pdf `%.ps",                                                                 %tmIni%, texmaker, Tools\Ps2pdf
  IniWrite, "%mtBin%/makeindex `%.idx",                                                             %tmIni%, texmaker, Tools\Makeindex
  IniWrite, "%mtBin%/bibtex `%",                                                                    %tmIni%, texmaker, Tools\Bibtex
  IniWrite, "%mtBin%/pdflatex -synctex=1 -interaction=nonstopmode `%.tex",                          %tmIni%, texmaker, Tools\Pdflatex
  IniWrite, "%mtBin%/xelatex -synctex=1 -interaction=nonstopmode `%.tex",                           %tmIni%, texmaker, Tools\Xelatex
  IniWrite, "%mtBin%/lualatex -interaction=nonstopmode `%.tex",                                     %tmIni%, texmaker, Tools\Lualatex
  IniWrite, "./SumatraPDF/SumatraPDF.exe -reuse-instance `%.pdf -forward-search #.tex @",           %tmIni%, texmaker, Tools\Pdf
  IniWrite, "%mtBin%/dvipdfm `%.dvi",                                                               %tmIni%, texmaker, Tools\Dvipdf
  IniWrite, "%mtBin%/mpost --interaction nonstopmode",                                              %tmIni%, texmaker, Tools\Metapost
  IniWrite, "latexmk -e \"$pdflatex=q/pdflatex -synctex=1 -interaction=nonstopmode/\" -pdf `%.tex", %tmIni%, texmaker, Tools\Latexmk

  ; Recent Files
  IniWrite, "",                                                                                     %tmIni%, texmaker, Files\Last`%20Document
  IniWrite, "",                                                                                     %tmIni%, texmaker, Files\Last`%20Template
  IniWrite, "",                                                                                     %tmIni%, texmaker, Files\Last`%20Script
  IniWrite, @Invalid(),                                                                             %tmIni%, texmaker, Files\Recent`%20Files`%20New

  ; Dictionary
  IniWrite, "./Texmaker/en_US.dic",                                                                 %tmIni%, texmaker, Spell\Dic
  
  MsgBox Reset completed.
  ExitApp
return
