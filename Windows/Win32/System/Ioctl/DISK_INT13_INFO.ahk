#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains standard Int13 drive geometry parameters.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_int13_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_INT13_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The letter that is related to the specified partition or hard disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    DriveSelect {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The maximum number of cylinders per head. For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    MaxCylinders {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of sectors per track. For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    SectorsPerTrack {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The maximum number of heads for this hard disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    MaxHeads {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The number of drives. For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    NumberDrives {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
