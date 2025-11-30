#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the possible values of the status of a node drain.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_node_drain_status
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NODE_DRAIN_STATUS extends Win32Enum{

    /**
     * Indicates that node draining has not started.
     * @type {Integer (Int32)}
     */
    static NodeDrainStatusNotInitiated => 0

    /**
     * Indicates that node draining is in progress.
     * @type {Integer (Int32)}
     */
    static NodeDrainStatusInProgress => 1

    /**
     * Indicates that node draining has been completed.
     * @type {Integer (Int32)}
     */
    static NodeDrainStatusCompleted => 2

    /**
     * Indicates that node draining has failed.
     * @type {Integer (Int32)}
     */
    static NodeDrainStatusFailed => 3

    /**
     * Defines the maximum number of drain statuses.
     * @type {Integer (Int32)}
     */
    static ClusterNodeDrainStatusCount => 4
}
