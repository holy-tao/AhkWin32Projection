#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the progress of the cluster setup process.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_setup_phase_type
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SETUP_PHASE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the start of a new setup phase.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseStart => 1

    /**
     * Indicates the continuation of a setup phase.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseContinue => 2

    /**
     * Indicates the end of a setup phase. Called once at the end of every setup phase.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseReport => 4
}
