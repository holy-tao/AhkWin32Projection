#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NODE_STATE enumeration (msclus.h) describes the state of a cluster node.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_node_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NODE_STATE extends Win32Enum {

    /**
     * The operation was not successful. For more information about the error, call the function 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * Native name: ClusterNodeStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * The node is physically plugged in, turned on, booted, and capable of executing programs. This value is also 
     *        used by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterserviceaccountpassword">SetClusterServiceAccountPassword</a> 
     *        function and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusnode-resume">Resume</a> method.
     * Native name: ClusterNodeUp
     * @type {Integer (Int32)}
     */
    static Up => 0

    /**
     * The node is turned off or not operational.
     * Native name: ClusterNodeDown
     * @type {Integer (Int32)}
     */
    static Down => 1

    /**
     * The node is running but not participating in cluster operations. This value is also used by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-pauseclusternode">PauseClusterNode</a> and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterserviceaccountpassword">SetClusterServiceAccountPassword</a> 
     *        functions. This value is also used <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusnode-pause">Pause</a> method.
     * Native name: ClusterNodePaused
     * @type {Integer (Int32)}
     */
    static Paused => 2

    /**
     * The node is in the process of joining a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * Native name: ClusterNodeJoining
     * @type {Integer (Int32)}
     */
    static Joining => 3
}
