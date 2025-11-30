#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the progress of the cluster setup process.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-cluster_setup_phase_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SETUP_PHASE_TYPE extends Win32Enum{

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
     * 
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseReport => 4
}
