#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to increase the size of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_grow_partition
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_GROW_PARTITION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The identifier of the partition to be enlarged.
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes by which the partition is to be enlarged (positive value) or reduced (negative value). Note that this value is not the new size of the partition.
     * @type {Integer}
     */
    BytesToGrow {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
