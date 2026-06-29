#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VP_EXCEPTION_INFO {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - ErrorCodeValid
     * - SoftwareException
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    ErrorCodeValid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SoftwareException {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT32', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
