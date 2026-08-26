#Requires AutoHotkey v2.1-alpha.30

#Import "..\Windows\Win32\Graphics\Gdi" {
    LOGFONTW,
    FONT_CHARSET,
    EnumFontFamiliesExW,
    GetDC,
    FONTENUMPROCW
}

stdout := FileOpen("*", "w")

deviceContext := GetDC(0)

searchFont := LOGFONTW()
searchFont.lfCharSet := FONT_CHARSET.ANSI_CHARSET
searchFont.lfFaceName := "Papyrus"

; FONTENUMPROCW handles type coercion and the callback lifecycle for us
callback := FONTENUMPROCW.From((lpelfe, *) {
    stdout.WriteLine(lpelfe.lfFaceName.ToString())

    return 1    ;Return non-zero value to continue enumeration
})

EnumFontFamiliesExW(deviceContext, searchFont, callback, 0, 0)
