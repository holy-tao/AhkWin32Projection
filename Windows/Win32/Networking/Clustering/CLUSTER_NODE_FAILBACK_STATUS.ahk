#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NODE_FAILBACK_STATUS extends Win32Enum {

    /**
     * Native name: NodeFailbackStatusNotInitiated
     * @type {Integer (Int32)}
     */
    static NotInitiated => 0

    /**
     * Native name: NodeFailbackStatusInProgress
     * @type {Integer (Int32)}
     */
    static InProgress => 1

    /**
     * Native name: NodeFailbackStatusCompleted
     * @type {Integer (Int32)}
     */
    static Completed => 2

    /**
     * Native name: NodeFailbackStatusFailed
     * @type {Integer (Int32)}
     */
    static Failed => 3

    /**
     * Native name: ClusterNodeFailbackStatusCount
     * @type {Integer (Int32)}
     */
    static Count => 4
}
