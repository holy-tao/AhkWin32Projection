#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the ClusterSetupProgressCallback function to identify the current phase of the cluster setup process.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_setup_phase
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SETUP_PHASE extends Win32Enum{

    /**
     * Initialize cluster setup.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseInitialize => 1

    /**
     * Validate cluster nodes.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseValidateNodeState => 100

    /**
     * Validate cluster networks.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseValidateNetft => 102

    /**
     * Validate cluster disks.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseValidateClusDisk => 103

    /**
     * Configure cluster service.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseConfigureClusSvc => 104

    /**
     * Start  cluster service.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseStartingClusSvc => 105

    /**
     * Query cluster name.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseQueryClusterNameAccount => 106

    /**
     * Validate cluster name.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseValidateClusterNameAccount => 107

    /**
     * Create cluster account.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCreateClusterAccount => 108

    /**
     * Configure cluster account.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseConfigureClusterAccount => 109

    /**
     * Form the cluster.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseFormingCluster => 200

    /**
     * Add properties to cluster.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseAddClusterProperties => 201

    /**
     * Create resource types.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCreateResourceTypes => 202

    /**
     * Create resource groups.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCreateGroups => 203

    /**
     * Create IP address resources.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCreateIPAddressResources => 204

    /**
     * Create network name.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCreateNetworkName => 205

    /**
     * Bring cluster groups online.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseClusterGroupOnline => 206

    /**
     * Get current cluster membership.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseGettingCurrentMembership => 300

    /**
     * Add node to cluster membership.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseAddNodeToCluster => 301

    /**
     * Start node.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseNodeUp => 302

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseApplyNetworkATCIntents => 303

    /**
     * Move group to another node.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseMoveGroup => 400

    /**
     * Delete group from cluster.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseDeleteGroup => 401

    /**
     * Clean up offline group.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCleanupCOs => 402

    /**
     * Move group offline.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseOfflineGroup => 403

    /**
     * Remove a node from the cluster.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseEvictNode => 404

    /**
     * Return node to pre-clustered state.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCleanupNode => 405

    /**
     * Return core resource group to pre-clustered state.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseCoreGroupCleanup => 406

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseRepairCNOAccount => 500

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseRepairDNSPermissions => 501

    /**
     * Return failed resource to pre-clustered state.
     * @type {Integer (Int32)}
     */
    static ClusterSetupPhaseFailureCleanup => 999
}
