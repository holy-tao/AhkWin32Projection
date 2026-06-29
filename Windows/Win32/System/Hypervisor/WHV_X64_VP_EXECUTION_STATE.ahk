#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_VP_EXECUTION_STATE {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - Cpl
     * - Cr0Pe
     * - Cr0Am
     * - EferLma
     * - DebugActive
     * - InterruptionPending
     * - Reserved0
     * - InterruptShadow
     * - Reserved1
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Cpl {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Cr0Pe {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Cr0Am {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    EferLma {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    DebugActive {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    InterruptionPending {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 7) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 7) | (this._bitfield & ~(0x1F << 7))
    }

    /**
     * @type {Integer}
     */
    InterruptShadow {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT16', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
