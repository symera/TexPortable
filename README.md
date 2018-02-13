[virustotal]: https://virustotal.com/en/file/3d44408adcb047c2deb87cf3401b1af19c9ae4e82a481ebd6238f0e3bf04a9b1/analysis/1485379734/
[download]: https://drive.google.com/a/symera.de/uc?id=0B_Dtz2OFld1iR1pHX3ZpWTR4YVk&export=download
[contact me]: mailto:info@symera.de?subject=TexPortable

[logo]: img/logo.png
[img_t_compile]: img/2017-01-25_compile_t.png
[img_t_inverse]: img/2017-01-25_inverse_t.png
[img_compile]: img/2017-01-25_compile.png
[img_inverse]: img/2017-01-25_inverse.png

# TexPortable

TexPortable is a convenient collection of free software in one portable package for typing LaTeX documents right from scratch. It is made for Windows operating systems.

Compiling [Editor -> Viewer]: [![img_t_compile]][img_compile] | Inverse Search [Viewer -> Editor]: [![img_t_inverse]][img_inverse]
------------ | -------------
Pressing `F1` will highlight current text segment in viewer (after compiling) | Double-click in viewer will highlight specific text segment in editor

## Getting Started

[Download the latest version of TexPortable][download].
No prerequisites are required. There is no need to install anything, as all components (*MiKTeX*, *Texmaker* and *SumatraPDF*) are portable versions.

Furthermore, it is not necessary to bother or care about settings and configuration for DDE commands, inverse search or commandline arguments. TexPortable is already configured to support the features of the editor and the viewer. Just download the package file, extract it and start right away.

Components |Including 
---|---
TeX distribution |[MiKTeX](https://miktex.org/) 
LaTeX editor |[Texmaker](http://www.xm1math.net/texmaker/) 
PDF viewer |[SumatraPDF](http://blog.kowalczyk.info/software/sumatrapdf/) 
Launcher |[TexPortable](setup.md) 

Double-click on the compressed self-extracting file and select a folder in order to extract it. The extracted files will probably take about **850 MiB** of space. Please have this in mind if you are going to use it on a USB flash-drive (which is not recommended due to the slow performance). I recommend using it with HDDs (or even better SSDs), because of a much faster performance while launching TexPortable and compiling LaTeX documents.

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
SHA-256: 3D44408ADCB047C2DEB87CF3401B1AF19C9AE4E82A481EBD6238F0E3BF04A9B1
```
Antivirus scan report available at [virustotal][virustotal].

#### Self-Extracting Package

Hash sums of self-extracting package file `YYYY-MM-DD TexPortable.exe` (latest version):
```
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
  If you are working with a 32bit system try replacing `Texmaker\texmaker.exe` with a previous version of Texmaker (<= 4.4.1) or stick with the old `2015-02-04 TexPortable` (not recommended though).

## Authors

See the list of [contributors](https://github.com/symera/TexPortable/contributors) who participated in this project.

## License

This project is licensed under the GPLv3 License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements

* Donald E. Knuth & Leslie Lamport (TeX & LaTeX)
* Christian Schenk (MiKTeX)
* Pascal Brachet (Texmaker)
* Krzysztof Kowalczyk (SumatraPDF)
* AutoHotkey
