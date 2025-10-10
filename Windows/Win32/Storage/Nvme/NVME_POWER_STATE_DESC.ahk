#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_POWER_STATE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MP {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - MPS
     * - NOPS
     * - Reserved1
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    MPS {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NOPS {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield1 >> 2) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 2) | (this._bitfield1 & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    ENLAT {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    EXLAT {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - RRT
     * - Reserved2
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    RRT {
        get => (this._bitfield2 >> 0) & 0x1F
        set => this._bitfield2 := ((value & 0x1F) << 0) | (this._bitfield2 & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield2 >> 5) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 5) | (this._bitfield2 & ~(0x7 << 5))
    }

    /**
     * This bitfield backs the following members:
     * - RRL
     * - Reserved3
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    RRL {
        get => (this._bitfield3 >> 0) & 0x1F
        set => this._bitfield3 := ((value & 0x1F) << 0) | (this._bitfield3 & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield3 >> 5) & 0x7
        set => this._bitfield3 := ((value & 0x7) << 5) | (this._bitfield3 & ~(0x7 << 5))
    }

    /**
     * This bitfield backs the following members:
     * - RWT
     * - Reserved4
     * @type {Integer}
     */
    _bitfield4 {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    RWT {
        get => (this._bitfield4 >> 0) & 0x1F
        set => this._bitfield4 := ((value & 0x1F) << 0) | (this._bitfield4 & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => (this._bitfield4 >> 5) & 0x7
        set => this._bitfield4 := ((value & 0x7) << 5) | (this._bitfield4 & ~(0x7 << 5))
    }

    /**
     * This bitfield backs the following members:
     * - RWL
     * - Reserved5
     * @type {Integer}
     */
    _bitfield5 {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Integer}
     */
    RWL {
        get => (this._bitfield5 >> 0) & 0x1F
        set => this._bitfield5 := ((value & 0x1F) << 0) | (this._bitfield5 & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield5 >> 5) & 0x7
        set => this._bitfield5 := ((value & 0x7) << 5) | (this._bitfield5 & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    IDLP {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * This bitfield backs the following members:
     * - Reserved6
     * - IPS
     * @type {Integer}
     */
    _bitfield6 {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    Reserved6 {
        get => (this._bitfield6 >> 0) & 0x3F
        set => this._bitfield6 := ((value & 0x3F) << 0) | (this._bitfield6 & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    IPS {
        get => (this._bitfield6 >> 6) & 0x3
        set => this._bitfield6 := ((value & 0x3) << 6) | (this._bitfield6 & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved7 {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Integer}
     */
    ACTP {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * This bitfield backs the following members:
     * - APW
     * - Reserved8
     * - APS
     * @type {Integer}
     */
    _bitfield7 {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    APW {
        get => (this._bitfield7 >> 0) & 0x7
        set => this._bitfield7 := ((value & 0x7) << 0) | (this._bitfield7 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved8 {
        get => (this._bitfield7 >> 3) & 0x7
        set => this._bitfield7 := ((value & 0x7) << 3) | (this._bitfield7 & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    APS {
        get => (this._bitfield7 >> 6) & 0x3
        set => this._bitfield7 := ((value & 0x3) << 6) | (this._bitfield7 & ~(0x3 << 6))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved9{
        get {
            if(!this.HasProp("__Reserved9ProxyArray"))
                this.__Reserved9ProxyArray := Win32FixedArray(this.ptr + 23, 9, Primitive, "char")
            return this.__Reserved9ProxyArray
        }
    }
}
