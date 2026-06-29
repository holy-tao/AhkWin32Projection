#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The CLUSTER_ENUM_ITEM structure contains the properties of a cluster objectand is used to enumerate clusters in the ClusterEnumEx and ClusterNodeEnumEx functions.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_enum_item
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_ENUM_ITEM {
    #StructPack 8

    /**
     * The version of the <b>CLUSTER_ENUM_ITEM</b> structure.
     */
    dwVersion : UInt32

    /**
     * A bitmask that specifies the type of the cluster object.
     */
    dwType : UInt32

    /**
     * The size, in bytes, of the <b>lpszId</b> field.
     */
    cbId : UInt32

    /**
     * The ID of the cluster.
     */
    lpszId : PWSTR

    /**
     * The size, in bytes, of the <b>lpszName</b> field.
     */
    cbName : UInt32

    /**
     * The name of the cluster.
     */
    lpszName : PWSTR

}
