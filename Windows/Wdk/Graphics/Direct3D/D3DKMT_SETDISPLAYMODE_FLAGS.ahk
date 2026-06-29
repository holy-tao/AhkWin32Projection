#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETDISPLAYMODE_FLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PreserveVidPn
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    PreserveVidPn {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }
    /**
     * This bitfield backs the following members:
     * - Reserved
     */
    _bitfield2 : Int32

}
