#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_RECOVERY_ACTION {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - NoneAttempted
     * - TerminateProcess
     * - ForwardedToVm
     * - MarkPageBad
     * - PoisonNotPresent
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    NoneAttempted {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    TerminateProcess {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ForwardedToVm {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    MarkPageBad {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    PoisonNotPresent {
        get => (this._bitfield1 >> 4) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 4) | (this._bitfield1 & ~(0x1 << 4))
    }
    /**
     * This bitfield backs the following members:
     * - Reserved
     */
    _bitfield2 : Int32

    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
