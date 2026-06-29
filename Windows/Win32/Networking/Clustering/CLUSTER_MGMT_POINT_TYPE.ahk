#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_MGMT_POINT_TYPE enumeration (msclus.h) specifies the type of the management point for the cluster.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_mgmt_point_type
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_MGMT_POINT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The cluster has no management point.
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_TYPE_NONE => 0

    /**
     * The management point is a cluster name object.
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_TYPE_CNO => 1

    /**
     * The management point is DNS only.
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_TYPE_DNS_ONLY => 2

    /**
     * The management point type is cluster name object (CNO) only.
     * 
     * <b>Windows Server 2012 R2:  </b>This value is not supported before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_TYPE_CNO_ONLY => 3
}
