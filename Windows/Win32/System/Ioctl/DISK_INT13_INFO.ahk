#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains standard Int13 drive geometry parameters.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_int13_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_INT13_INFO {
    #StructPack 4

    /**
     * The letter that is related to the specified partition or hard disk.  For valid values, see the BIOS documentation.
     */
    DriveSelect : UInt16

    /**
     * The maximum number of cylinders per head. For valid values, see the BIOS documentation.
     */
    MaxCylinders : UInt32

    /**
     * The number of sectors per track. For valid values, see the BIOS documentation.
     */
    SectorsPerTrack : UInt16

    /**
     * The maximum number of heads for this hard disk.  For valid values, see the BIOS documentation.
     */
    MaxHeads : UInt16

    /**
     * The number of drives. For valid values, see the BIOS documentation.
     */
    NumberDrives : UInt16

}
