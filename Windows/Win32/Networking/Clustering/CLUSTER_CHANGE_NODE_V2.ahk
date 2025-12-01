#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CHANGE_NODE_V2 enumeration (msclus.h) defines the notifications that are generated for a cluster node.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_node_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_NODE_V2 extends Win32Enum{

    /**
     * Indicates that the network interface for the cluster node has been added.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_NETINTERFACE_ADDED_V2 => 1

    /**
     * Indicates that the cluster node has been deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_DELETED_V2 => 2

    /**
     * Indicates that the common properties for the cluster node have been changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_COMMON_PROPERTY_V2 => 4

    /**
     * Indicates that the private properties for the cluster node have been changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_PRIVATE_PROPERTY_V2 => 8

    /**
     * Indicates that the state of the cluster node has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_STATE_V2 => 16

    /**
     * Indicates that the cluster node has gained a group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_GROUP_GAINED_V2 => 32

    /**
     * Indicates that the cluster node has lost a group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_GROUP_LOST_V2 => 64

    /**
     * Indicates that the cluster node's context handle was closed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_HANDLE_CLOSE_V2 => 128

    /**
     * Indicates all V2 cluster node notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NODE_ALL_V2 => 255
}
