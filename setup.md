[contact me]: mailto:info@symera.de?subject=TexPortable

# Explaining TexPortable

This page may be helpful for everyone who is interested in building his own portable package with the official sources or understanding the procedure of TexPortable. Or in order to get the latest versions of MiKTeX, Texmaker and SumatraPDF and bringing them together (- I guess I'm not able to update the package frequently, so this may be an option for you).

For a working LaTeX environment we need the following components:
* a TeX distribution (this is the typesetting system itself, the base if you will),
* an editor and
* a viewer.

We are going to use MiKTeX as the TeX distribution. It is actively developed, stable, easy to use and more importantly the developer provides a portable package. But with MiKTeX itself we can't type anything, because it *only* contains the packages/components for LaTeX. Now we need some kind of an editor, preferably Texmaker, because of the possibility to set relative paths and customize a lot of useful other settings (like inverse search and some external PDF viewer stuff). Texmaker has its own viewer. So actually, there is no need for another viewer explicitly. But SumatraPDF is a fast and flexible PDF viewer which I recommend to use with this setup in order to make it more convenient.

## Folder-Structure

We prepare the folders for each component and extract the files from each package we downloaded:

* TexPortable (root folder)
  * MiKTeX
    * ...
  * SumatraPDF
    * ...
    * [`pass.exe`](#inverse-search)
  * Texmaker
    * ...
  * [`TexPortable.exe`](#launcher)

## Launcher

We have to place the launcher in our TexPortable root folder. In this case it's `TexPortable.exe` which is based on [`TexPortable.ahk`](ahk/TexPortable.ahk). It manages to start MiKTeX and Texmaker (if these are located in their respective folders) and do some other useful stuff.

## Inverse Search

This is useful for looking up something in the viewer and editing that specific part in the editor. SumatraPDF supports inverse search commands by double-clicking on a text segment. Unfortunately there are issues with sending those commands into a different folder (where SumatraPDF is not located). We want to call `texmaker.exe` by going up one level and change directory to `Texmaker`. This can be done easily with [this small script](ahk/pass.ahk). Compiling that script will give us `pass.exe`  which we have to put into the SumatraPDF-subfolder. We only need to point the inverse search command settings in SumatraPDF to our `pass.exe` and this will take care about passing those commands to texmaker.

## Upgrading MiKTeX/Texmaker/SumatraPDF

Upgrading the components can be done easily: If you want a new clean MiKTeX package, just delete the old one, and extract the new one into the same folder. But beware of losing your settings (mainly for Texmaker and SumatraPDF). You have to backup the corresponding files (`texmaker.ini` and `SumatraPDF-settings.txt`, which are located in their respective subfolders) in order to keep and restore your settings.

Feel free to [contact me] if you have any questions, feedback, or maybe suggestions for improvements.
