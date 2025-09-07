#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_INFO\_9 structure specifies the per-user default printer settings.
 * @remarks
 * The per-user defaults will affect only a particular user or anyone who uses the profile. In contrast, the global defaults are set by the administrator of a printer that can be used by anyone. For global defaults, use [**PRINTER\_INFO\_8**](printer-info-8.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-9
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_INFO_9W extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that defines the per-user default printer data such as the paper orientation and the resolution. The **DEVMODE** is stored in the user's registry.
     * @type {Pointer<DEVMODEW>}
     */
    pDevMode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
