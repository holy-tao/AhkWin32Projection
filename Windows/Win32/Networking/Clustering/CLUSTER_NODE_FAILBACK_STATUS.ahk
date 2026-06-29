#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_NODE_FAILBACK_STATUS {
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
