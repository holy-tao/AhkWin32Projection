#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_STRUCTURE_LIST_ENTRY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Integer}
     */
    FormatCode {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    FormatLength{
        get {
            if(!this.HasProp("__FormatLengthProxyArray"))
                this.__FormatLengthProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__FormatLengthProxyArray
        }
    }
}
