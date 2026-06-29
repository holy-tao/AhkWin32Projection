#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains extended Int13 drive parameters.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_ex_int13_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_EX_INT13_INFO {
    #StructPack 8

    /**
     * The size of the extended drive parameter buffer for this partition or disk.  For valid values, see the BIOS documentation.
     */
    ExBufferSize : UInt16

    /**
     * The information flags for this partition or disk.  For valid values, see the BIOS documentation.
     */
    ExFlags : UInt16

    /**
     * The number of cylinders per head.  For valid values, see the BIOS documentation.
     */
    ExCylinders : UInt32

    /**
     * The maximum number of heads for this hard disk.  For valid values, see the BIOS documentation.
     */
    ExHeads : UInt32

    /**
     * The number of sectors per track.  For valid values, see the BIOS documentation.
     */
    ExSectorsPerTrack : UInt32

    /**
     * The total number of sectors for this disk.  For valid values, see the BIOS documentation.
     */
    ExSectorsPerDrive : Int64

    /**
     * The sector size for this disk.  For valid values, see the BIOS documentation.
     */
    ExSectorSize : UInt16

    /**
     * Reserved for future use.
     */
    ExReserved : UInt16

}
