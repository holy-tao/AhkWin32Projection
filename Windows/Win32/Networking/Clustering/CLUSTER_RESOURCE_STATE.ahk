#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the operational condition of a resource.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_STATE{

    /**
     * The operation was not successful. For more information about the error, call the function 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @type {Integer (Int32)}
     */
    static ClusterResourceStateUnknown => -1

    /**
     * The resource has been inherited.
     * @type {Integer (Int32)}
     */
    static ClusterResourceInherited => 0

    /**
     * The resource is performing initialization.
     * @type {Integer (Int32)}
     */
    static ClusterResourceInitializing => 1

    /**
     * The resource is operational and functioning normally.
     * @type {Integer (Int32)}
     */
    static ClusterResourceOnline => 2

    /**
     * The resource is not operational.
     * @type {Integer (Int32)}
     */
    static ClusterResourceOffline => 3

    /**
     * The resource has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/f-gly">failed</a>.
     * @type {Integer (Int32)}
     */
    static ClusterResourceFailed => 4

    /**
     * The resource is in the process of coming online or going 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">offline</a>.
     * @type {Integer (Int32)}
     */
    static ClusterResourcePending => 128

    /**
     * The resource is in the process of coming online.
     * @type {Integer (Int32)}
     */
    static ClusterResourceOnlinePending => 129

    /**
     * The resource is in the process of going offline.
     * @type {Integer (Int32)}
     */
    static ClusterResourceOfflinePending => 130
}
