#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSGROUP_TYPE.ahk" { CLUSGROUP_TYPE }

/**
 * The CLUSTER_CREATE_GROUP_INFO structure allows the caller to provide additional properties when creating a new group.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_create_group_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CREATE_GROUP_INFO {
    #StructPack 4

    /**
     * The version of the <b>CLUSTER_CREATE_GROUP_INFO</b>.  Currently this is set to (<b>CLUSTER_CREATE_GROUP_INFO_VERSION_1</b> (0x00000001).
     */
    dwVersion : UInt32

    /**
     * The type of the cluster group that will be created.
     */
    groupType : CLUSGROUP_TYPE

}
