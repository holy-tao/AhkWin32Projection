#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC_FULL_TOC_DATA_BLOCK extends Win32Struct
{
    static sizeof => 11

    static packingSize => 1

    /**
     * @type {Integer}
     */
    SessionNumber {
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
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Point {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    MsfExtra{
        get {
            if(!this.HasProp("__MsfExtraProxyArray"))
                this.__MsfExtraProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__MsfExtraProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Zero {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Array<Byte>}
     */
    Msf{
        get {
            if(!this.HasProp("__MsfProxyArray"))
                this.__MsfProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__MsfProxyArray
        }
    }
}
