#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC_CD_TEXT_DATA_BLOCK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PackType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    Text{
        get {
            if(!this.HasProp("__TextProxyArray"))
                this.__TextProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__TextProxyArray
        }
    }

    /**
     * @type {String}
     */
    WText {
        get => StrGet(this.ptr + 8, 5, "UTF-16")
        set => StrPut(value, this.ptr + 8, 5, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    CRC{
        get {
            if(!this.HasProp("__CRCProxyArray"))
                this.__CRCProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__CRCProxyArray
        }
    }
}
