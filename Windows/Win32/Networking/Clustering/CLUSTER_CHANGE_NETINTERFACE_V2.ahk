#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of notifications that are generated for a cluster network interface.
 * @remarks
 * 
 * Protocol version 2.0 servers do not support this enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_netinterface_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_NETINTERFACE_V2 extends Win32Enum{

    /**
     * Indicates that the cluster network interface has been deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_DELETED_V2 => 1

    /**
     * Indicates that the common properties for the cluster interface have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_COMMON_PROPERTY_V2 => 2

    /**
     * Indicates that the private properties for the cluster interface have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_PRIVATE_PROPERTY_V2 => 4

    /**
     * Indicates that the state of the cluster interface has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_STATE_V2 => 8

    /**
     * Indicates that the cluster interface's context handle was closed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_HANDLE_CLOSE_V2 => 16

    /**
     * Indicates all V2 network interface notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_NETINTERFACE_ALL_V2 => 31
}
