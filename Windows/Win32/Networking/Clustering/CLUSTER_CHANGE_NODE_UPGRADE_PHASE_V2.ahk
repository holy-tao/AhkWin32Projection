#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 enumeration (msclus.h) defines the notifications that are generated for the upgrade of a cluster node.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_node_upgrade_phase_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the upgrade is being prepared.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_NODE_PREPARE => 1

    /**
     * Indicates that the upgrade is in progress.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_NODE_COMMIT => 2

    /**
     * Indicates that the upgrade is finished.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_NODE_POSTCOMMIT => 4

    /**
     * Indicates all <b>CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2</b> notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_ALL => 7
}
