#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NETWORK_STATE enumeration (msclus.h) enumerates the possible values of the state of a network.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_network_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NETWORK_STATE extends Win32Enum {

    /**
     * The operation was not successful. For more information about the error, call the function 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * Native name: ClusterNetworkStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * All of the network interfaces on the network are unavailable, which means that the nodes that own the network 
     *        interfaces are down.
     * Native name: ClusterNetworkUnavailable
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * The network is not operational; none of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">nodes</a> on the network 
     *        can communicate.
     * Native name: ClusterNetworkDown
     * @type {Integer (Int32)}
     */
    static Down => 1

    /**
     * The network is operational, but two or more nodes on the network cannot communicate. Typically a 
     *        path-specific problem has occurred.
     * Native name: ClusterNetworkPartitioned
     * @type {Integer (Int32)}
     */
    static Partitioned => 2

    /**
     * The network is operational; all of the nodes in the cluster can communicate.
     * Native name: ClusterNetworkUp
     * @type {Integer (Int32)}
     */
    static Up => 3
}
