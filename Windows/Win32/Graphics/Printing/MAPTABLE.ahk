#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSDATA.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MAPTABLE extends Win32Struct
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
    dwGlyphNum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<TRANSDATA>}
     */
    Trans{
        get {
            if(!this.HasProp("__TransProxyArray"))
                this.__TransProxyArray := Win32FixedArray(this.ptr + 8, 1, TRANSDATA, "")
            return this.__TransProxyArray
        }
    }
}
