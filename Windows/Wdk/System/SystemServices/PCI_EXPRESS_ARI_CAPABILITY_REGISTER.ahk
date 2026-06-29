#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ARI_CAPABILITY_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - MfvcFunctionGroupsCapability
     * - AcsFunctionGroupsCapability
     * - Reserved
     * - NextFunctionNumber
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    MfvcFunctionGroupsCapability {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AcsFunctionGroupsCapability {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    NextFunctionNumber {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }
}
