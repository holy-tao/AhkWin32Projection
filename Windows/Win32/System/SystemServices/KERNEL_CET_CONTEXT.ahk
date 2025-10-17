#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class KERNEL_CET_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Ssp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Rip {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SegCs {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    AllFlags {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * This bitfield backs the following members:
     * - UseWrss
     * - PopShadowStackOne
     * - Unused
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    UseWrss {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PopShadowStackOne {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Unused {
        get => (this._bitfield >> 2) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 2) | (this._bitfield & ~(0x3FFF << 2))
    }

    /**
     * @type {Array<UInt16>}
     */
    Fill{
        get {
            if(!this.HasProp("__FillProxyArray"))
                this.__FillProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "ushort")
            return this.__FillProxyArray
        }
    }
}
