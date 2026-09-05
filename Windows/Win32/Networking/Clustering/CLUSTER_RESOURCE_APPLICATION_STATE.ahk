#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates resource application states.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-cluster_resource_application_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_RESOURCE_APPLICATION_STATE extends Win32Enum {

    /**
     * Application state is unknown.
     * Native name: ClusterResourceApplicationStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Application OSHeartBeat is detected.
     * Native name: ClusterResourceApplicationOSHeartBeat
     * @type {Integer (Int32)}
     */
    static ApplicationOSHeartBeat => 2

    /**
     * Application is ready.
     * Native name: ClusterResourceApplicationReady
     * @type {Integer (Int32)}
     */
    static Ready => 3
}
