#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure contains information about a slot on a device.
 * @see https://learn.microsoft.com/windows/win32/FileIO/storage-hw-firmware-slot-info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_FIRMWARE_SLOT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The version of this structure. This should be set to sizeof(STORAGE\_HW\_FIRMWARE\_SLOT\_INFO)
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The slot number of this slot.
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 10, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * The revision of the firmware on this slot.
     * @type {Array<Byte>}
     */
    Revision{
        get {
            if(!this.HasProp("__RevisionProxyArray"))
                this.__RevisionProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__RevisionProxyArray
        }
    }
}
