#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to verify a disk extent.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-verify_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class VERIFY_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The starting offset of the disk extent.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The length of the disk extent, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
