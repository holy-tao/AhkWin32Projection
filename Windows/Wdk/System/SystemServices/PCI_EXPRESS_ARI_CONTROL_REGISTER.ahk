#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ARI_CONTROL_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - MfvcFunctionGroupsEnable
     * - AcsFunctionGroupsEnable
     * - Reserved1
     * - FunctionGroup
     * - Reserved2
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    MfvcFunctionGroupsEnable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AcsFunctionGroupsEnable {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    FunctionGroup {
        get => (this._bitfield >> 4) & 0x7
        set => this._bitfield := ((value & 0x7) << 4) | (this._bitfield & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 7) & 0x1FF
        set => this._bitfield := ((value & 0x1FF) << 7) | (this._bitfield & ~(0x1FF << 7))
    }
}
