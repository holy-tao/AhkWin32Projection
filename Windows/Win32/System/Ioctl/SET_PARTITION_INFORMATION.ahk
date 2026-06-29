#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information used to set a disk partition's type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-set_partition_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SET_PARTITION_INFORMATION {
    #StructPack 1

    /**
     * The type of partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-partition-types">Disk Partition Types</a>.
     */
    PartitionType : Int8

}
