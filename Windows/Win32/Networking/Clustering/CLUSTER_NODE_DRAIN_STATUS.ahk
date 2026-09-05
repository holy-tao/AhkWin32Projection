#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NODE_DRAIN_STATUS enumeration (msclus.h) enumerates the possible values of the status of a node drain.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_node_drain_status
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NODE_DRAIN_STATUS extends Win32Enum {

    /**
     * Indicates that node draining has not started.
     * Native name: NodeDrainStatusNotInitiated
     * @type {Integer (Int32)}
     */
    static NotInitiated => 0

    /**
     * Indicates that node draining is in progress.
     * Native name: NodeDrainStatusInProgress
     * @type {Integer (Int32)}
     */
    static InProgress => 1

    /**
     * Indicates that node draining has been completed.
     * Native name: NodeDrainStatusCompleted
     * @type {Integer (Int32)}
     */
    static Completed => 2

    /**
     * Indicates that node draining has failed.
     * Native name: NodeDrainStatusFailed
     * @type {Integer (Int32)}
     */
    static Failed => 3

    /**
     * Defines the maximum number of drain statuses.
     * Native name: ClusterNodeDrainStatusCount
     * @type {Integer (Int32)}
     */
    static Count => 4
}
