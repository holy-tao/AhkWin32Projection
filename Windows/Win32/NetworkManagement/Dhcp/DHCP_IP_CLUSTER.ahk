#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_IP_CLUSTER structure defines the address and mast for a network cluster.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_cluster
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_CLUSTER {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the cluster.
     */
    ClusterAddress : UInt32

    /**
     * Specifies the mask value for a cluster. This value should be set to  0xFFFFFFFF if the cluster is full.
     */
    ClusterMask : UInt32

}
