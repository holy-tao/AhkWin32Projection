#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class DWORD_BLOB extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    clSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    alData{
        get {
            if(!this.HasProp("__alDataProxyArray"))
                this.__alDataProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__alDataProxyArray
        }
    }
}
