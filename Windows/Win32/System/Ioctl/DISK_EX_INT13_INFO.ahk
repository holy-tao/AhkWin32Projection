#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended Int13 drive parameters.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_ex_int13_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_EX_INT13_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the extended drive parameter buffer for this partition or disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExBufferSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The information flags for this partition or disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The number of cylinders per head.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExCylinders {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The maximum number of heads for this hard disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExHeads {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of sectors per track.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExSectorsPerTrack {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The total number of sectors for this disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExSectorsPerDrive {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The sector size for this disk.  For valid values, see the BIOS documentation.
     * @type {Integer}
     */
    ExSectorSize {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    ExReserved {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
