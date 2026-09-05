#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the progress of the cluster setup process.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_setup_phase_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SETUP_PHASE_TYPE extends Win32Enum {

    /**
     * Indicates the start of a new setup phase.
     * Native name: ClusterSetupPhaseStart
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Indicates the continuation of a setup phase.
     * Native name: ClusterSetupPhaseContinue
     * @type {Integer (Int32)}
     */
    static Continue => 2

    /**
     * Indicates the end of a setup phase. Called once at the end of every setup phase.
     * Native name: ClusterSetupPhaseEnd
     * @type {Integer (Int32)}
     */
    static End => 3

    /**
     * Native name: ClusterSetupPhaseReport
     * @type {Integer (Int32)}
     */
    static Report => 4
}
