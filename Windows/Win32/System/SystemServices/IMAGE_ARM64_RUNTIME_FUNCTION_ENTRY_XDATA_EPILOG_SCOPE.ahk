#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY_XDATA_EPILOG_SCOPE {
    #StructPack 4

    EpilogScopeData : UInt32


    /**
     * @type {Integer}
     */
    EpilogStartOffset {
        get => (this._bitfield >> 0) & 0x3FFFF
        set => this._bitfield := ((value & 0x3FFFF) << 0) | (this._bitfield & ~(0x3FFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Res0 {
        get => (this._bitfield >> 18) & 0xF
        set => this._bitfield := ((value & 0xF) << 18) | (this._bitfield & ~(0xF << 18))
    }

    /**
     * @type {Integer}
     */
    EpilogStartIndex {
        get => (this._bitfield >> 22) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 22) | (this._bitfield & ~(0x3FF << 22))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
