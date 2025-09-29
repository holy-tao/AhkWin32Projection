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
     * This bitfield backs the following members:
     * - CdrwReferenceSpeed
     * - Reserved3
     * - WritePower
     * - True1
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CdrwReferenceSpeed {
        get => (this._bitfield1 >> 0) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 0) | (this._bitfield1 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    WritePower {
        get => (this._bitfield1 >> 4) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 4) | (this._bitfield1 & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    True1 {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * This bitfield backs the following members:
     * - Reserved4
     * - UnrestrictedUse
     * - Reserved5
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => (this._bitfield2 >> 0) & 0x3F
        set => this._bitfield2 := ((value & 0x3F) << 0) | (this._bitfield2 & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    UnrestrictedUse {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }

    /**
     * This bitfield backs the following members:
     * - A3Valid
     * - A2Valid
     * - A1Valid
     * - DiscSubType
     * - IsCdrw
     * - True2
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    A3Valid {
        get => (this._bitfield3 >> 0) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 0) | (this._bitfield3 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    A2Valid {
        get => (this._bitfield3 >> 1) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 1) | (this._bitfield3 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    A1Valid {
        get => (this._bitfield3 >> 2) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 2) | (this._bitfield3 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    DiscSubType {
        get => (this._bitfield3 >> 3) & 0x7
        set => this._bitfield3 := ((value & 0x7) << 3) | (this._bitfield3 & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    IsCdrw {
        get => (this._bitfield3 >> 6) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 6) | (this._bitfield3 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    True2 {
        get => (this._bitfield3 >> 7) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 7) | (this._bitfield3 & ~(0x1 << 7))
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
                this.__LeadInMsfProxyArray := Win32FixedArray(this.ptr + 4, 3, Primitive, "char")
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
                this.__LeadOutMsfProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "char")
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
                this.__A1ValuesProxyArray := Win32FixedArray(this.ptr + 12, 3, Primitive, "char")
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
                this.__A2ValuesProxyArray := Win32FixedArray(this.ptr + 16, 3, Primitive, "char")
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
                this.__A3ValuesProxyArray := Win32FixedArray(this.ptr + 20, 3, Primitive, "char")
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
