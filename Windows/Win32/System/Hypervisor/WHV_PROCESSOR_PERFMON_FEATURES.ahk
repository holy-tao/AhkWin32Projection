#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_PERFMON_FEATURES {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - PmuSupport
     * - LbrSupport
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    PmuSupport {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    LbrSupport {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
