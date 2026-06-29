#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NOTIFY_FILTER_AND_TYPE structure represents a filter for a notification port that was created by the CreateClusterNotifyPortV2 function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-notify_filter_and_type
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct NOTIFY_FILTER_AND_TYPE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_object_type">CLUSTER_OBJECT_TYPE</a> enumeration value that specifies the cluster object type for the  filter.
     */
    dwObjectType : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_change_cluster_v2">CLUSTER_CHANGE_CLUSTER_V2</a> enumeration value that specifies the type for the filter.
     */
    FilterFlags : Int64

}
