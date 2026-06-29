#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains partition information specific to master boot record (MBR) disks.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information_mbr
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PARTITION_INFORMATION_MBR {
    #StructPack 4

    /**
     * The type of partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-partition-types">Disk Partition Types</a>.
     */
    PartitionType : Int8

    /**
     * If the member is <b>TRUE</b>, the partition is a boot partition. When this structure is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_partition_info_ex">IOCTL_DISK_SET_PARTITION_INFO_EX</a> control code, the value of this parameter is ignored.
     */
    BootIndicator : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the partition is of a recognized type. When this structure is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_partition_info_ex">IOCTL_DISK_SET_PARTITION_INFO_EX</a> control code, the value of this parameter is ignored.
     */
    RecognizedPartition : BOOLEAN

    /**
     * The number of hidden sectors to be allocated when the partition table is created.
     */
    HiddenSectors : UInt32

    PartitionId : Guid

}
