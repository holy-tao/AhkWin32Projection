#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMPORT_OBJECT_HEADER {
    #StructPack 4

    Sig1 : UInt16

    Sig2 : UInt16

    Version : UInt16

    Machine : UInt16

    TimeDateStamp : UInt32

    SizeOfData : UInt32

    Ordinal : UInt16

    /**
     * This bitfield backs the following members:
     * - Type
     * - NameType
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    NameType {
        get => (this._bitfield >> 2) & 0x7
        set => this._bitfield := ((value & 0x7) << 2) | (this._bitfield & ~(0x7 << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'Hint', { type: UInt16, offset: 16 })
        this.DeleteProp("__New")
    }
}
