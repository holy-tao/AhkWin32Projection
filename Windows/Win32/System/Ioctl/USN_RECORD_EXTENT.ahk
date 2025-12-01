#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the offset and length for an update sequence number (USN) record extent.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_record_extent
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_RECORD_EXTENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset of the extent, in bytes.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The length of the extent, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
