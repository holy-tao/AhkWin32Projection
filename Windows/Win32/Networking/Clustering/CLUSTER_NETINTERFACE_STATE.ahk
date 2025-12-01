#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NETINTERFACE_STATE enumeration (msclus.h) enumerates the possible values of the state of a network interface.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_netinterface_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NETINTERFACE_STATE extends Win32Enum{

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
