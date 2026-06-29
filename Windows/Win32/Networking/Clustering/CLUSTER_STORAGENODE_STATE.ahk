#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_STORAGENODE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
