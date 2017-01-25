[contact me]: mailto:info@symera.de?subject=TexPortable
# Explaining TexPortable

This page may be helpful for everyone who is interested in building his own portable package with the official sources or understanding the procedure of TexPortable. Or in order to get the latest versions of MiKTeX, Texmaker and SumatraPDF and bringing them together (- I guess I'm not able to update the package frequently, so this may be an option for you).

For a working LaTeX environment we need the following components:
* a TeX distribution (this is the typesetting system itself, the base if you will),
* an editor and
* a viewer.

We are going to use MiKTeX as the TeX distribution. It is actively developed, stable, easy to use and more importantly the developer provides a portable package. But with MiKTeX itself we can't type anything, because it "only" contains the packages/components for LaTeX. Now we need some kind of an editor, preferably Texmaker, because of the possibility to set relative paths and customize a lot of useful other settings (like inverse search and some external PDF viewer stuff). Texmaker has its own viewer. So actually, there is no need for another viewer explicitly. But SumatraPDF is a fast and flexible PDF viewer which I recommend to use with this setup to make it more convenient when looking and browsing through the compiled document.

## Folder-Structure

We prepare the folders for each component and extract the files from each package we downloaded:

* TexPortable (root folder)
  * MiKTeX
  * SumatraPDF
  * Texmaker

## Launcher

We have to place the launcher in our TexPortable root folder. In this case it's `TexPortable.exe` which is based on [`TexPortable.ahk`](ahk/TexPortable.ahk). It manages to start MiKTeX and Texmaker (if these are located in their respective folders) and do some other useful stuff.
The latest source code is available [here](ahk/TexPortable.ahk).
TexPortable is written and compiled with AutoHotkey.

## Upgrading MiKTeX/Texmaker/SumatraPDF

Upgrading the components can be done easily: If you want a new clean MiKTeX package, just delete the old one, and extract the new one into the same folder. But beware of losing your settings (mainly for Texmaker and SumatraPDF). You have to backup the corresponding files ("texmaker.ini" and "SumatraPDF-settings.txt" which are located in their respective subfolders) in order to keep and restore your settings.

Feel free to [contact me] if you have any questions, feedback, or maybe suggestions for improvements.
