#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_ADAPTER_INFORMATION_FLAGS {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - NumberOfMemoryGroups
     * - SupportsDemotion
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    NumberOfMemoryGroups {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    SupportsDemotion {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
