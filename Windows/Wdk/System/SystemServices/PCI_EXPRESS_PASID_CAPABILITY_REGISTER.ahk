#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_PASID_CAPABILITY_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - Rsvd
     * - ExecutePermissionSupported
     * - PrivilegedModeSupported
     * - Rsvd2
     * - MaxPASIDWidth
     * - Rsvd3
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ExecutePermissionSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    PrivilegedModeSupported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    MaxPASIDWidth {
        get => (this._bitfield >> 8) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 8) | (this._bitfield & ~(0x1F << 8))
    }

    /**
     * @type {Integer}
     */
    Rsvd3 {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
