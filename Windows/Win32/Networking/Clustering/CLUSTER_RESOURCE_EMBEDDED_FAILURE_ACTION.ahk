#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION enumeration (msclus.h) specifies the various actions that can be performed when a resource has an embedded failure.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_resource_embedded_failure_action
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that no action is to be taken.
     * @type {Integer (Int32)}
     */
    static ClusterResourceEmbeddedFailureActionNone => 0

    /**
     * Indicates that the failure is to be logged.
     * @type {Integer (Int32)}
     */
    static ClusterResourceEmbeddedFailureActionLogOnly => 1

    /**
     * Indicates that the resource is to be recovered.
     * @type {Integer (Int32)}
     */
    static ClusterResourceEmbeddedFailureActionRecover => 2
}
