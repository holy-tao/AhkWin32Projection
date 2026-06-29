#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PROCESS_CREATION_SVE_VECTOR_LENGTH {
    #StructPack 4

    Data : UInt32


    /**
     * @type {Integer}
     */
    VectorLength {
        get => (this._bitfield >> 0) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    FlagsReserved {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
