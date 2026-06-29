#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_NODE_STATUS enumeration (msclus.h) describes the status of a cluster node.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_node_status
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_NODE_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The node status is normal.
     * @type {Integer (Int32)}
     */
    static NodeStatusNormal => 0

    /**
     * The node has been isolated.
     * @type {Integer (Int32)}
     */
    static NodeStatusIsolated => 1

    /**
     * The node has been quarantined.
     * @type {Integer (Int32)}
     */
    static NodeStatusQuarantined => 2

    /**
     * The node is in the process of being drained.
     * @type {Integer (Int32)}
     */
    static NodeStatusDrainInProgress => 4

    /**
     * The node has completed a node drain operation.
     * @type {Integer (Int32)}
     */
    static NodeStatusDrainCompleted => 8

    /**
     * A node drain operation failed on the node.
     * @type {Integer (Int32)}
     */
    static NodeStatusDrainFailed => 16

    /**
     * @type {Integer (Int32)}
     */
    static NodeStatusAvoidPlacement => 32

    /**
     * The node has experienced a node drain failure, and is therefore isolated and quarantined.
     * @type {Integer (Int32)}
     */
    static NodeStatusMax => 51
}
