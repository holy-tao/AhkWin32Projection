#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SYSTEM_POWER_STATE_CONTEXT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved1
     * - TargetSystemState
     * - EffectiveSystemState
     * - CurrentSystemState
     * - IgnoreHibernationPath
     * - PseudoTransition
     * - KernelSoftReboot
     * - DirectedDripsTransition
     * - Reserved2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    TargetSystemState {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    EffectiveSystemState {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * @type {Integer}
     */
    CurrentSystemState {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    IgnoreHibernationPath {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    PseudoTransition {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    KernelSoftReboot {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    DirectedDripsTransition {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'ContextAsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
