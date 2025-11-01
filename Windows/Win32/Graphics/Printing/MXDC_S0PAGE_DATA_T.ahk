#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcs0pagedata
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_S0PAGE_DATA_T extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
