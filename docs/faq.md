# Frequently Asked Questions

* What kind of drive should I use?
  From best-case to worst-case:
  RAM-Disk > Fast SSD > HDD > Slow SSD > USB flash drive
* Why will TexPortable.exe be recognized as an infected file and what can I do about this?
  The executable file "TexPortable.exe" is based on a script written and compiled with AutoHotkey. Some Antivirus applications don't trust AutoHotkey scripts in general. Here are two ways to make sure it's not harmful:
  * the easiest way is to compare the hash value of the file and look it up on (or compare it to) a site like virustotal. You can calculate the hash (with Multihasher for example) or even upload the file yourself.
  * the "hard" way: I've published a manual and further informations regarding the script. This way you can compile the source code by yourself. It's public and on the same page. You need AutoHotkey to compile the source code.
* My system refuses to run texmaker.exe, how can I solve this?
  If you are working with a 32bit system try replacing Texmaker\texmaker.exe with a previous version of texmaker.exe (<= 4.4.1) or stick with the 2015-02-04 TexPortable.
