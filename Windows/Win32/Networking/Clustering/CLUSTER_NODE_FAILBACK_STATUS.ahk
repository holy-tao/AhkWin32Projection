#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NODE_FAILBACK_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NodeFailbackStatusNotInitiated => 0

    /**
     * @type {Integer (Int32)}
     */
    static NodeFailbackStatusInProgress => 1

    /**
     * @type {Integer (Int32)}
     */
    static NodeFailbackStatusCompleted => 2

    /**
     * @type {Integer (Int32)}
     */
    static NodeFailbackStatusFailed => 3

    /**
     * @type {Integer (Int32)}
     */
    static ClusterNodeFailbackStatusCount => 4
}
