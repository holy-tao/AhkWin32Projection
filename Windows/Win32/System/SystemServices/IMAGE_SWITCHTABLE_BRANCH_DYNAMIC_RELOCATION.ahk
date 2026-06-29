#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_SWITCHTABLE_BRANCH_DYNAMIC_RELOCATION {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - PageRelativeOffset
     * - RegisterNumber
     */
    _bitfield : Int16


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
    RegisterNumber {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }
}
