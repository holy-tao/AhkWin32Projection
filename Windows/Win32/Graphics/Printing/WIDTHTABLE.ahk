#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WIDTHRUN.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class WIDTHTABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwRunNum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<WIDTHRUN>}
     */
    WidthRun{
        get {
            if(!this.HasProp("__WidthRunProxyArray"))
                this.__WidthRunProxyArray := Win32FixedArray(this.ptr + 8, 8, WIDTHRUN, "")
            return this.__WidthRunProxyArray
        }
    }
}
