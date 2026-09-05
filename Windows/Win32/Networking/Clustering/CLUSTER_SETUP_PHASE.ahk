#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the ClusterSetupProgressCallback function to identify the current phase of the cluster setup process.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_setup_phase
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SETUP_PHASE extends Win32Enum {

    /**
     * Initialize cluster setup.
     * Native name: ClusterSetupPhaseInitialize
     * @type {Integer (Int32)}
     */
    static Initialize => 1

    /**
     * Validate cluster nodes.
     * Native name: ClusterSetupPhaseValidateNodeState
     * @type {Integer (Int32)}
     */
    static ValidateNodeState => 100

    /**
     * Validate cluster networks.
     * Native name: ClusterSetupPhaseValidateNetft
     * @type {Integer (Int32)}
     */
    static ValidateNetft => 102

    /**
     * Validate cluster disks.
     * Native name: ClusterSetupPhaseValidateClusDisk
     * @type {Integer (Int32)}
     */
    static ValidateClusDisk => 103

    /**
     * Configure cluster service.
     * Native name: ClusterSetupPhaseConfigureClusSvc
     * @type {Integer (Int32)}
     */
    static ConfigureClusSvc => 104

    /**
     * Start  cluster service.
     * Native name: ClusterSetupPhaseStartingClusSvc
     * @type {Integer (Int32)}
     */
    static StartingClusSvc => 105

    /**
     * Query cluster name.
     * Native name: ClusterSetupPhaseQueryClusterNameAccount
     * @type {Integer (Int32)}
     */
    static QueryClusterNameAccount => 106

    /**
     * Validate cluster name.
     * Native name: ClusterSetupPhaseValidateClusterNameAccount
     * @type {Integer (Int32)}
     */
    static ValidateClusterNameAccount => 107

    /**
     * Create cluster account.
     * Native name: ClusterSetupPhaseCreateClusterAccount
     * @type {Integer (Int32)}
     */
    static CreateClusterAccount => 108

    /**
     * Configure cluster account.
     * Native name: ClusterSetupPhaseConfigureClusterAccount
     * @type {Integer (Int32)}
     */
    static ConfigureClusterAccount => 109

    /**
     * Form the cluster.
     * Native name: ClusterSetupPhaseFormingCluster
     * @type {Integer (Int32)}
     */
    static FormingCluster => 200

    /**
     * Add properties to cluster.
     * Native name: ClusterSetupPhaseAddClusterProperties
     * @type {Integer (Int32)}
     */
    static AddClusterProperties => 201

    /**
     * Create resource types.
     * Native name: ClusterSetupPhaseCreateResourceTypes
     * @type {Integer (Int32)}
     */
    static CreateResourceTypes => 202

    /**
     * Create resource groups.
     * Native name: ClusterSetupPhaseCreateGroups
     * @type {Integer (Int32)}
     */
    static CreateGroups => 203

    /**
     * Create IP address resources.
     * Native name: ClusterSetupPhaseCreateIPAddressResources
     * @type {Integer (Int32)}
     */
    static CreateIPAddressResources => 204

    /**
     * Create network name.
     * Native name: ClusterSetupPhaseCreateNetworkName
     * @type {Integer (Int32)}
     */
    static CreateNetworkName => 205

    /**
     * Bring cluster groups online.
     * Native name: ClusterSetupPhaseClusterGroupOnline
     * @type {Integer (Int32)}
     */
    static ClusterGroupOnline => 206

    /**
     * Get current cluster membership.
     * Native name: ClusterSetupPhaseGettingCurrentMembership
     * @type {Integer (Int32)}
     */
    static GettingCurrentMembership => 300

    /**
     * Add node to cluster membership.
     * Native name: ClusterSetupPhaseAddNodeToCluster
     * @type {Integer (Int32)}
     */
    static AddNodeToCluster => 301

    /**
     * Start node.
     * Native name: ClusterSetupPhaseNodeUp
     * @type {Integer (Int32)}
     */
    static NodeUp => 302

    /**
     * Native name: ClusterSetupPhaseApplyNetworkATCIntents
     * @type {Integer (Int32)}
     */
    static ApplyNetworkATCIntents => 303

    /**
     * Move group to another node.
     * Native name: ClusterSetupPhaseMoveGroup
     * @type {Integer (Int32)}
     */
    static MoveGroup => 400

    /**
     * Delete group from cluster.
     * Native name: ClusterSetupPhaseDeleteGroup
     * @type {Integer (Int32)}
     */
    static DeleteGroup => 401

    /**
     * Clean up offline group.
     * Native name: ClusterSetupPhaseCleanupCOs
     * @type {Integer (Int32)}
     */
    static CleanupCOs => 402

    /**
     * Move group offline.
     * Native name: ClusterSetupPhaseOfflineGroup
     * @type {Integer (Int32)}
     */
    static OfflineGroup => 403

    /**
     * Remove a node from the cluster.
     * Native name: ClusterSetupPhaseEvictNode
     * @type {Integer (Int32)}
     */
    static EvictNode => 404

    /**
     * Return node to pre-clustered state.
     * Native name: ClusterSetupPhaseCleanupNode
     * @type {Integer (Int32)}
     */
    static CleanupNode => 405

    /**
     * Return core resource group to pre-clustered state.
     * Native name: ClusterSetupPhaseCoreGroupCleanup
     * @type {Integer (Int32)}
     */
    static CoreGroupCleanup => 406

    /**
     * Native name: ClusterSetupPhaseRepairCNOAccount
     * @type {Integer (Int32)}
     */
    static RepairCNOAccount => 500

    /**
     * Native name: ClusterSetupPhaseRepairDNSPermissions
     * @type {Integer (Int32)}
     */
    static RepairDNSPermissions => 501

    /**
     * Return failed resource to pre-clustered state.
     * Native name: ClusterSetupPhaseFailureCleanup
     * @type {Integer (Int32)}
     */
    static FailureCleanup => 999
}
