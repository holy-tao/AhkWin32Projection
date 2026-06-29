#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VIRTUALADDRESSFLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - VirtualAddressSupported
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    VirtualAddressSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
