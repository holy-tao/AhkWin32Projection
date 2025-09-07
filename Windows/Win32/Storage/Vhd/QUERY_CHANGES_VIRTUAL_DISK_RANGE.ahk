#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies an area on a virtual hard disk (VHD) that has changed as tracked by resilient change tracking (RCT).
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-query_changes_virtual_disk_range
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class QUERY_CHANGES_VIRTUAL_DISK_RANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The distance from the start of the virtual disk to the beginning of  the area of the virtual disk that has changed, in bytes.
     * @type {Integer}
     */
    ByteOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the area of the virtual disk that has changed, in bytes.
     * @type {Integer}
     */
    ByteLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
