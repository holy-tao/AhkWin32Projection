#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_VALUE_LAYER_INFORMATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IsTombstone
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IsTombstone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
