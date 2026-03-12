Set sh  = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)

If Right(scriptDir, 1) <> "\" Then
    scriptDir = scriptDir & "\"
End If

batPath = scriptDir & "AVIS_PRJ_SCAN.BAT"

' Force Windows-native execution
cmd = "cmd.exe /c """ & batPath & """"

sh.Run cmd, 1, False
