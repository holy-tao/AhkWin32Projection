#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct WDD {
    #StructPack 8

    wDispPos : UInt16

    wReadPos : UInt16

    cchDisp : UInt16

    cchRead : UInt16

    WDD_nReserve1 : UInt32

    nPos : UInt16

    /**
     * This bitfield backs the following members:
     * - fPhrase
     * - fAutoCorrect
     * - fNumericPrefix
     * - fUserRegistered
     * - fUnknown
     * - fRecentUsed
     * - Anonymous3
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    fPhrase {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fAutoCorrect {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fNumericPrefix {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fUserRegistered {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fUnknown {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fRecentUsed {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    Anonymous3 {
        get => (this._bitfield >> 6) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 6) | (this._bitfield & ~(0x3FF << 6))
    }
    pReserved : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'wCompPos', { type: UInt16, offset: 2 })
        DefineProp(this.Prototype, 'cchComp', { type: UInt16, offset: 6 })
        this.DeleteProp("__New")
    }
}
