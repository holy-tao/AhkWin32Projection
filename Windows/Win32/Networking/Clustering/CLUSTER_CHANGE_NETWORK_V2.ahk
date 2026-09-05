#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CHANGE_NETWORK_V2 enumeration (msclus.h) defines the notifications that are generated for a cluster network.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_network_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CHANGE_NETWORK_V2 extends Win32Enum {

    /**
     * Indicates that the cluster network has been deleted.
     * Native name: CLUSTER_CHANGE_NETWORK_DELETED_V2
     * @type {Integer (Int32)}
     */
    static DELETED_V2 => 1

    /**
     * Indicates that the common properties for the cluster network have changed.
     * Native name: CLUSTER_CHANGE_NETWORK_COMMON_PROPERTY_V2
     * @type {Integer (Int32)}
     */
    static COMMON_PROPERTY_V2 => 2

    /**
     * Indicates that the private properties for the cluster network have changed.
     * Native name: CLUSTER_CHANGE_NETWORK_PRIVATE_PROPERTY_V2
     * @type {Integer (Int32)}
     */
    static PRIVATE_PROPERTY_V2 => 4

    /**
     * Indicates that the cluster network state has changed.
     * Native name: CLUSTER_CHANGE_NETWORK_STATE_V2
     * @type {Integer (Int32)}
     */
    static STATE_V2 => 8

    /**
     * Indicates that the cluster network's context handle was closed.
     * Native name: CLUSTER_CHANGE_NETWORK_HANDLE_CLOSE_V2
     * @type {Integer (Int32)}
     */
    static HANDLE_CLOSE_V2 => 16

    /**
     * Indicates all V2 cluster network notifications.
     * Native name: CLUSTER_CHANGE_NETWORK_ALL_V2
     * @type {Integer (Int32)}
     */
    static ALL_V2 => 31
}
