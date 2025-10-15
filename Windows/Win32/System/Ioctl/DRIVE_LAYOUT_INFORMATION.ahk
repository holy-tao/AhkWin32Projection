#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\PARTITION_INFORMATION.ahk

/**
 * Contains information about the partitions of a drive.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-drive_layout_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DRIVE_LAYOUT_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of partitions on a drive.
     * 
     * On disks with the MBR layout, this value is always a multiple of 4. Any partitions that are unused have a partition type of **PARTITION_ENTRY_UNUSED** (0).
     * @type {Integer}
     */
    PartitionCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The drive signature value.
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A variable-sized array of [**PARTITION_INFORMATION**](ns-winioctl-partition_information.md) structures, one structure for each partition on a drive.
     * @type {Array<PARTITION_INFORMATION>}
     */
    PartitionEntry{
        get {
            if(!this.HasProp("__PartitionEntryProxyArray"))
                this.__PartitionEntryProxyArray := Win32FixedArray(this.ptr + 8, 1, PARTITION_INFORMATION, "")
            return this.__PartitionEntryProxyArray
        }
    }
}
