#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PESILO.ahk" { PESILO }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_FOEXT_SILO_PARAMETERS {
    #StructPack 8

    Length : UInt32

    /**
     * This bitfield backs the following members:
     * - HasHardReference
     * - SpareFlags
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    HasHardReference {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SpareFlags {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    SiloContext : PESILO

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
