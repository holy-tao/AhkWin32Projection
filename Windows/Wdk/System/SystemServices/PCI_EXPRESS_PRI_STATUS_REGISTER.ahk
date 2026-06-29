#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_PRI_STATUS_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - ResponseFailure
     * - UnexpectedPageRequestGroupIndex
     * - Rsvd
     * - Stopped
     * - Rsvd2
     * - PrgResponsePasidRequired
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    ResponseFailure {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UnexpectedPageRequestGroupIndex {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    Stopped {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 9) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 9) | (this._bitfield & ~(0x3F << 9))
    }

    /**
     * @type {Integer}
     */
    PrgResponsePasidRequired {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
