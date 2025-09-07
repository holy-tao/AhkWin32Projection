#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the state of a rolling upgrade of the operating system on a cluster. This enumeration is used by the ClusterUpgradeProgressCallback callback function.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_upgrade_phase
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_UPGRADE_PHASE{

    /**
     * The nodes are being notified that an upgrade has started.
     * @type {Integer (Int32)}
     */
    static ClusterUpgradePhaseInitialize => 1

    /**
     * The updated is being validated to determine whether the all of nodes in the cluster can be upgraded.
     * @type {Integer (Int32)}
     */
    static ClusterUpgradePhaseValidatingUpgrade => 2

    /**
     * The nodes are being upgraded.
     * @type {Integer (Int32)}
     */
    static ClusterUpgradePhaseUpgradingComponents => 3

    /**
     * The new resources are being installed.
     * @type {Integer (Int32)}
     */
    static ClusterUpgradePhaseInstallingNewComponents => 4

    /**
     * The upgrade is complete.
     * @type {Integer (Int32)}
     */
    static ClusterUpgradePhaseUpgradeComplete => 5
}
