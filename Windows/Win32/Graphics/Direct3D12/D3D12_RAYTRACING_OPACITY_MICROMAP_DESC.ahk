#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_OPACITY_MICROMAP_DESC {
    #StructPack 4

    ByteOffset : UInt32

    /**
     * This bitfield backs the following members:
     * - SubdivisionLevel
     * - Format
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SubdivisionLevel {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Format {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
}
