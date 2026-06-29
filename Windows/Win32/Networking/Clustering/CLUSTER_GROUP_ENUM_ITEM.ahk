#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_GROUP_STATE.ahk" { CLUSTER_GROUP_STATE }

/**
 * The CLUSTER_GROUP_ENUM_ITEM structure contains the properties of a cluster group. (CLUSTER_GROUP_ENUM_ITEM)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_group_enum_item
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_GROUP_ENUM_ITEM {
    #StructPack 8

    /**
     * The version of the 
     *       <b>CLUSTER_GROUP_ENUM_ITEM</b> structure.
     */
    dwVersion : UInt32

    /**
     * The size, in bytes, of the <b>lpszId</b> field.
     */
    cbId : UInt32

    /**
     * The Id of the cluster group.
     */
    lpszId : PWSTR

    /**
     * The size, in bytes, of the <b>IpszName</b> field.
     */
    cbName : UInt32

    /**
     * The name of the cluster group.
     */
    lpszName : PWSTR

    /**
     * The current state of the cluster group.
     */
    state : CLUSTER_GROUP_STATE

    /**
     * The size, in bytes, of the <b>IpszOwnerNode</b> field.
     */
    cbOwnerNode : UInt32

    /**
     * The name of the cluster node hosting the group.
     */
    lpszOwnerNode : PWSTR

    /**
     * The group flags.
     */
    dwFlags : UInt32

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
