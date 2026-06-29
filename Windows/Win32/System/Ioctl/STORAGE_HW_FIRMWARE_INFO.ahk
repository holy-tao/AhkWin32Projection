#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_HW_FIRMWARE_SLOT_INFO.ahk" { STORAGE_HW_FIRMWARE_SLOT_INFO }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * STORAGE_HW_FIRMWARE_INFO structure - This structure contains information about the device firmware.
 * @see https://learn.microsoft.com/windows/win32/FileIO/storage-hw-firmware-info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_FIRMWARE_INFO {
    #StructPack 4

    /**
     * The version of this structure. This should be set to sizeof(STORAGE\_HW\_FIRMWARE\_INFO)
     */
    Version : UInt32

    /**
     * The size of this structure as a buffer including slot.
     */
    Size : UInt32

    /**
     * This bitfield backs the following members:
     * - SupportUpgrade
     * - Reserved0
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    SupportUpgrade {
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
     * The number of firmware slots on the device. This is the dimension of the Slot array.
     * 
     * > [!Note]  
     * > Some devices can store more than 1 firmware image, if they have more than 1 firmware slot.
     */
    SlotCount : Int8

    /**
     * The firmware slot containing the currently active/running firmware image.
     */
    ActiveSlot : Int8

    /**
     * The firmware slot that is pending activation.
     */
    PendingActivateSlot : Int8

    /**
     * Indicates that the firmware applies to both the device and controller/adapter, e.g. NVMe SSD.
     */
    FirmwareShared : BOOLEAN

    /**
     * Reserved for future use.
     */
    Reserved : Int8[3]

    /**
     * The alignment of the image payload, in number of bytes. The maximum is PAGE\_SIZE. The transfer size is a mutliple of this size. Some protocols require at least sector size. When this value is set to 0, this means that this value is invalid.
     */
    ImagePayloadAlignment : UInt32

    /**
     * The image payload maximum size, this is used for a single command.
     */
    ImagePayloadMaxSize : UInt32

    /**
     * Contains the slot information for each slot on the device, of type [**STORAGE\_HW\_FIRMWARE\_SLOT\_INFO**](storage-hw-firmware-slot-info.md).
     */
    Slot : STORAGE_HW_FIRMWARE_SLOT_INFO[1]

}
