#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NODE_STATUS enumeration (msclus.h) describes the status of a cluster node.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_node_status
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NODE_STATUS extends Win32Enum {

    /**
     * The node status is normal.
     * Native name: NodeStatusNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The node has been isolated.
     * Native name: NodeStatusIsolated
     * @type {Integer (Int32)}
     */
    static Isolated => 1

    /**
     * The node has been quarantined.
     * Native name: NodeStatusQuarantined
     * @type {Integer (Int32)}
     */
    static Quarantined => 2

    /**
     * The node is in the process of being drained.
     * Native name: NodeStatusDrainInProgress
     * @type {Integer (Int32)}
     */
    static DrainInProgress => 4

    /**
     * The node has completed a node drain operation.
     * Native name: NodeStatusDrainCompleted
     * @type {Integer (Int32)}
     */
    static DrainCompleted => 8

    /**
     * A node drain operation failed on the node.
     * Native name: NodeStatusDrainFailed
     * @type {Integer (Int32)}
     */
    static DrainFailed => 16

    /**
     * Native name: NodeStatusAvoidPlacement
     * @type {Integer (Int32)}
     */
    static AvoidPlacement => 32

    /**
     * The node has experienced a node drain failure, and is therefore isolated and quarantined.
     * Native name: NodeStatusMax
     * @type {Integer (Int32)}
     */
    static Max => 51
}
