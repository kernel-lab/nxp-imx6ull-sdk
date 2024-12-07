Set wshShell = CreateObject("WScript.shell")
wshShell.run "mfgtool2.exe -c ""linux"" -l ""NAND Flash"" -s ""ddr=512"" -s ""board=nand"" -s ""boot=""  "
Set wshShell = Nothing
