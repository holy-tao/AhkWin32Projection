#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SR_REPLICATED_DISK_TYPE.ahk" { SR_REPLICATED_DISK_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a replicated disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_disk
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_REPLICATED_DISK {
    #StructPack 4

    /**
     * The type of the replicated disk.
     */
    Type : SR_REPLICATED_DISK_TYPE

    /**
     * The cluster resource identifier of the disk.
     */
    ClusterDiskResourceGuid : Guid

    /**
     * The replication group identifier of the disk.
     */
    ReplicationGroupId : Guid

    /**
     * The name of the replication group..
     */
    ReplicationGroupName : WCHAR[260]

}
