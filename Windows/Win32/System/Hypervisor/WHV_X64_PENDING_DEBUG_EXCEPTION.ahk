#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_PENDING_DEBUG_EXCEPTION {
    #StructPack 8

    AsUINT64 : Int64


    /**
     * @type {Integer}
     */
    Breakpoint0 {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Breakpoint1 {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Breakpoint2 {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Breakpoint3 {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    SingleStep {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 5) & 0x7FFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFFFFFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFFFFFFFFFF << 5))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
