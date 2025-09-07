#Requires AutoHotkey v2.0.0 64-bit

/**
 * CLUS_FLAGS (msclus.h) identifies the resource or group as a core resource.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clus_flags
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_FLAGS{

    /**
     * Identifies <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/core-resources">core resources</a> or the cluster group that 
 *        contains core resources. The 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> function with the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-flags">CLUSCTL_RESOURCE_GET_FLAGS</a> control 
 *        code can retrieve the flags that are set for a resource.
     * @type {Integer (Int32)}
     */
    static CLUS_FLAG_CORE => 1
}
