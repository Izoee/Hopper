#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

ConfigPath := A_AppData "\Athenaware\Hopper\Hopper.config"
InstallPath := ReadIni(ConfigPath, "DIRECTORIES", "Installation")
Update(ConfigPath, InstallPath)
return

Update(ConfigPath, InstallPath) {
    local
    VersionCheckDLPath := A_AppData "\Athenaware\Hopper\VersionCheck"
    UrlDownloadToFile, % "https://raw.githubusercontent.com/Izoee/Hopper/main/ver", % VersionCheckDLPath
    NewVersionNo := ReadIni(VersionCheckDLPath, "VERSION", "VersionNo")
    FileDelete, % VersionCheckDLPath

    ; if(InStr(InstallPath, ".ahk") ~= 0){
        UrlDownloadToFile, % "https://raw.githubusercontent.com/Izoee/Hopper/main/Source/Hopper.ahk", % InstallPath
    ; } 
    /*
    else {
        UrlDownloadToFile, % "https://raw.githubusercontent.com/Izoee/Hopper/main/Bin/Hopper.exe", % InstallPath
    }
    */

    if(ErrorLevel = 0){
        MsgBox, 0, % "Success", % "Hopper was updated successfully."
        WriteIni(ConfigPath, "VERSION", "VersionNo", NewVersionNo)
        Run % InstallPath
        ExitApp
    } else {
        MsgBox, 0, % "Error", % "Hopper failed to Update."
    }
    return
}

ReadIni(Path, Section, Key) {
    local
    IniRead, IniVal, %Path%, %Section%, %Key%
    RetVal := IniVal
    return RetVal
}
WriteIni(Path, Section, Key, Val){
    local
    IniWrite, % Val, % Path, % Section, % Key
    return
}
