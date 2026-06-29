#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Enables or disables maintenance mode on a cluster node.
 * @remarks
 * When using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> to enable 
 *     or disable maintenance mode on a specified resource, the calling routine can specify a larger buffer with addition 
 *     resource-specific data by including it immediately after the 
 *     <b>CLUS_MAINTENANCE_MODE_INFO</b> structure. This 
 *     data then becomes private to the resource as it cannot be retrieved by the calling program using the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-maintenance-mode">CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE</a> 
 *     control code.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_maintenance_mode_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_MAINTENANCE_MODE_INFO {
    #StructPack 4

    /**
     * Set to <b>TRUE</b> to enable or <b>FALSE</b> to disable maintenance 
     *       mode for the identified resource.
     * 
     * When queried, a resource will return <b>True</b> or <b>False</b> to 
     *        indicate the current maintenance mode state of the resource.
     */
    InMaintenance : BOOL

}
