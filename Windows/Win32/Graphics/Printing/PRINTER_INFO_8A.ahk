#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }

/**
 * The PRINTER\_INFO\_8 structure specifies the global default printer settings.
 * @remarks
 * The global defaults are set by the administrator of a printer that can be used by anyone. In contrast, the per-user defaults will affect a particular user or anyone else who uses the profile. For per-user defaults, use [**PRINTER\_INFO\_9**](printer-info-9.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-8
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PRINTER_INFO_8A {
    #StructPack 8

    /**
     * A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that defines the global default printer data such as the paper orientation and the resolution.
     */
    pDevMode : DEVMODEA.Ptr

}
