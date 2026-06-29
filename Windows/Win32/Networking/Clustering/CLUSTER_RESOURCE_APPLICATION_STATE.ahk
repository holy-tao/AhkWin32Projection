#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates resource application states.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-cluster_resource_application_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_RESOURCE_APPLICATION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
