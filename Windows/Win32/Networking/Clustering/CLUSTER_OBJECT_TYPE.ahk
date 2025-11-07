#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of object for which a notification is requested or generated.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_object_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_OBJECT_TYPE{

    /**
     * The notification is for an unspecified type.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_NONE => 0

    /**
     * The notification is for the cluster.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_CLUSTER => 1

    /**
     * The notification is for a group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_GROUP => 2

    /**
     * The notification is for a resource.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_RESOURCE => 3

    /**
     * The notification is for a resource type.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_RESOURCE_TYPE => 4

    /**
     * The notification is for a cluster network interface.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_NETWORK_INTERFACE => 5

    /**
     * The notification is for a cluster network.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_NETWORK => 6

    /**
     * The notification is for a cluster node.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_NODE => 7

    /**
     * The notification is for a cluster registry key.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_REGISTRY => 8

    /**
     * The notification is for a quorum resource.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_QUORUM => 9

    /**
     * The notification is for a cluster shared volume.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_SHARED_VOLUME => 10

    /**
     * The notification is for a groupset.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This value is unavailable prior to Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_GROUPSET => 13

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_AFFINITYRULE => 16

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_OBJECT_TYPE_FAULTDOMAIN => 17
}
