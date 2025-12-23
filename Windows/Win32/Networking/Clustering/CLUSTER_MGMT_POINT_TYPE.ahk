#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_MGMT_POINT_TYPE enumeration (msclus.h) specifies the type of the management point for the cluster.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_mgmt_point_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_MGMT_POINT_TYPE extends Win32Enum{

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
