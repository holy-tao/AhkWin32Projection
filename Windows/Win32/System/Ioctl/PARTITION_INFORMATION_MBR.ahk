#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Contains partition information specific to master boot record (MBR) disks.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information_mbr
 * @namespace Windows.Win32.System.Ioctl
 */
class PARTITION_INFORMATION_MBR extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * The type of partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-partition-types">Disk Partition Types</a>.
     * @type {Integer}
     */
    PartitionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If the member is <b>TRUE</b>, the partition is a boot partition. When this structure is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_partition_info_ex">IOCTL_DISK_SET_PARTITION_INFO_EX</a> control code, the value of this parameter is ignored.
     * @type {BOOLEAN}
     */
    BootIndicator {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * If this member is <b>TRUE</b>, the partition is of a recognized type. When this structure is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_partition_info_ex">IOCTL_DISK_SET_PARTITION_INFO_EX</a> control code, the value of this parameter is ignored.
     * @type {BOOLEAN}
     */
    RecognizedPartition {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The number of hidden sectors to be allocated when the partition table is created.
     * @type {Integer}
     */
    HiddenSectors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(8, this)
            return this.__PartitionId
        }
    }
}
