#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the list of notifications that are generated for a cluster.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_cluster_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_CLUSTER_V2 extends Win32Enum{

    /**
     * Indicates that a reconnect procedure occurred. This notification applies to clients only.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_RECONNECT_V2 => 1

    /**
     * Indicates that a cluster state changed. This notification applies to clients only.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_STATE_V2 => 2

    /**
     * Indicates that a new group was created.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_GROUP_ADDED_V2 => 4

    /**
     * Indicates that a context handle was closed. This notification applies to clients only.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_HANDLE_CLOSE_V2 => 8

    /**
     * Indicates that a cluster network was added to the cluster.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_NETWORK_ADDED_V2 => 16

    /**
     * Indicates that a node was added to the cluster. Nodes are added to a cluster in an implementation-specific way.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_NODE_ADDED_V2 => 32

    /**
     * Indicates that a new resource type was added to the cluster.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_RESOURCE_TYPE_ADDED_V2 => 64

    /**
     * Indicates that a cluster common property changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_COMMON_PROPERTY_V2 => 128

    /**
     * Indicates that a cluster private property changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_PRIVATE_PROPERTY_V2 => 256

    /**
     * Indicates that notifications might have been lost due to a transient condition on the server.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_LOST_NOTIFICATIONS_V2 => 512

    /**
     * Indicates that the cluster's name changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_RENAME_V2 => 1024

    /**
     * Indicates that the cluster's membership changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_MEMBERSHIP_V2 => 2048

    /**
     * Indicates that the cluster upgraded the Cluster service.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This value is not supported until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_UPGRADED_V2 => 4096

    /**
     * Indicates all V2 cluster notifications.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>The value of this constant is  4095 (0x0FFF).
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_CLUSTER_ALL_V2 => 8191
}
