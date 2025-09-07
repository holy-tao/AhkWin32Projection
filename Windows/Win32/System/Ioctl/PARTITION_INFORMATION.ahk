#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a disk partition.
 * @remarks
 * If the partition is on a disk formatted as type master boot record (MBR), partition size totals are limited. For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_drive_layout">IOCTL_DISK_SET_DRIVE_LAYOUT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PARTITION_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The starting offset of the partition.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The length of the partition, in bytes.
     * @type {Integer}
     */
    PartitionLength {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of hidden sectors in the partition.
     * @type {Integer}
     */
    HiddenSectors {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of the partition (1-based).
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The type of partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-partition-types">Disk Partition Types</a>.
     * @type {Integer}
     */
    PartitionType {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * If this member is <b>TRUE</b>, the partition is bootable.
     * @type {Integer}
     */
    BootIndicator {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * If this member is <b>TRUE</b>, the partition is of a recognized type.
     * @type {Integer}
     */
    RecognizedPartition {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * If this member is <b>TRUE</b>, the partition information has changed. When you change a partition (with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_drive_layout">IOCTL_DISK_SET_DRIVE_LAYOUT</a>), the system uses this member to determine which partitions have changed and need their information rewritten.
     * @type {Integer}
     */
    RewritePartition {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }
}
