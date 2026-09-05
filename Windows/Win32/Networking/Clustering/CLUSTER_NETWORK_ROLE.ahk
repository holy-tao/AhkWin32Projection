#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NETWORK_ROLE enumeration (msclus.h) describes the role a network plays in the cluster.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_network_role
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NETWORK_ROLE extends Win32Enum {

    /**
     * The network is not used by the cluster.
     * Native name: ClusterNetworkRoleNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The network is used to carry internal cluster communication.
     * Native name: ClusterNetworkRoleInternalUse
     * @type {Integer (Int32)}
     */
    static InternalUse => 1

    /**
     * Not supported.
     * Native name: ClusterNetworkRoleClientAccess
     * @type {Integer (Int32)}
     */
    static ClientAccess => 2

    /**
     * The network is used to connect client systems and to carry internal cluster communication.
     * Native name: ClusterNetworkRoleInternalAndClient
     * @type {Integer (Int32)}
     */
    static InternalAndClient => 3
}
