#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the state of a cluster node.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_node_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NODE_STATE{

    /**
     * The operation was not successful. For more information about the error, call the function 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @type {Integer (Int32)}
     */
    static ClusterNodeStateUnknown => -1

    /**
     * The node is physically plugged in, turned on, booted, and capable of executing programs. This value is also 
 *        used by the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterserviceaccountpassword">SetClusterServiceAccountPassword</a> 
 *        function and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusnode-resume">Resume</a> method.
     * @type {Integer (Int32)}
     */
    static ClusterNodeUp => 0

    /**
     * The node is turned off or not operational.
     * @type {Integer (Int32)}
     */
    static ClusterNodeDown => 1

    /**
     * The node is running but not participating in cluster operations. This value is also used by the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-pauseclusternode">PauseClusterNode</a> and 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterserviceaccountpassword">SetClusterServiceAccountPassword</a> 
 *        functions. This value is also used <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusnode-pause">Pause</a> method.
     * @type {Integer (Int32)}
     */
    static ClusterNodePaused => 2

    /**
     * The node is in the process of joining a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @type {Integer (Int32)}
     */
    static ClusterNodeJoining => 3
}
