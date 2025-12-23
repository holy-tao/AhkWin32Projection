#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_GROUP_ENUM enumeration (msclus.h) describes the type of cluster object being enumerated by the ClusterGroupEnum and ClusterGroupOpenEnum functions.
 * @remarks
 * The <b>CLUSTER_GROUP_ENUM_ALL</b> enumeration value is not a valid value for the 
 *      <i>lpdwType</i> parameter of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clustergroupenum">ClusterGroupEnum</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_GROUP_ENUM extends Win32Enum{

    /**
     * The resources in the group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_GROUP_ENUM_CONTAINS => 1

    /**
     * The nodes in the preferred owners list of the group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_GROUP_ENUM_NODES => 2

    /**
     * All the resources in the group and all the nodes in the preferred owners list of the group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_GROUP_ENUM_ALL => 3
}
