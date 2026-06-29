#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information used to increase the size of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_grow_partition
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_GROW_PARTITION {
    #StructPack 8

    /**
     * The identifier of the partition to be enlarged.
     */
    PartitionNumber : UInt32

    /**
     * The number of bytes by which the partition is to be enlarged (positive value) or reduced (negative value). Note that this value is not the new size of the partition.
     */
    BytesToGrow : Int64

}
