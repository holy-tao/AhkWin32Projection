#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class USERDATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    dwItemID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pKeyWordName{
        get {
            if(!this.HasProp("__pKeyWordName"))
                this.__pKeyWordName := PSTR(this.ptr + 16)
            return this.__pKeyWordName
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 24, 8, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }
}
