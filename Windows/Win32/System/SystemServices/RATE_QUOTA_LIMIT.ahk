#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RATE_QUOTA_LIMIT {
    #StructPack 4

    RateData : UInt32


    /**
     * @type {Integer}
     */
    RatePercent {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 7) & 0x1FFFFFF
        set => this._bitfield := ((value & 0x1FFFFFF) << 7) | (this._bitfield & ~(0x1FFFFFF << 7))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
