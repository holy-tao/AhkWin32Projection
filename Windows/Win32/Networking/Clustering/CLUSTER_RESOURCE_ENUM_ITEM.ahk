#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The CLUSTER_RESOURCE_ENUM_ITEM structure represents the properties of a cluster resource and is used to enumerate cluster resources in the ClusterResourceEnumEx function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_resource_enum_item
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_RESOURCE_ENUM_ITEM {
    #StructPack 8

    /**
     * The version of this structure.
     */
    dwVersion : UInt32

    /**
     * The size, in bytes, of the <b>lpszId</b> field.
     */
    cbId : UInt32

    /**
     * The ID of the cluster resource.
     */
    lpszId : PWSTR

    /**
     * The size, in bytes, of the <b>IpszName</b> field.
     */
    cbName : UInt32

    /**
     * The name of the cluster resource.
     */
    lpszName : PWSTR

    /**
     * The size, in bytes, of the <b>IpszOwnerNode</b> field.
     */
    cbOwnerGroupName : UInt32

    /**
     * The name of the cluster resource that  hosts the group.
     */
    lpszOwnerGroupName : PWSTR

    /**
     * The size, in bytes, of the <b>lpszOwnerGroupId</b> field.
     */
    cbOwnerGroupId : UInt32

    /**
     * The group ID of the cluster group for the resource.
     */
    lpszOwnerGroupId : PWSTR

    /**
     * The size, in bytes, of the <b>pProperties</b> field.
     */
    cbProperties : UInt32

    /**
     * A pointer to a list of names of common properties.
     */
    pProperties : IntPtr

    /**
     * The size, in bytes, of the <b>pRoProperties</b> field.
     */
    cbRoProperties : UInt32

    /**
     * A pointer to a list of names of read-only common properties.
     */
    pRoProperties : IntPtr

}
