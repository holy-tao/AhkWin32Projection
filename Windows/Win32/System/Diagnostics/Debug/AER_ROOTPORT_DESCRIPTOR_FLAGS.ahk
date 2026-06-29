#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct AER_ROOTPORT_DESCRIPTOR_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - UncorrectableErrorMaskRW
     * - UncorrectableErrorSeverityRW
     * - CorrectableErrorMaskRW
     * - AdvancedCapsAndControlRW
     * - RootErrorCommandRW
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    UncorrectableErrorMaskRW {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UncorrectableErrorSeverityRW {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    CorrectableErrorMaskRW {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AdvancedCapsAndControlRW {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    RootErrorCommandRW {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
