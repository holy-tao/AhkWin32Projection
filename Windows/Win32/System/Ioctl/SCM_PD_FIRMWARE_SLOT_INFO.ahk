#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_FIRMWARE_SLOT_INFO {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    SlotNumber : Int8

    /**
     * This bitfield backs the following members:
     * - ReadOnly
     * - Reserved0
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ReadOnly {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
    Reserved1 : Int8[6]

    Revision : Int8[32]

}
