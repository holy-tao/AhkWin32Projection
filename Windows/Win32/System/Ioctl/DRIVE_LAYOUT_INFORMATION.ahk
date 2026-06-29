#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PARTITION_INFORMATION.ahk" { PARTITION_INFORMATION }

/**
 * Contains information about the partitions of a drive.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DRIVE_LAYOUT_INFORMATION {
    #StructPack 8

    /**
     * The number of partitions on a drive.
     * 
     * On disks with the MBR layout, this value is always a multiple of 4. Any partitions that are unused have a partition type of **PARTITION_ENTRY_UNUSED** (0).
     */
    PartitionCount : UInt32

    /**
     * The drive signature value.
     */
    Signature : UInt32

    /**
     * A variable-sized array of [**PARTITION_INFORMATION**](ns-winioctl-partition_information.md) structures, one structure for each partition on a drive.
     */
    PartitionEntry : PARTITION_INFORMATION[1]

}
