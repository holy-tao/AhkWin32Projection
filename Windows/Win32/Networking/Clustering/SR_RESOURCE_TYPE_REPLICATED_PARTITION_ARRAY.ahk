#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO.ahk

/**
 * Lists the all replicated partitions on a disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_partition_array
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_REPLICATED_PARTITION_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The count of all replicated partitions on the disk.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A variable size array of all replicated partitions on the disk.
     * @type {Array<SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO>}
     */
    PartitionArray{
        get {
            if(!this.HasProp("__PartitionArrayProxyArray"))
                this.__PartitionArrayProxyArray := Win32FixedArray(this.ptr + 8, 1, SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO, "")
            return this.__PartitionArrayProxyArray
        }
    }
}
