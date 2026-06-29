#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_GROUP_ENUM enumeration (msclus.h) describes the type of cluster object being enumerated by the ClusterGroupEnum and ClusterGroupOpenEnum functions.
 * @remarks
 * The <b>CLUSTER_GROUP_ENUM_ALL</b> enumeration value is not a valid value for the 
 *      <i>lpdwType</i> parameter of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clustergroupenum">ClusterGroupEnum</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_GROUP_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
