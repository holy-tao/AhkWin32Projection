#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a replicated partition.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_partition_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO {
    #StructPack 8

    /**
     * Offset of the partition in the disk.
     */
    PartitionOffset : Int64

    /**
     * The capabilities of replicated partition
     */
    Capabilities : UInt32

}
