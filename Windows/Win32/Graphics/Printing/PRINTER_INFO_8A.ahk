#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_INFO\_8 structure specifies the global default printer settings.
 * @remarks
 * The global defaults are set by the administrator of a printer that can be used by anyone. In contrast, the per-user defaults will affect a particular user or anyone else who uses the profile. For per-user defaults, use [**PRINTER\_INFO\_9**](printer-info-9.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-8
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PRINTER_INFO_8A extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that defines the global default printer data such as the paper orientation and the resolution.
     * @type {Pointer<DEVMODEA>}
     */
    pDevMode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
