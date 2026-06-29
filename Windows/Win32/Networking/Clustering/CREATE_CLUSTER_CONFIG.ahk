#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_IP_ENTRY.ahk" { CLUSTER_IP_ENTRY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\CLUSTER_MGMT_POINT_RESTYPE.ahk" { CLUSTER_MGMT_POINT_RESTYPE }
#Import ".\CLUSTER_MGMT_POINT_TYPE.ahk" { CLUSTER_MGMT_POINT_TYPE }

/**
 * Defines the initial cluster configuration.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-create_cluster_config
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CREATE_CLUSTER_CONFIG {
    #StructPack 8

    /**
     * Version. Set this to <b>CLUSAPI_VERSION</b>.
     */
    dwVersion : UInt32

    /**
     * Name of the cluster.
     */
    lpszClusterName : PWSTR

    /**
     * Count of nodes in the array pointed to by the <b>ppszNodeNames</b> member.
     */
    cNodes : UInt32

    /**
     * Address of array of pointers to strings, each naming a node to be added to the new cluster.
     */
    ppszNodeNames : PWSTR.Ptr

    /**
     * Count of nodes in the array pointed to by the <b>pIpEntries</b> member. If zero (0), no 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> or 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resources will be created.
     */
    cIpEntries : UInt32

    /**
     * Address of array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-cluster_ip_entry">CLUSTER_IP_ENTRY</a> 
     *        structures, each naming a node to be added to the new cluster. Each entry will be used to configure a separate 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> resource, and a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resource will be created which 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dependencies">depends</a> on all of these 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> resources in a logical 
     *        <b>OR</b> manner.
     */
    pIpEntries : CLUSTER_IP_ENTRY.Ptr

    /**
     * If <b>TRUE</b>, then the cluster is to be created without any nodes and the 
     *        <b>cIpEntries</b> member must be zero (0) and the <b>pIpEntries</b> 
     *        member must be <b>NULL</b>.
     * 
     * If <b>FALSE</b>, then the cluster is to be created with at least one node and the 
     *        <b>cIpEntries</b> member must be one (1) or more, the 
     *        <b>pIpEntries</b> member must not be <b>NULL</b>, the 
     *        <b>cNodes</b> member must be one (1) or more, the <b>ppszNodeNames</b> 
     *        member must not be <b>NULL</b>, and the <b>lpszClusterName</b> member 
     *        must not be <b>NULL</b>.
     */
    fEmptyCluster : BOOLEAN

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_mgmt_point_type">CLUSTER_MGMT_POINT_TYPE</a> value that specifies the management point type. If the value of the <b>fEmptyCluster</b> member of this structure is TRUE, this member is ignored and the structure is treated as if this member were set to <b>CLUSTER_MGMT_POINT_TYPE_NONE</b>. If the <b>dwVersion</b> member of this structure is set to a value less than <b>CLUSAPI_VERSION_WINDOWSBLUE</b>, the value of this member is ignored and the structure is treated as if this member were set to <b>CLUSTER_MGMT_POINT_TYPE_CNO</b>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This member is not supported before Windows Server 2012 R2.
     */
    managementPointType : CLUSTER_MGMT_POINT_TYPE

    managementPointResType : CLUSTER_MGMT_POINT_RESTYPE

    pszUserName : PWSTR

    pszPassword : PWSTR

    pszDomain : PWSTR

}
