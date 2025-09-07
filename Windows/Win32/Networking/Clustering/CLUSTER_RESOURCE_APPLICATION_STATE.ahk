#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates resource application states.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-cluster_resource_application_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_APPLICATION_STATE{

    /**
     * Application state is unknown.
     * @type {Integer (Int32)}
     */
    static ClusterResourceApplicationStateUnknown => 1

    /**
     * Application OSHeartBeat is detected.
     * @type {Integer (Int32)}
     */
    static ClusterResourceApplicationOSHeartBeat => 2

    /**
     * Application is ready.
     * @type {Integer (Int32)}
     */
    static ClusterResourceApplicationReady => 3
}
