#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NOTIFY_FILTER_AND_TYPE structure represents a filter for a notification port that was created by the CreateClusterNotifyPortV2 function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-notify_filter_and_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class NOTIFY_FILTER_AND_TYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_object_type">CLUSTER_OBJECT_TYPE</a> enumeration value that specifies the cluster object type for the  filter.
     * @type {Integer}
     */
    dwObjectType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_change_cluster_v2">CLUSTER_CHANGE_CLUSTER_V2</a> enumeration value that specifies the type for the filter.
     * @type {Integer}
     */
    FilterFlags {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
