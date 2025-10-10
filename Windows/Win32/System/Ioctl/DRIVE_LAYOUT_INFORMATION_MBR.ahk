#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about a drive's master boot record (MBR) partitions.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-drive_layout_information_mbr
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DRIVE_LAYOUT_INFORMATION_MBR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The signature of the drive.
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
