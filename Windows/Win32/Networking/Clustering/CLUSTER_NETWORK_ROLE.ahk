#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the role a network plays in the cluster.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_network_role
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NETWORK_ROLE{

    /**
     * The network is not used by the cluster.
     * @type {Integer (Int32)}
     */
    static ClusterNetworkRoleNone => 0

    /**
     * The network is used to carry internal cluster communication.
     * @type {Integer (Int32)}
     */
    static ClusterNetworkRoleInternalUse => 1

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static ClusterNetworkRoleClientAccess => 2

    /**
     * The network is used to connect client systems and to carry internal cluster communication.
     * @type {Integer (Int32)}
     */
    static ClusterNetworkRoleInternalAndClient => 3
}
