[virustotal]: http://www.virustotal.com/en/file/118c200de2c94cbb53bdd55242254ed2f177d0ca62a24a619f9f42803ab90877/analysis/1455246335/
[contact me]: mailto:info@symera.de?subject=TexPortable

[Screenshot (compile)]: ./screenshots/2017-01-25_compile.png
[Screenshot (inverse)]: ./screenshots/2017-01-25_inverse.png

# TexPortable

## What is it?

TexPortable is a convenient collection of free software in one portable package for typing LaTeX documents right from scratch. It is made for Windows operating systems. All components (MiKTeX, Texmaker and SumatraPDF) are portable versions, there is no need to install anything.

Compiling [Editor -> Viewer] | Inverse Search [Viewer -> Editor]
------------ | -------------
![Screenshot (compile)] | ![Screenshot (inverse)]
Pressing `F1` will highlight current text segment in viewer (after compiling) | Double-click will highlight specific text segment in editor

No need to bother or care about settings and configuration for DDE commands, inverse search or commandline arguments. TexPortable is already configured to support the features of the editor and the viewer. Just download the package file, extract it and start right away.

## Where can I get it?

Right [here](download.md). You need to extract the compressed self-extracting file in order to use it. Just open the file and select a folder. The extracted files will probably take about 700 MiB of space. Please have this in mind if you are going to use it on a USB flash-drive (which I cannot recommended btw, quite slow performance unfortunately). I recommend using it with a HDD or even better with SSD drives, because of a much faster performance while launching TexPortable and compiling LaTeX documents.

If you want to dig deeper or would like to know more details about the setup, [here you go](setup.md).

Feel free to [contact me] if you have any further questions, feedback, or maybe suggestions for improvements.

## Ingredients

What? | Which?
------------ | -------------
TeX distribution | [MiKTeX](https://miktex.org/)
LaTeX editor | [Texmaker](http://www.xm1math.net/texmaker/)
PDF viewer | [SumatraPDF](http://blog.kowalczyk.info/software/sumatrapdf/)
Launcher | [TexPortable](setup.md)
[Version History](download.md)

Template file for LaTeX: `Documents/Template/Template.tex` (edit this file to fit your purpose if needed)

## FAQ (frequently asked questions)


* What kind of drive should I use?  
  From best-case to worst-case: **RAM-Disk > Fast SSD > HDD > Slow SSD > USB flash drive**
* Why will TexPortable.exe be recognized as an infected file and what can I do about this?  
  The executable file `TexPortable.exe` is based on a script written and compiled with AutoHotkey. Some Antivirus applications don't trust AutoHotkey scripts in general. Here are two ways to make sure it's not harmful:  
  * the easiest way is to compare the hash value of the file and look it up on (or compare it to) sites like [virustotal]. You can calculate the hash (with [Multihasher](http://www.abelhadigital.com/multihasher) for example) or even [upload](https://www.virustotal.com/) the file yourself.
  * the "hard" way: I've published a [manual](setup.md) and further informations regarding the script. This way you can compile the source code by yourself. It's public and on the same page. You need [AutoHotkey](http://www.autohotkey.com/) to compile the source code.
* My system refuses to run texmaker.exe, how can I solve this?  
  If you are working with a 32bit system try replacing Texmaker\texmaker.exe with a previous version of texmaker.exe (<= 4.4.1) or stick with the old `2015-02-04 TexPortable` (not recommended though).

## Wishlist

* set up a gui for configuration (templates, backup, display-setup, etc.)
* check for "new" settings file, if paths or links are "wrong" provide msgbox for adjusting them
* overwrite and backup settings from Texmaker and SumatraPDF, when custom settings files are located in a backup folder
* ~~if template file exists, load as parameter, otherwise load last/recent document from texmaker~~
* ~~check issues with 32bit windows platforms~~
* ~~provide a section/page for faq~~
* ~~include custom fonts for editor~~
* ~~run commands should be based on PID not on ahk_class or (even worse) the title~~
* ~~split editor and viewer side by side~~
  * ~~check if it works as intended on Windows 10~~
    * works, but a little bit quiry, needs to escape or sleep right after first send command
  * what is more suitable? splitting windows with Win+Left/Right shortcuts or calculating width/height?
  * provide a parameter for dual monitor setup (TexPortable.exe -dual)

## Links

Looking for alternatives or in search of other LaTeX stuff?

Here you go:

* [TeX Live](www.tug.org/texlive/) is (similar to MiKTeX) another well-known TeX distribution, but on the plus side a cross-platform one.
* [TeXnicCenter](www.texniccenter.org/), another popular LaTeX Editor for Windows. No portable version though, but there may be a [inofficial workaround](www.latex-community.org/know-how/latex-editors/76-latex-editors-texniccenter/354-how-to-make-texniccenter-portable) to make it portable.

## Acknowledgements & Credits

* Donald E. Knuth & Leslie Lamport (for TeX & LaTeX, for creating and sharing one of the best typesetting systems)
* Christian Schenk (for MiKTeX, an easy way to get a TeX distribution)
* Pascal Brachet (for Texmaker, a highly customizable and portable editor)
* Krzysztof Kowalczyk (for SumatraPDF, the foobar2000 of PDF viewers)
* the AutoHotkey-Team (without it, Windows wouldn't stand a chance against Linux in terms of customization)
* and all the other contributors of great opensource software worldwide
