#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains disk, volume, or partition length information used by the IOCTL_DISK_GET_LENGTH_INFO control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-get_length_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GET_LENGTH_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The length of the disk, volume, or partition, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
