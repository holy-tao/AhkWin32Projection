#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct KAPC_STATE {
    #StructPack 8

    ApcListHead : IntPtr[2]

    Process : IntPtr

    InProgressFlags : Int8


    /**
     * @type {Integer}
     */
    KernelApcInProgress {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SpecialApcInProgress {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    KernelApcPending : BOOLEAN

    UserApcPendingAll : BOOLEAN


    /**
     * @type {Integer}
     */
    SpecialUserApcPending {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UserApcPending {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 24 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int8, offset: 26 })
        this.DeleteProp("__New")
    }
}
