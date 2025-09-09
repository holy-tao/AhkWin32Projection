#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class CANDIDATEINFO extends Win32Struct
{
    static sizeof => 144

    static packingSize => 4

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
    dwCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwOffset{
        get {
            if(!this.HasProp("__dwOffsetProxyArray"))
                this.__dwOffsetProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "uint")
            return this.__dwOffsetProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwPrivateSize {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwPrivateOffset {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}
