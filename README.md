[virustotal]: https://virustotal.com/en/file/3d44408adcb047c2deb87cf3401b1af19c9ae4e82a481ebd6238f0e3bf04a9b1/analysis/1485379734/
[download]: https://drive.google.com/a/symera.de/uc?id=0B_Dtz2OFld1iR1pHX3ZpWTR4YVk&export=download
[contact me]: mailto:info@symera.de?subject=TexPortable

[logo]: img/logo.png
[img_t_compile]: img/2017-01-25_compile_t.png
[img_t_inverse]: img/2017-01-25_inverse_t.png
[img_compile]: img/2017-01-25_compile.png
[img_inverse]: img/2017-01-25_inverse.png

# TexPortable

## What is it?
TexPortable is a convenient collection of free software in one portable package for typing LaTeX documents right from scratch. It is made for Windows operating systems. All components (*MiKTeX*, *Texmaker* and *SumatraPDF*) are portable versions, there is no need to install anything.

Compiling [Editor -> Viewer]: [![img_t_compile]][img_compile] | Inverse Search [Viewer -> Editor]: [![img_t_inverse]][img_inverse]
------------ | -------------
Pressing `F1` will highlight current text segment in viewer (after compiling) | Double-click will highlight specific text segment in editor

No need to bother or care about settings and configuration for DDE commands, inverse search or commandline arguments. TexPortable is already configured to support the features of the editor and the viewer. Just download the package file, extract it and start right away.

### Ingredients
What? | Which?
------------ | -------------
TeX distribution | [MiKTeX](https://miktex.org/)
LaTeX editor | [Texmaker](http://www.xm1math.net/texmaker/)
PDF viewer | [SumatraPDF](http://blog.kowalczyk.info/software/sumatrapdf/)
Launcher | [TexPortable](setup.md)

## Where can I get it?
[Download the latest version of TexPortable][download].

Double-click on the compressed self-extracting file and select a folder in order to extract it. The extracted files will probably take about **850 MiB** of space. Please have this in mind if you are going to use it on a USB flash-drive (which I cannot recommended btw, quite slow performance unfortunately). I recommend using it with a HDD or even better with SSD drives, because of a much faster performance while launching TexPortable and compiling LaTeX documents.

If you want to dig deeper or would like to know more details about the setup: [here you go](setup.md).

Feel free to [contact me] if you have any further questions, feedback, or maybe suggestions for improvements.

### Version History
Release    | MiKTeX   | Texmaker | SumatraPDF | TexPortable
---        | ---      | ---   | ---     | ---
**2017-01-25** | **2.9.6221** |	**4.5** 	| **3.1.2** 	| **1.5**
2016-03-28 | 2.9.5857 |	4.5 	| 3.1.1 	| 1.4
2016-02-12 | 2.9.5857 |	4.5 	| 3.1.1 	| 1.3
2015-02-04 | 2.9.5105 |	4.4.1 | 3.0     | 1.2
2014-08-17 | 2.9.5105 |	4.3 	| 2.5.2 	| 1.2
2014-05-20 | 2.9.5105 |	4.2 	| 2.5.2 	| 1.1
2014-01-30 | 2.9.5105 |	4.1.1 | 2.4 	  | 1.0

You can browse the [archive](https://drive.google.com/folderview?id=0B_Dtz2OFld1iemw2VmhwYUIweUE&usp=sharing#list) if you are looking for a previous release.

### Integrity

#### Launcher
Hash sums of launcher file `TexPortable.exe` (latest version):
```
MD5: 00451E4FD5DBCF991CCAE01459591B1D
RIPEMD-160: CFE0F2A8B95C5E7E26EF3366FF162D3C269E1125
SHA-1: 2E7CC2FDB9D86482CBB0CBC717DB496906FDE88C
SHA-256: 3D44408ADCB047C2DEB87CF3401B1AF19C9AE4E82A481EBD6238F0E3BF04A9B1
```
Antivirus scan report available at [virustotal][virustotal].

#### Self-Extracting Package
Hash sums of self-extracting package file `YYYY-MM-DD TexPortable.exe` (latest version):
```
MD5: 7F57E492F89F36EAC56CDC8CA82B9598
RIPEMD-160: 092F459D72A792DD7D5B44929179F8713B4F6706
SHA-1: 495DD28A9237B88E4919DE04E986B139E57F9194
SHA-256: 1F9AC4C333FE76B3CE8EEBF117D9888CDB4A417915CDDA882D68D1114FBC8CE7
```

## FAQ (Frequently Asked Questions)
* What kind of drive should I use?  
  From best-case to worst-case: **RAM-Disk > Fast SSD > HDD > Slow SSD > USB flash drive**
  
* Is it possible to edit the template or even better select my own project.tex to load right away?  
  I suggest you edit the template (`Documents/Template/Template.tex`) to fit your purpose if needed. In case you don't want any template to load at startup, just rename or delete the template-folder and TexPortable is always going to start Texmaker with the last (most recent) document.
  
* Why will TexPortable.exe be recognized as an infected file and what can I do about this?  
  The executable file `TexPortable.exe` is based on a script written and compiled with AutoHotkey. Some Antivirus applications don't trust AutoHotkey scripts in general. Here are two ways to make sure it's not harmful:  
  * the easiest way is to compare the hash value of the file and look it up on (or compare it to) sites like [virustotal]. You can calculate the hash (with [Multihasher](http://www.abelhadigital.com/multihasher) for example) or even [upload](https://www.virustotal.com/) the file yourself.
  * the "hard" way: I've published a [page](setup.md) with further explanations regarding the script. This way you can compile the source code by yourself. It's public and available [here](ahk/TexPortable.ahk). You need [AutoHotkey](http://www.autohotkey.com/) in order to compile the source code.
  
* My system refuses to run texmaker.exe, how can I solve this?  
  If you are working with a 32bit system try replacing `Texmaker\texmaker.exe` with a previous version of `texmaker` (<= 4.4.1) or stick with the old `2015-02-04 TexPortable` (not recommended though).

## Wishlist
- [x] if template file exists, load as parameter, otherwise load last/recent document from texmaker
- [x] check issues with 32bit windows platforms
- [x] provide a section/page for faq
- [x] include custom fonts for editor
- [x] run commands should be based on PID not on ahk_class or (even worse) the title
- [x] split editor and viewer side by side
  - check if it works as intended on Windows 10
    - works, but a little bit quiry, needs to escape or sleep right after first send command
  - what is more suitable? splitting windows with Win+Left/Right shortcuts or calculating width/height?
  - provide a parameter for dual monitor setup (TexPortable.exe -dual)
- [ ] ~~check for "new" settings file, if paths or links are "wrong" provide msgbox for adjusting them~~
- [ ] ~~overwrite and backup settings from Texmaker and SumatraPDF, when custom settings files are located in a backup folder~~
- [ ] making updates easy
  - check `InverseSearchCmdLine = pass.exe "%f" -line %l` in `SumatraPDF-settings.txt`
  - check paths for `Tools\...` in `texmaker.ini`
- [ ] set up a gui for configuration (templates, backup, display-setup, etc.)

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
