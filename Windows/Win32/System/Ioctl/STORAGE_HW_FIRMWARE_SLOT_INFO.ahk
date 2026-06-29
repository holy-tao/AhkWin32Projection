#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure contains information about a slot on a device.
 * @see https://learn.microsoft.com/windows/win32/FileIO/storage-hw-firmware-slot-info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_FIRMWARE_SLOT_INFO {
    #StructPack 4

    /**
     * The version of this structure. This should be set to sizeof(STORAGE\_HW\_FIRMWARE\_SLOT\_INFO)
     */
    Version : UInt32

    /**
     * The size of this structure.
     */
    Size : UInt32

    /**
     * The slot number of this slot.
     */
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
    /**
     * Reserved for future use.
     */
    Reserved1 : Int8[6]

    /**
     * The revision of the firmware on this slot.
     */
    Revision : Int8[16]

}
