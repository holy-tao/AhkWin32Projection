#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_STORAGE_RANGE_ATTRIBUTES {
    #StructPack 8

    LengthInBytes : Int64

    AllFlags : UInt32


    /**
     * @type {Integer}
     */
    IsRangeBad {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    Reserved : UInt32

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 8 })
        this.DeleteProp("__New")
    }
}
