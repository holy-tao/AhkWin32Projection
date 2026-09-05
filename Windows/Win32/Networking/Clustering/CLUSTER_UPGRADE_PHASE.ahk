#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the state of a rolling upgrade of the operating system on a cluster. This enumeration is used by the ClusterUpgradeProgressCallback callback function.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_upgrade_phase
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_UPGRADE_PHASE extends Win32Enum {

    /**
     * The nodes are being notified that an upgrade has started.
     * Native name: ClusterUpgradePhaseInitialize
     * @type {Integer (Int32)}
     */
    static Initialize => 1

    /**
     * The updated is being validated to determine whether the all of nodes in the cluster can be upgraded.
     * Native name: ClusterUpgradePhaseValidatingUpgrade
     * @type {Integer (Int32)}
     */
    static ValidatingUpgrade => 2

    /**
     * The nodes are being upgraded.
     * Native name: ClusterUpgradePhaseUpgradingComponents
     * @type {Integer (Int32)}
     */
    static UpgradingComponents => 3

    /**
     * The new resources are being installed.
     * Native name: ClusterUpgradePhaseInstallingNewComponents
     * @type {Integer (Int32)}
     */
    static InstallingNewComponents => 4

    /**
     * The upgrade is complete.
     * Native name: ClusterUpgradePhaseUpgradeComplete
     * @type {Integer (Int32)}
     */
    static UpgradeComplete => 5
}
