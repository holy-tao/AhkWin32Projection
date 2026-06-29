#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_TPH_REQUESTER_CONTROL_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - StModeSelect
     * - Rsvd
     * - TphRequesterEnable
     * - Rsvd2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    StModeSelect {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    TphRequesterEnable {
        get => (this._bitfield >> 8) & 0x3
        set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 10) & 0x3FFFFF
        set => this._bitfield := ((value & 0x3FFFFF) << 10) | (this._bitfield & ~(0x3FFFFF << 10))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
