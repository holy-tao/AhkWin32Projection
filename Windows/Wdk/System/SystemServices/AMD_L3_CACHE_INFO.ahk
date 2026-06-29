#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct AMD_L3_CACHE_INFO {
    #StructPack 4

    Ulong : UInt32


    /**
     * @type {Integer}
     */
    LinesPerTag {
        get => (this._bitfield1 >> 0) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 0) | (this._bitfield1 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Associativity {
        get => (this._bitfield1 >> 4) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 4) | (this._bitfield1 & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    Size {
        get => (this._bitfield2 >> 2) & 0x3FFF
        set => this._bitfield2 := ((value & 0x3FFF) << 2) | (this._bitfield2 & ~(0x3FFF << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'LineSize', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, '_bitfield2', { type: Int16, offset: 2 })
        this.DeleteProp("__New")
    }
}
