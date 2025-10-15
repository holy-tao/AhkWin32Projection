#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PRINTER_INFO_4A extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PSTR(this.ptr + 0)
            return this.__pPrinterName
        }
    }

    /**
     * @type {PSTR}
     */
    pServerName{
        get {
            if(!this.HasProp("__pServerName"))
                this.__pServerName := PSTR(this.ptr + 8)
            return this.__pServerName
        }
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
