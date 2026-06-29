#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_IMPORT_CONTROL_TRANSFER_ARM64_RELOCATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PageRelativeOffset
     * - IndirectCall
     * - RegisterIndex
     * - ImportType
     * - IATIndex
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PageRelativeOffset {
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * @type {Integer}
     */
    IndirectCall {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    RegisterIndex {
        get => (this._bitfield >> 11) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
    }

    /**
     * @type {Integer}
     */
    ImportType {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    IATIndex {
        get => (this._bitfield >> 17) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 17) | (this._bitfield & ~(0x7FFF << 17))
    }
}
