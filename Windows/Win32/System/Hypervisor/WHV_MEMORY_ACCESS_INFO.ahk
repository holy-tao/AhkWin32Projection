#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_MEMORY_ACCESS_INFO {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - AccessType
     * - GpaUnmapped
     * - GvaValid
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    AccessType {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    GpaUnmapped {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    GvaValid {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT32', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
