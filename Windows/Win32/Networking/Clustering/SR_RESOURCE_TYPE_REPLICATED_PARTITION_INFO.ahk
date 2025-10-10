#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a replicated partition.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-sr_resource_type_replicated_partition_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Offset of the partition in the disk.
     * @type {Integer}
     */
    PartitionOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The capabilities of replicated partition
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
