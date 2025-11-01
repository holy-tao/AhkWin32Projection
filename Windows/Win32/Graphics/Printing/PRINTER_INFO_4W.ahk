#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-4
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_INFO_4W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pPrinterName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pServerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
