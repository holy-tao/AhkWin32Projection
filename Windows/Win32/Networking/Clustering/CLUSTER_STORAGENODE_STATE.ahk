#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_STORAGENODE_STATE extends Win32Enum {

    /**
     * Native name: ClusterStorageNodeStateUnknown
     * @type {Integer (Int32)}
     */
    static StorageNodeStateUnknown => 0

    /**
     * Native name: ClusterStorageNodeUp
     * @type {Integer (Int32)}
     */
    static StorageNodeUp => 1

    /**
     * Native name: ClusterStorageNodeDown
     * @type {Integer (Int32)}
     */
    static StorageNodeDown => 2

    /**
     * Native name: ClusterStorageNodePaused
     * @type {Integer (Int32)}
     */
    static StorageNodePaused => 3

    /**
     * Native name: ClusterStorageNodeStarting
     * @type {Integer (Int32)}
     */
    static StorageNodeStarting => 4

    /**
     * Native name: ClusterStorageNodeStopping
     * @type {Integer (Int32)}
     */
    static StorageNodeStopping => 5
}
