#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_RESOURCE_STATE enumeration (msclus.h) describes the operational condition of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_resource_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_RESOURCE_STATE extends Win32Enum {

    /**
     * The operation was not successful. For more information about the error, call the function 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * Native name: ClusterResourceStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * The resource has been inherited.
     * Native name: ClusterResourceInherited
     * @type {Integer (Int32)}
     */
    static Inherited => 0

    /**
     * The resource is performing initialization.
     * Native name: ClusterResourceInitializing
     * @type {Integer (Int32)}
     */
    static Initializing => 1

    /**
     * The resource is operational and functioning normally.
     * Native name: ClusterResourceOnline
     * @type {Integer (Int32)}
     */
    static Online => 2

    /**
     * The resource is not operational.
     * Native name: ClusterResourceOffline
     * @type {Integer (Int32)}
     */
    static Offline => 3

    /**
     * The resource has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/f-gly">failed</a>.
     * Native name: ClusterResourceFailed
     * @type {Integer (Int32)}
     */
    static Failed => 4

    /**
     * The resource is in the process of coming online or going 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">offline</a>.
     * Native name: ClusterResourcePending
     * @type {Integer (Int32)}
     */
    static Pending => 128

    /**
     * The resource is in the process of coming online.
     * Native name: ClusterResourceOnlinePending
     * @type {Integer (Int32)}
     */
    static OnlinePending => 129

    /**
     * The resource is in the process of going offline.
     * Native name: ClusterResourceOfflinePending
     * @type {Integer (Int32)}
     */
    static OfflinePending => 130
}
