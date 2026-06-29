#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_UUID_LIST_ENTRY {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - IdentifierAssociation
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    IdentifierAssociation {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }
    Reserved1 : Int8[15]

    UUID : Int8[16]

}
