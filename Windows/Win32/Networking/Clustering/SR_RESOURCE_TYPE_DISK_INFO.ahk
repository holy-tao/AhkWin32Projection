#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SR_DISK_REPLICATION_ELIGIBLE.ahk" { SR_DISK_REPLICATION_ELIGIBLE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a set of information that indicates whether a disk is eligible for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_disk_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_DISK_INFO {
    #StructPack 4

    /**
     * Indicates the reason that the disk is eligible or ineligible for replication.
     */
    Reason : SR_DISK_REPLICATION_ELIGIBLE

    /**
     * The cluster resource identifier of the disk.
     */
    DiskGuid : Guid

}
