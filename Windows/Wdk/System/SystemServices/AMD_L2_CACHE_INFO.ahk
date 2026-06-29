#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct AMD_L2_CACHE_INFO {
    #StructPack 4

    Ulong : UInt32


    /**
     * @type {Integer}
     */
    LinesPerTag {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Associativity {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    static __New() {
        DefineProp(this.Prototype, 'LineSize', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Size', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
