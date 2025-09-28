#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_FP_REGISTER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Mantissa {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - BiasedExponent
     * - Sign
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BiasedExponent {
        get => (this._bitfield >> 0) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 0) | (this._bitfield & ~(0x7FFF << 0))
    }

    /**
     * @type {Integer}
     */
    Sign {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 16) & 0xFFFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFFFF) << 16) | (this._bitfield & ~(0xFFFFFFFFFFFF << 16))
    }

    /**
     * @type {WHV_UINT128}
     */
    AsUINT128{
        get {
            if(!this.HasProp("__AsUINT128"))
                this.__AsUINT128 := WHV_UINT128(this.ptr + 0)
            return this.__AsUINT128
        }
    }
}
