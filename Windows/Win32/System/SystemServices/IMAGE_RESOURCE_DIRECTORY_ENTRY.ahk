#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_RESOURCE_DIRECTORY_ENTRY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NameOffset
     * - NameIsString
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NameOffset {
        get => (this._bitfield >> 0) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 0) | (this._bitfield & ~(0x7FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    NameIsString {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
    OffsetToData : UInt32


    /**
     * @type {Integer}
     */
    OffsetToDirectory {
        get => (this._bitfield1 >> 0) & 0x7FFFFFFF
        set => this._bitfield1 := ((value & 0x7FFFFFFF) << 0) | (this._bitfield1 & ~(0x7FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    DataIsDirectory {
        get => (this._bitfield1 >> 31) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 31) | (this._bitfield1 & ~(0x1 << 31))
    }
    static __New() {
        DefineProp(this.Prototype, 'Name', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Id', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int32, offset: 4 })
        this.DeleteProp("__New")
    }
}
