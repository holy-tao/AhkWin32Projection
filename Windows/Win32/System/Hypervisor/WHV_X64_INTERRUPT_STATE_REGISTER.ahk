#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_INTERRUPT_STATE_REGISTER {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - InterruptShadow
     * - NmiMasked
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    InterruptShadow {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NmiMasked {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
