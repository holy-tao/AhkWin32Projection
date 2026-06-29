#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER {
    #StructPack 2

    CapabilityID : UInt16

    /**
     * This bitfield backs the following members:
     * - Version
     * - Next
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Version {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Next {
        get => (this._bitfield >> 4) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 4) | (this._bitfield & ~(0xFFF << 4))
    }
}
