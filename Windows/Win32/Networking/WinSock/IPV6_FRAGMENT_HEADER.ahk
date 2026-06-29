#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_FRAGMENT_HEADER {
    #StructPack 4

    NextHeader : Int8

    Reserved : Int8

    /**
     * This bitfield backs the following members:
     * - DontUse1
     * - MoreFragments
     * - ReservedBits
     * - DontUse2
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    DontUse1 {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    MoreFragments {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    ReservedBits {
        get => (this._bitfield >> 9) & 0x3
        set => this._bitfield := ((value & 0x3) << 9) | (this._bitfield & ~(0x3 << 9))
    }

    /**
     * @type {Integer}
     */
    DontUse2 {
        get => (this._bitfield >> 11) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
    }
    Id : UInt32

    static __New() {
        DefineProp(this.Prototype, 'OffsetAndFlags', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
