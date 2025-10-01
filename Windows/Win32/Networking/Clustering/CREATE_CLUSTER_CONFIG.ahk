#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the initial cluster configuration.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-create_cluster_config
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CREATE_CLUSTER_CONFIG extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Version. Set this to <b>CLUSAPI_VERSION</b>.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Name of the cluster.
     * @type {Pointer<Char>}
     */
    lpszClusterName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Count of nodes in the array pointed to by the <b>ppszNodeNames</b> member.
     * @type {Integer}
     */
    cNodes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Address of array of pointers to strings, each naming a node to be added to the new cluster.
     * @type {Pointer<Char>}
     */
    ppszNodeNames {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Count of nodes in the array pointed to by the <b>pIpEntries</b> member. If zero (0), no 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> or 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resources will be created.
     * @type {Integer}
     */
    cIpEntries {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Address of array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-cluster_ip_entry">CLUSTER_IP_ENTRY</a> 
     *        structures, each naming a node to be added to the new cluster. Each entry will be used to configure a separate 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> resource, and a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resource will be created which 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dependencies">depends</a> on all of these 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> resources in a logical 
     *        <b>OR</b> manner.
     * @type {Pointer<CLUSTER_IP_ENTRY>}
     */
    pIpEntries {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

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
     * @type {Integer}
     */
    fEmptyCluster {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_mgmt_point_type">CLUSTER_MGMT_POINT_TYPE</a> value that specifies the management point type. If the value of the <b>fEmptyCluster</b> member of this structure is TRUE, this member is ignored and the structure is treated as if this member were set to <b>CLUSTER_MGMT_POINT_TYPE_NONE</b>. If the <b>dwVersion</b> member of this structure is set to a value less than <b>CLUSAPI_VERSION_WINDOWSBLUE</b>, the value of this member is ignored and the structure is treated as if this member were set to <b>CLUSTER_MGMT_POINT_TYPE_CNO</b>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This member is not supported before Windows Server 2012 R2.
     * @type {Integer}
     */
    managementPointType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    managementPointResType {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Pointer<Char>}
     */
    pszUserName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Char>}
     */
    pszPassword {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Char>}
     */
    pszDomain {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
