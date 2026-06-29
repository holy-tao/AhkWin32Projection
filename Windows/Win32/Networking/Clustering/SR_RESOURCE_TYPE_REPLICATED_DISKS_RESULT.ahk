#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SR_RESOURCE_TYPE_REPLICATED_DISK.ahk" { SR_RESOURCE_TYPE_REPLICATED_DISK }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SR_REPLICATED_DISK_TYPE.ahk" { SR_REPLICATED_DISK_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes a retrieved set of replicated disks.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_disks_result
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_REPLICATED_DISKS_RESULT {
    #StructPack 4

    /**
     * The number of replicated disks in the result set.
     */
    Count : UInt16

    /**
     * The retrieved array of replicated disks.
     */
    ReplicatedDisks : SR_RESOURCE_TYPE_REPLICATED_DISK[1]

}
