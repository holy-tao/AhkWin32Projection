#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines which resource monitor a given resource will be assigned to.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_create_flags
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_CREATE_FLAGS{

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a> determines the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> to which the new resource will be 
 *       assigned.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_DEFAULT_MONITOR => 0

    /**
     * Causes the Cluster service to create a separate Resource Monitor dedicated exclusively to the new 
 *       resource.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_SEPARATE_MONITOR => 1

    /**
     * Contains all valid flags for the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_create_flags">CLUSTER_RESOURCE_CREATE_FLAGS</a> 
 *       enumeration.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_VALID_FLAGS => 1
}
