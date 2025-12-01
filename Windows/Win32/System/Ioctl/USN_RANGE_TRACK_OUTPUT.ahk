#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains returned update sequence number (USN) from FSCTL_USN_TRACK_MODIFIED_RANGES control code.
 * @remarks
 * This structure is optional.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_range_track_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_RANGE_TRACK_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Returned update sequence number (USN) that identifies at what point in the USN Journal that range tracking was enabled.
     * @type {Integer}
     */
    Usn {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
