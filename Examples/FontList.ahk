#Requires AutoHotkey v2.0

#Include ..\Windows\Win32\Graphics\Gdi\LOGFONTW.ahk
#Include ..\Windows\Win32\Graphics\Gdi\FONT_CHARSET.ahk

stdout := FileOpen("*", "w")

hDc := DllCall("GetDC", "ptr", 0)

searchFont := LOGFONTW()
searchFont.lfCharSet := FONT_CHARSET.ANSI_CHARSET
searchFont.lfFaceName := "Papyrus"

callback := CallbackCreate(EnumFontFamExProc, "Fast", 4)
DllCall("gdi32\EnumFontFamiliesExW", "ptr", hDc, "ptr", searchFont, "ptr", callback, "ptr", 0, "int", 0)

;https://learn.microsoft.com/en-us/previous-versions/dd162618(v=vs.85)
EnumFontFamExProc(lpelfe, lpntme, fontType, lparam){
    logfont := LOGFONTW(lpelfe)
    stdout.WriteLine(logfont.lfFaceName)

    return 1    ;Return non-zero value to continue enumeration
}