#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_FLIPINFOFLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - FlipInterval
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    FlipInterval {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
