#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a set of retrieved disks that can be used as log disks for the specified data disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_query_eligible_logdisks
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_QUERY_ELIGIBLE_LOGDISKS {
    #StructPack 4

    /**
     * The cluster resource identifier of the data disk.
     */
    DataDiskGuid : Guid

    /**
     * When <b>TRUE</b>, the result set includes all the offline disks in the available storage group.
     */
    IncludeOfflineDisks : BOOLEAN

}
