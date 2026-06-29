#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains information about a disk partition.
 * @remarks
 * If the partition is on a disk formatted as type master boot record (MBR), partition size totals are limited. For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_drive_layout">IOCTL_DISK_SET_DRIVE_LAYOUT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PARTITION_INFORMATION {
    #StructPack 8

    /**
     * The starting offset of the partition.
     */
    StartingOffset : Int64

    /**
     * The length of the partition, in bytes.
     */
    PartitionLength : Int64

    /**
     * The number of hidden sectors in the partition.
     */
    HiddenSectors : UInt32

    /**
     * The number of the partition (1-based).
     */
    PartitionNumber : UInt32

    /**
     * The type of partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-partition-types">Disk Partition Types</a>.
     */
    PartitionType : Int8

    /**
     * If this member is <b>TRUE</b>, the partition is bootable.
     */
    BootIndicator : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the partition is of a recognized type.
     */
    RecognizedPartition : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the partition information has changed. When you change a partition (with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_drive_layout">IOCTL_DISK_SET_DRIVE_LAYOUT</a>), the system uses this member to determine which partitions have changed and need their information rewritten.
     */
    RewritePartition : BOOLEAN

}
