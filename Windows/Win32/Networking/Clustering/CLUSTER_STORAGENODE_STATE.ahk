#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_STORAGENODE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ClusterStorageNodeStateUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClusterStorageNodeUp => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClusterStorageNodeDown => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClusterStorageNodePaused => 3

    /**
     * @type {Integer (Int32)}
     */
    static ClusterStorageNodeStarting => 4

    /**
     * @type {Integer (Int32)}
     */
    static ClusterStorageNodeStopping => 5
}
