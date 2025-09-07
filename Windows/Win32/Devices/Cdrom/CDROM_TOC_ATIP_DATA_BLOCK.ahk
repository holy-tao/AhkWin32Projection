#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC_ATIP_DATA_BLOCK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved7 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    LeadInMsf{
        get {
            if(!this.HasProp("__LeadInMsfProxyArray"))
                this.__LeadInMsfProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__LeadInMsfProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved8 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Array<Byte>}
     */
    LeadOutMsf{
        get {
            if(!this.HasProp("__LeadOutMsfProxyArray"))
                this.__LeadOutMsfProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__LeadOutMsfProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved9 {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Array<Byte>}
     */
    A1Values{
        get {
            if(!this.HasProp("__A1ValuesProxyArray"))
                this.__A1ValuesProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__A1ValuesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved10 {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Array<Byte>}
     */
    A2Values{
        get {
            if(!this.HasProp("__A2ValuesProxyArray"))
                this.__A2ValuesProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__A2ValuesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved11 {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Array<Byte>}
     */
    A3Values{
        get {
            if(!this.HasProp("__A3ValuesProxyArray"))
                this.__A3ValuesProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__A3ValuesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved12 {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }
}
