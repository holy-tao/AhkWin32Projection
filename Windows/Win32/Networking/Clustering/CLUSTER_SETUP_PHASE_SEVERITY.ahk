#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the severity of the current phase of the cluster setup process.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-cluster_setup_phase_severity
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SETUP_PHASE_SEVERITY{

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
