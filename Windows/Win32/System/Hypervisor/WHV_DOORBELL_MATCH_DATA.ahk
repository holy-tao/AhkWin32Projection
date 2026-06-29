#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_DOORBELL_MATCH_DATA {
    #StructPack 8

    GuestAddress : Int64

    Value : Int64

    Length : UInt32

    /**
     * This bitfield backs the following members:
     * - MatchOnValue
     * - MatchOnLength
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MatchOnValue {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MatchOnLength {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
}
