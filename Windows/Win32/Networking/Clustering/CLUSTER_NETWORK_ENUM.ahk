#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * CLUSTER_NETWORK_ENUM (msclus.h) describes the type of cluster object being enumerated by the ClusterNetworkEnum and ClusterNetworkOpenEnum functions.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_network_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_NETWORK_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
