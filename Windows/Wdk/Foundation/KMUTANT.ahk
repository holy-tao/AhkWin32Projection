#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct KMUTANT {
    #StructPack 8

    Header : IntPtr

    MutantListEntry : IntPtr

    OwnerThread : IntPtr

    MutantFlags : Int8


    /**
     * @type {Integer}
     */
    Abandoned {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Spare1 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
    ApcDisable : Int8

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 24 })
        this.DeleteProp("__New")
    }
}
