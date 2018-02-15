[virustotal]: https://www.virustotal.com/#/file/9680a9f32326be3d22af888201b839414e2b7492cba3320d5492db62bd7add02/detection
[download]: https://drive.google.com/uc?id=1rkoAigL-iAPOVdU62Yb8jFJLDuYwSJaL&export=download
[contact me]: mailto:info@symera.de?subject=TexPortable

[logo]: img/logo.png
[img_t_compile]: img/2017-01-25_compile_t.png
[img_t_inverse]: img/2017-01-25_inverse_t.png
[img_compile]: img/2017-01-25_compile.png
[img_inverse]: img/2017-01-25_inverse.png

# TexPortable

TexPortable is a convenient combination of free, portable Windows-based software that allows you to write LaTeX documents without having to worry about installation and setup.

Compiling [Editor &rarr; Viewer]: [![img_t_compile]][img_compile] | Inverse Search [Editor &larr; Viewer]: [![img_t_inverse]][img_inverse]
------------ | -------------
Pressing `F1` compiles the current text section and highlights it blue in the viewer | A double-click in the viewer highlights the current text section highlighted in red in the editor

Components |Including 
---|---
TeX distribution |[MiKTeX](https://miktex.org/) 
LaTeX editor |[Texmaker](http://www.xm1math.net/texmaker/) 
PDF viewer |[SumatraPDF](http://blog.kowalczyk.info/software/sumatrapdf/) 

## Getting Started

[Download the latest version of TexPortable][download].  
No prerequisites are required, suitable for 64-bit Windows systems.  
There is no need to install anything, as all components (*MiKTeX*, *Texmaker* and *SumatraPDF*) are portable versions.

It is not necessary to set up the configuration for DDE commands, inverse search or command line arguments.  
TexPortable is already designed to support the features of both editor and viewer.  
Just download the package, extract it and get started.

TexPortable takes up approximately 1GiB of memory.  
USB drives are not recommended due to the poor performance (and therefore very slow compilation time). HDDs (or better SSDs if possible) are recommended.

Click [here](setup.md) if you want to know more about the setup of TexPortable.

Feel free to [contact me] if you have any further questions, feedback or suggestions for improvements.

### Version History
Release Date | TexPortable | MiKTeX | Texmaker | SumatraPDF
---        | ---      | ---   | ---     | ---
**2018-02-14** | **1.6** | **2.9.6615** | **5.0.2** | **3.1.2**
2017-01-25 | 1.5 | 2.9.6221 | 4.5   | 3.1.2
2016-03-28 | 1.4 | 2.9.5857 | 4.5   | 3.1.1
2016-02-12 | 1.3 | 2.9.5857 | 4.5 	| 3.1.1
2015-02-04 | 1.2 | 2.9.5105 | 4.4.1 | 3.0
2014-08-17 | 1.1 | 2.9.5105 | 4.3   | 2.5.2
2014-05-20 | 1.1 | 2.9.5105 | 4.2   | 2.5.2
2014-01-30 | 1.0 | 2.9.5105 | 4.1.1 | 2.4

Click [here](https://drive.google.com/folderview?id=0B_Dtz2OFld1iemw2VmhwYUIweUE&usp=sharing#list) if you want to download a previous version of TexPortable.

### Integrity

#### Self-Extracting Package

Hash sums of self-extracting package file `2018-02-14 TexPortable.exe` (latest version):
```
SHA-256: dd4a99242d18f4671a61d5f3603866bc73588ac59d6c5e9b278fa6b9c45f38fd
```
#### Launcher

Hash sums of launcher file `TexPortable.exe` (latest version):
```
SHA-256: 9680a9f32326be3d22af888201b839414e2b7492cba3320d5492db62bd7add02
```
Antivirus scan report available at [virustotal][virustotal].

## FAQ (Frequently Asked Questions)

* Which drives are suitable for TexPortable (in terms of compilation speed)?  
  SSDs are the fastest and HDDs are slightly slower. For simple documents, compiling takes only a few seconds.  
  USB sticks, on the other hand, are very slow and can take over a minute (in unfavourable cases).

* Is it possible to edit the template or load my own *xyz.tex* when starting TexPortable?  
  The template (`Documents/Template/Template.tex`) can be adapted to your needs if required.  
  The template folder can be deleted or renamed if you want to open the last opened document when starting TexPortable.
  
* Why is `TexPortable.exe` detected as infected and what can I do about it?  
  The executable file `TexPortable.exe` is based on a script written with AutoHotkey. Some antivirus programs don't trust AutoHotkey scripts in general. There are two ways to ensure that the file is not harmful:  
  * the easy way is to compare the hash values. See [virustotal] for the analysis of the TexPortable Launcher.
  * the "difficult" way would be to compile the [source code](ahk/TexPortable.ahk) yourself using [AutoHotkey](http://www.autohotkey.com/).
  
* My system refuses to run texmaker.exe, how can I solve this?  
  If you are using a 32-bit Windows, you can replace Texmaker with a previous version (<= 4.4.1) or use the obsolete TexPortable 1.2 (2015-02-04) (which is not recommended).

## Authors

See the list of [contributors](https://github.com/symera/TexPortable/contributors) who participated in this project.

## License

This project is licensed under the GPLv3 License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgements

* Donald E. Knuth & Leslie Lamport (TeX & LaTeX)
* Christian Schenk (MiKTeX)
* Pascal Brachet (Texmaker)
* Krzysztof Kowalczyk (SumatraPDF)
* AutoHotkey
