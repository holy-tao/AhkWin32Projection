#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUSTER_RESOURCE_ENUM (msclus.h) describes the type of cluster object being enumerated by the ClusterResourceEnum or ClusterResourceOpenEnum functions.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_resource_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_RESOURCE_ENUM extends Win32Enum {

    /**
     * A resource that the resource identified by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions directly 
     *        depends on.
     * Native name: CLUSTER_RESOURCE_ENUM_DEPENDS
     * @type {Integer (Int32)}
     */
    static DEPENDS => 1

    /**
     * A resource that directly depends on the resource identified by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions.
     * Native name: CLUSTER_RESOURCE_ENUM_PROVIDES
     * @type {Integer (Int32)}
     */
    static PROVIDES => 2

    /**
     * A node that can host the resource identified by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions.
     * Native name: CLUSTER_RESOURCE_ENUM_NODES
     * @type {Integer (Int32)}
     */
    static NODES => 4

    /**
     * All nodes and resources identified by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceenum">ClusterResourceEnum</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> functions.
     * Native name: CLUSTER_RESOURCE_ENUM_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7
}
