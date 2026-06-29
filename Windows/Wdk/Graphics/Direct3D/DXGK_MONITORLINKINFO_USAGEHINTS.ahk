#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_MONITORLINKINFO_USAGEHINTS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Hidden
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Hidden {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
