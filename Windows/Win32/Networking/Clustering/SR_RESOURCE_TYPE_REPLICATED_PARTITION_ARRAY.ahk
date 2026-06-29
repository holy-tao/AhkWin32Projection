#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO.ahk" { SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO }

/**
 * Lists the all replicated partitions on a disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_partition_array
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_REPLICATED_PARTITION_ARRAY {
    #StructPack 8

    /**
     * The count of all replicated partitions on the disk.
     */
    Count : UInt32

    /**
     * A variable size array of all replicated partitions on the disk.
     */
    PartitionArray : SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO[1]

}
