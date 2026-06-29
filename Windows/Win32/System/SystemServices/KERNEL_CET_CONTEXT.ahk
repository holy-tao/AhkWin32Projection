#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct KERNEL_CET_CONTEXT {
    #StructPack 8

    Ssp : Int64

    Rip : Int64

    SegCs : UInt16

    AllFlags : UInt16


    /**
     * @type {Integer}
     */
    UseWrss {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PopShadowStackOne {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Unused {
        get => (this._bitfield >> 2) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 2) | (this._bitfield & ~(0x3FFF << 2))
    }
    Fill : UInt16[2]

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 18 })
        this.DeleteProp("__New")
    }
}
