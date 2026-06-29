#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_NETINTERFACE_STATE enumeration (msclus.h) enumerates the possible values of the state of a network interface.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_netinterface_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_NETINTERFACE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The operation was not successful. For more information about the error, call the function 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @type {Integer (Int32)}
     */
    static ClusterNetInterfaceStateUnknown => -1

    /**
     * The node that owns the network interface is down.
     * @type {Integer (Int32)}
     */
    static ClusterNetInterfaceUnavailable => 0

    /**
     * The network interface cannot communicate with any other network interface.
     * @type {Integer (Int32)}
     */
    static ClusterNetInterfaceFailed => 1

    /**
     * The network interface cannot communicate with at least one other network interface whose state is not 
     *       <b>ClusterNetInterfaceFailed</b> or 
     *       <b>ClusterNetInterfaceUnavailable</b>.
     * @type {Integer (Int32)}
     */
    static ClusterNetInterfaceUnreachable => 2

    /**
     * The network interface can communicate with all other network interfaces whose state is not 
     *       <b>ClusterNetInterfaceFailed</b> or 
     *       <b>ClusterNetInterfaceUnavailable</b>.
     * @type {Integer (Int32)}
     */
    static ClusterNetInterfaceUp => 3
}
