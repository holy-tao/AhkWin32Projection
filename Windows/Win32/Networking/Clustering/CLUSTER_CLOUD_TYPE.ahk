#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CLOUD_TYPE {
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
    static CLUSTER_CLOUD_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_AZURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_MIXED => 128

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_UNKNOWN => -1
}
