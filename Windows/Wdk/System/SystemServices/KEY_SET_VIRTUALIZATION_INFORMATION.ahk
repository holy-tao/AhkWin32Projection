#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_SET_VIRTUALIZATION_INFORMATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - VirtualTarget
     * - VirtualStore
     * - VirtualSource
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    VirtualTarget {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    VirtualStore {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    VirtualSource {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
}
