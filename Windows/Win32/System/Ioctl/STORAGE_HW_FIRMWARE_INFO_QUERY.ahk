#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * STORAGE_HW_FIRMWARE_INFO_QUERY structure - This structure contains information about the device firmware.
 * @see https://learn.microsoft.com/windows/win32/FileIO/storage-hw-firmware-info-query
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_FIRMWARE_INFO_QUERY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The version of this structure. This should be set to sizeof(STORAGE\_HW\_FIRMWARE\_INFO\_QUERY)
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure as a buffer.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The flags associated with the query. The following are flags that can be set in this member.
     * 
     * 
     * 
     * | Flag                                             | Description                                                                        |
     * |--------------------------------------------------|------------------------------------------------------------------------------------|
     * | STORAGE\_HW\_FIRMWARE\_REQUEST\_FLAG\_CONTROLLER | Indicates that the target of the request other than the device hand/object itself. |
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
