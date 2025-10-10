#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the type of notification returned.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE{

    /**
     * The queue receives a notification when a node changes state. For a list of possible node state values, see 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternodestate">GetClusterNodeState</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_STATE => 1

    /**
     * The queue receives a notification when a node is permanently removed from a cluster. A node can be 
 *        permanently deleted from an existing cluster with a call to the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-evictclusternode">EvictClusterNode</a> function.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_DELETED => 2

    /**
     * The queue receives a notification when a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> 
 *        is added to the cluster. A node can be added only when the Cluster service is initially installed on the 
 *        node.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_ADDED => 4

    /**
     * This notification is reserved for future use.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_PROPERTY => 8

    /**
     * The queue receives a notification when the name of a cluster database key has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_REGISTRY_NAME => 16

    /**
     * The queue receives a notification when a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a> key's attributes are changed. The only 
 *        currently defined cluster database key attribute is its security descriptor, which can be changed with 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregsetkeysecurity">ClusterRegSetKeySecurity</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_REGISTRY_ATTRIBUTES => 32

    /**
     * The queue receives a notification when a value of the specified cluster database key is changed or deleted. 
 *        Cluster database values can be changed with the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregsetvalue">ClusterRegSetValue</a> function and deleted with the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregdeletevalue">ClusterRegDeleteValue</a> function.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_REGISTRY_VALUE => 64

    /**
     * Indicates that the other <b>CLUSTER_CHANGE_REGISTRY_*</b> events apply to the entire 
 *        cluster database. If this flag is not included, the events apply only to the specified key.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_REGISTRY_SUBTREE => 128

    /**
     * The queue receives a notification when a resource changes state. For a list of the possible resource state 
 *        values, see <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterresourcestate">GetClusterResourceState</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_STATE => 256

    /**
     * The queue receives a notification when a resource is deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DELETED => 512

    /**
     * The queue receives a notification when a new 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a> is created in the cluster.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_ADDED => 1024

    /**
     * The queue receives a notification when the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-common-properties">properties</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dependencies">dependencies</a>, or 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/p-gly">possible owner</a> nodes of a resource change.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_PROPERTY => 2048

    /**
     * The queue receives a notification when a group changes state. For a list of the possible group state 
 *        values, see <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclustergroupstate">GetClusterGroupState</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_STATE => 4096

    /**
     * The queue receives a notification when an existing group is deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_DELETED => 8192

    /**
     * The queue receives a notification when a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> is created 
 *        in the cluster.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_ADDED => 16384

    /**
     * The queue receives a notification when the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/group-common-properties">properties</a> of a group change or when a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a> is added or removed from a group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_PROPERTY => 32768

    /**
     * The queue receives a notification when an existing resource type is deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_DELETED => 65536

    /**
     * The queue receives a notification when a new 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a> is created in the cluster.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_ADDED => 131072

    /**
     * The queue receives a notification when the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-common-properties">properties</a> of a resource type 
 *        change.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_PROPERTY => 262144

    /**
     * When generated by a client, this value indicates that the RPC connection to a server has been reconnected to another server for the specified cluster. When generated by the server, this value indicates that notification events were dropped by the server for the port.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_RECONNECT => 524288

    /**
     * The queue receives a notification when a network changes state. For a list of the possible network state 
 *        values, see <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternetworkstate">GetClusterNetworkState</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETWORK_STATE => 1048576

    /**
     * The queue receives a notification when a network is permanently removed from the cluster environment.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETWORK_DELETED => 2097152

    /**
     * The queue receives a notification when a new 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/networks">network</a> is added to the cluster environment.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETWORK_ADDED => 4194304

    /**
     * The queue receives a notification when the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-common-properties">properties</a> of an existing network change.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETWORK_PROPERTY => 8388608

    /**
     * The queue receives a notification when a network interface changes state. For a list of the possible network 
 *        interface state values, see 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternetinterfacestate">GetClusterNetInterfaceState</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_STATE => 16777216

    /**
     * The queue receives a notification when a network interface is permanently removed from a cluster node.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_DELETED => 33554432

    /**
     * The queue receives a notification when a new 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interfaces">network interface</a> is added to a cluster 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_ADDED => 67108864

    /**
     * The queue receives a notification when the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interface-common-properties">properties</a> of an existing network 
 *        interface change.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_PROPERTY => 134217728

    /**
     * This notification is reserved for future use.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_QUORUM_STATE => 268435456

    /**
     * The queue receives a notification when the cluster becomes unavailable, meaning that all attempts to 
 *        communicate with the cluster fail.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_STATE => 536870912

    /**
     * The queue receives a notification when the cluster's prioritized list of internal 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/networks">networks</a> changes.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_PROPERTY => 1073741824

    /**
     * The queue receives a notification when a handle associated with a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">cluster object</a> is closed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_HANDLE_CLOSE => -2147483648

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_ALL => -1
}
