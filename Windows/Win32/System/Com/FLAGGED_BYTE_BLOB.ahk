#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class FLAGGED_BYTE_BLOB extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    clSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    abData{
        get {
            if(!this.HasProp("__abDataProxyArray"))
                this.__abDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__abDataProxyArray
        }
    }
}
