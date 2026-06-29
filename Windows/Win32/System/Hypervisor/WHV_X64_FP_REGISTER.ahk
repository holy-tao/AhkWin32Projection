#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_FP_REGISTER {
    #StructPack 8

    Mantissa : Int64

    /**
     * This bitfield backs the following members:
     * - BiasedExponent
     * - Sign
     * - Reserved
     */
    _bitfield : Int64


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
    static __New() {
        DefineProp(this.Prototype, 'AsUINT128', { type: WHV_UINT128, offset: 0 })
        this.DeleteProp("__New")
    }
}
