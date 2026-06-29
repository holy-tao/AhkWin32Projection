#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Describes an IP address for a cluster.
 * @remarks
 * To specify a DHCP address, use the network identifier (all bits in the subnet set to 0) and the subnet prefix 
 *     length. For example, if the DHCP server hands out addresses in the 192.168.1.0/24 address block (from 192.168.1.0 
 *     through 192.168.1.255), specify "192.168.1.0" for the <b>lpszIpAddress</b> 
 *     member and 24 for the <b>dwPrefixLength</b> member.
 * 
 * A pointer to an array of <b>CLUSTER_IP_ENTRY</b> 
 *     structures is passed in the <b>pIpEntries</b> member of the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-create_cluster_config">CREATE_CLUSTER_CONFIG</a> structure, which is in turn 
 *     passed as the <i>pConfig</i> parameter of the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createcluster">CreateCluster</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_ip_entry
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_IP_ENTRY {
    #StructPack 8

    /**
     * A <b>NULL</b>-terminated Unicode string containing a valid IPv4 or IPv6 numeric network 
     *       address.
     */
    lpszIpAddress : PWSTR

    /**
     * Specifies the number of bits in the subnet mask, for example 24 for an IPv4 netmask of 255.255.255.0.
     */
    dwPrefixLength : UInt32

}
