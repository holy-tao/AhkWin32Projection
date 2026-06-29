#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a set of retrieved data disks that can be used as target sites for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_query_eligible_target_datadisks
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_QUERY_ELIGIBLE_TARGET_DATADISKS {
    #StructPack 4

    /**
     * The cluster resource identifier of the data disk.
     */
    SourceDataDiskGuid : Guid

    /**
     * The identifier of the replication group that contains the retrieved data disks.
     */
    TargetReplicationGroupGuid : Guid

    /**
     * <b>true</b> if the disks that are connected to the same nodes as the source disk are included in result set.
     */
    SkipConnectivityCheck : BOOLEAN

    /**
     * <b>true</b> if the result set includes all offline disks in the available storage group.
     */
    IncludeOfflineDisks : BOOLEAN

}
