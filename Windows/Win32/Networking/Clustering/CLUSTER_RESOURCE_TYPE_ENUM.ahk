#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the type of cluster object being enumerated by the ClusterResourceTypeEnum and ClusterResourceTypeOpenEnum functions.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_type_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_TYPE_ENUM{

    /**
     * The object is a node that can be a possible owner of the resource type.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_TYPE_ENUM_NODES => 1

    /**
     * The object is a resource that is an instance of the resource type.
     * 
     * <b>Windows Server 2008:  </b>This value is not supported before Windows Server 2008 R2. To emulate this on earlier platforms, 
     *        enumerate all resources in the cluster (see the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenum">ClusterOpenEnum</a> function) and filter the results 
     *        using the <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilresourcetypesequal">ResUtilResourceTypesEqual</a> 
     *        function. If the call is made on a system without ResUtils.dll, then use the steps mentioned in the Remarks 
     *        section of the <b>ResUtilResourceTypesEqual</b> 
     *        function.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_TYPE_ENUM_RESOURCES => 2

    /**
     * All cluster objects identified by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypeenum">ClusterResourceTypeEnum</a> and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypeopenenum">ClusterResourceTypeOpenEnum</a> 
     *        functions.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_TYPE_ENUM_ALL => 3
}
