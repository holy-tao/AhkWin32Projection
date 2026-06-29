#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_SECURITY_COMPLIANCE_BITMASK {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - FIPS
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    FIPS {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
