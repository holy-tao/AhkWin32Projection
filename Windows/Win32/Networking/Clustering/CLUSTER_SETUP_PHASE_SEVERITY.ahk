#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the severity of the current phase of the cluster setup process.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_setup_phase_severity
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SETUP_PHASE_SEVERITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This phase of the cluster setup can complete successfully.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseInformational => 1

    /**
     * This phase of the cluster setup can complete, with a warning.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseWarning => 2

    /**
     * This phase of the cluster setup process cannot complete successfully.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseFatal => 3
}
