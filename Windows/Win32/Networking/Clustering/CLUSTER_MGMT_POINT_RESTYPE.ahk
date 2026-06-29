#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_MGMT_POINT_RESTYPE {
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
    static CLUSTER_MGMT_POINT_RESTYPE_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_RESTYPE_SNN => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_RESTYPE_DNN => 2
}
