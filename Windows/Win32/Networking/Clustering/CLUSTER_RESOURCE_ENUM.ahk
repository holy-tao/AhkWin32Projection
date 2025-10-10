#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the type of cluster object being enumerated by the ClusterResourceEnum or ClusterResourceOpenEnum functions.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_ENUM{

    /**
     * A resource that the resource identified by the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions directly 
 *        depends on.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_ENUM_DEPENDS => 1

    /**
     * A resource that directly depends on the resource identified by the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_ENUM_PROVIDES => 2

    /**
     * A node that can host the resource identified by the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_ENUM_NODES => 4

    /**
     * All nodes and resources identified by the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_ENUM_ALL => 7
}
