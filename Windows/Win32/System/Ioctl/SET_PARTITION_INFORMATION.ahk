#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to set a disk partition's type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-set_partition_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SET_PARTITION_INFORMATION extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * The type of partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-partition-types">Disk Partition Types</a>.
     * @type {Integer}
     */
    PartitionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
