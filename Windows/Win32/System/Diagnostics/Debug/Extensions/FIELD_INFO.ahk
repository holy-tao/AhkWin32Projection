#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct FIELD_INFO {
    #StructPack 8


    struct _BitField {
        Position : UInt16

        Size : UInt16

    }

    fName : IntPtr

    printName : IntPtr

    size : UInt32

    fOptions : UInt32

    address : Int64

    fieldCallBack : IntPtr

    TypeId : UInt32

    FieldOffset : UInt32

    BufferSize : UInt32

    BitField : FIELD_INFO._BitField

    /**
     * This bitfield backs the following members:
     * - fPointer
     * - fArray
     * - fStruct
     * - fConstant
     * - fStatic
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    fPointer {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    fArray {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fStruct {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fConstant {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fStatic {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }
    static __New() {
        DefineProp(this.Prototype, 'pBuffer', { type: IntPtr, offset: 32 })
        this.DeleteProp("__New")
    }
}
