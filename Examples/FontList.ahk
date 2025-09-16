#Requires AutoHotkey v2.0

#Include ..\Windows\Win32\Graphics\Gdi\LOGFONTW.ahk
#Include ..\Windows\Win32\Graphics\Gdi\FONT_CHARSET.ahk
#Include ..\Windows\Win32\Graphics\Gdi\Apis.ahk

stdout := FileOpen("*", "w")

hDc := Gdi.GetDC(0)     ;Equivalent to DllCall("GetDC", "ptr", 0)

searchFont := LOGFONTW()
searchFont.lfCharSet := FONT_CHARSET.ANSI_CHARSET
searchFont.lfFaceName := "Papyrus"

callback := CallbackCreate(EnumFontFamExProc, "Fast", 4)
Gdi.EnumFontFamiliesExW(hDc, searchFont, callback, 0, 0)
Gdi.ReleaseDC(0, hDC)

;https://learn.microsoft.com/en-us/previous-versions/dd162618(v=vs.85)
EnumFontFamExProc(lpelfe, lpntme, fontType, lparam){
    logfont := LOGFONTW(lpelfe)
    stdout.WriteLine(logfont.lfFaceName)

    return 1    ;Return non-zero value to continue enumeration
}