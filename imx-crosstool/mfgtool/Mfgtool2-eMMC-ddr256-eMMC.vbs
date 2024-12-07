Set wshShell = CreateObject("WScript.shell")
wshShell.run "mfgtool2.exe -c ""linux"" -l ""eMMC"" -s ""ddr=256"" -s ""board=emmc"" -s ""boot=""  "
Set wshShell = Nothing
