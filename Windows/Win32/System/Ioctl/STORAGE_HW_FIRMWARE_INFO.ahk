#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_HW_FIRMWARE_SLOT_INFO.ahk

/**
 * STORAGE_HW_FIRMWARE_INFO structure - This structure contains information about the device firmware.
 * @see https://learn.microsoft.com/windows/win32/FileIO/storage-hw-firmware-info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_FIRMWARE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The version of this structure. This should be set to sizeof(STORAGE\_HW\_FIRMWARE\_INFO)
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure as a buffer including slot.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * The number of firmware slots on the device. This is the dimension of the Slot array.
     * 
     * > [!Note]  
     * > Some devices can store more than 1 firmware image, if they have more than 1 firmware slot.
     * @type {Integer}
     */
    SlotCount {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * The firmware slot containing the currently active/running firmware image.
     * @type {Integer}
     */
    ActiveSlot {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * The firmware slot that is pending activation.
     * @type {Integer}
     */
    PendingActivateSlot {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Indicates that the firmware applies to both the device and controller/adapter, e.g. NVMe SSD.
     * @type {Integer}
     */
    FirmwareShared {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 13, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The alignment of the image payload, in number of bytes. The maximum is PAGE\_SIZE. The transfer size is a mutliple of this size. Some protocols require at least sector size. When this value is set to 0, this means that this value is invalid.
     * @type {Integer}
     */
    ImagePayloadAlignment {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The image payload maximum size, this is used for a single command.
     * @type {Integer}
     */
    ImagePayloadMaxSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the slot information for each slot on the device, of type [**STORAGE\_HW\_FIRMWARE\_SLOT\_INFO**](storage-hw-firmware-slot-info.md).
     * @type {Array<STORAGE_HW_FIRMWARE_SLOT_INFO>}
     */
    Slot{
        get {
            if(!this.HasProp("__SlotProxyArray"))
                this.__SlotProxyArray := Win32FixedArray(this.ptr + 24, 8, STORAGE_HW_FIRMWARE_SLOT_INFO, "")
            return this.__SlotProxyArray
        }
    }
}
