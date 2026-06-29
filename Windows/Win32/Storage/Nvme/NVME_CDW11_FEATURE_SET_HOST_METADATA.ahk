#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_SET_HOST_METADATA {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - EA
     * - Reserved1
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 0) | (this._bitfield & ~(0x1FFF << 0))
    }

    /**
     * @type {Integer}
     */
    EA {
        get => (this._bitfield >> 13) & 0x3
        set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 15) & 0x1FFFF
        set => this._bitfield := ((value & 0x1FFFF) << 15) | (this._bitfield & ~(0x1FFFF << 15))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
