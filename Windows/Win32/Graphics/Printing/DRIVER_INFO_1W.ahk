#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRIVER\_INFO\_1 structure identifies a printer driver.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DRIVER_INFO_1W extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of a printer driver.
     * @type {Pointer<Char>}
     */
    pName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
