#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ERROR_SOURCE_ID {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - CorrectableSourceIdFun
     * - CorrectableSourceIdDev
     * - CorrectableSourceIdBus
     */
    _bitfield1 : Int16


    /**
     * @type {Integer}
     */
    CorrectableSourceIdFun {
        get => (this._bitfield1 >> 0) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 0) | (this._bitfield1 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    CorrectableSourceIdDev {
        get => (this._bitfield1 >> 3) & 0x1F
        set => this._bitfield1 := ((value & 0x1F) << 3) | (this._bitfield1 & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    CorrectableSourceIdBus {
        get => (this._bitfield1 >> 8) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 8) | (this._bitfield1 & ~(0xFF << 8))
    }
    /**
     * This bitfield backs the following members:
     * - UncorrectableSourceIdFun
     * - UncorrectableSourceIdDev
     * - UncorrectableSourceIdBus
     */
    _bitfield2 : Int16


    /**
     * @type {Integer}
     */
    UncorrectableSourceIdFun {
        get => (this._bitfield2 >> 0) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 0) | (this._bitfield2 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    UncorrectableSourceIdDev {
        get => (this._bitfield2 >> 3) & 0x1F
        set => this._bitfield2 := ((value & 0x1F) << 3) | (this._bitfield2 & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    UncorrectableSourceIdBus {
        get => (this._bitfield2 >> 8) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 8) | (this._bitfield2 & ~(0xFF << 8))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
