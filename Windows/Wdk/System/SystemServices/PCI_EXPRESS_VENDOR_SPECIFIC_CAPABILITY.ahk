#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_VENDOR_SPECIFIC_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    VsecId : UInt16

    /**
     * This bitfield backs the following members:
     * - VsecRev
     * - VsecLength
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    VsecRev {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    VsecLength {
        get => (this._bitfield >> 4) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 4) | (this._bitfield & ~(0xFFF << 4))
    }
}
