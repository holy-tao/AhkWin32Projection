#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class SUB_Q_HEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AudioStatus {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    DataLength{
        get {
            if(!this.HasProp("__DataLengthProxyArray"))
                this.__DataLengthProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__DataLengthProxyArray
        }
    }
}
