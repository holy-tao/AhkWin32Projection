#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct INTEL_CACHE_INFO_EBX {
    #StructPack 4

    Ulong : UInt32


    /**
     * @type {Integer}
     */
    LineSize {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Partitions {
        get => (this._bitfield >> 12) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 12) | (this._bitfield & ~(0x3FF << 12))
    }

    /**
     * @type {Integer}
     */
    Associativity {
        get => (this._bitfield >> 22) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 22) | (this._bitfield & ~(0x3FF << 22))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
