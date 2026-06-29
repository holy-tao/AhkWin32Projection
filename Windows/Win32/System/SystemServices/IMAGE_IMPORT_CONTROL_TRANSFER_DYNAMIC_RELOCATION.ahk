#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_IMPORT_CONTROL_TRANSFER_DYNAMIC_RELOCATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PageRelativeOffset
     * - IndirectCall
     * - IATIndex
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PageRelativeOffset {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    IndirectCall {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    IATIndex {
        get => (this._bitfield >> 13) & 0x7FFFF
        set => this._bitfield := ((value & 0x7FFFF) << 13) | (this._bitfield & ~(0x7FFFF << 13))
    }
}
