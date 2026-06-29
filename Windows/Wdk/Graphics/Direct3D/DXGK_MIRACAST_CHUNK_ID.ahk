#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_MIRACAST_CHUNK_ID {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - FrameNumber
     * - PartNumber
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    FrameNumber {
        get => (this._bitfield >> 0) & 0xFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PartNumber {
        get => (this._bitfield >> 40) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 40) | (this._bitfield & ~(0xFFFFFF << 40))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
