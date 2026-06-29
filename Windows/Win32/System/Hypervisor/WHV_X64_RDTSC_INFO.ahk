#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_RDTSC_INFO {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - IsRdtscp
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    IsRdtscp {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
