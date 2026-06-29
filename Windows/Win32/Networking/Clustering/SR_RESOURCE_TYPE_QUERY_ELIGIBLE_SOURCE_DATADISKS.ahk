#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a set of retrieved data disks that can be used as source sites for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_query_eligible_source_datadisks
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_QUERY_ELIGIBLE_SOURCE_DATADISKS {
    #StructPack 4

    /**
     * The cluster resource identifier of the data disk.
     */
    DataDiskGuid : Guid

    /**
     * <b>true</b> if the result set includes disks in the available storage group.
     */
    IncludeAvailableStoargeDisks : BOOLEAN

}
