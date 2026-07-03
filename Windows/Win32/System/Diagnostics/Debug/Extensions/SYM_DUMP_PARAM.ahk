#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FIELD_INFO.ahk" { FIELD_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct SYM_DUMP_PARAM {
    #StructPack 8

    size : UInt32

    sName : IntPtr

    Options : UInt32

    addr : Int64

    listLink : FIELD_INFO.Ptr

    Context : IntPtr

    CallbackRoutine : IntPtr

    nFields : UInt32

    Fields : FIELD_INFO.Ptr

    ModBase : Int64

    TypeId : UInt32

    TypeSize : UInt32

    BufferSize : UInt32

    /**
     * This bitfield backs the following members:
     * - fPointer
     * - fArray
     * - fStruct
     * - fConstant
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
    static __New() {
        DefineProp(this.Prototype, 'pBuffer', { type: IntPtr, offset: 40 })
        this.DeleteProp("__New")
    }
}
