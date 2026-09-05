#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the severity of the current phase of the cluster setup process.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_setup_phase_severity
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SETUP_PHASE_SEVERITY extends Win32Enum {

    /**
     * This phase of the cluster setup can complete successfully.
     * Native name: ClusterSetupPhaseInformational
     * @type {Integer (Int32)}
     */
    static Informational => 1

    /**
     * This phase of the cluster setup can complete, with a warning.
     * Native name: ClusterSetupPhaseWarning
     * @type {Integer (Int32)}
     */
    static Warning => 2

    /**
     * This phase of the cluster setup process cannot complete successfully.
     * Native name: ClusterSetupPhaseFatal
     * @type {Integer (Int32)}
     */
    static Fatal => 3
}
