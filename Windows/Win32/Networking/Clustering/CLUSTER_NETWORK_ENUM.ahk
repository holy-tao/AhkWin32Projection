#Requires AutoHotkey v2.0.0 64-bit

/**
 * CLUSTER_NETWORK_ENUM (msclus.h) describes the type of cluster object being enumerated by the ClusterNetworkEnum and ClusterNetworkOpenEnum functions.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_network_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NETWORK_ENUM{

    /**
     * The object is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interfaces">network interface</a>.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NETWORK_ENUM_NETINTERFACES => 1

    /**
     * All cluster objects on the network.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NETWORK_ENUM_ALL => 1
}
