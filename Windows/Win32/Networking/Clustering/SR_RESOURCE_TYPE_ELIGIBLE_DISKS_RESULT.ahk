#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SR_RESOURCE_TYPE_DISK_INFO.ahk" { SR_RESOURCE_TYPE_DISK_INFO }
#Import ".\SR_DISK_REPLICATION_ELIGIBLE.ahk" { SR_DISK_REPLICATION_ELIGIBLE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a set of data disks retrieved by a resource type control code operation for storage replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_eligible_disks_result
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_ELIGIBLE_DISKS_RESULT {
    #StructPack 4

    /**
     * The number of retrieved disks.
     */
    Count : UInt16

    /**
     * An array that contains the retrieved disk information.
     */
    DiskInfo : SR_RESOURCE_TYPE_DISK_INFO[1]

}
