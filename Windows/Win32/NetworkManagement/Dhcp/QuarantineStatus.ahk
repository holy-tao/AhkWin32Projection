#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The QuarantineStatus enumeration specifies possible health status values for the DHCPv4 client, as validated at the NAP server.
 * @remarks
 * 
 * The <b>QuarantineStatus</b> enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_filter_status_info">DHCP_CLIENT_FILTER_STATUS_INFO</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_vq">DHCP_CLIENT_INFO_VQ</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb">DHCP_CLIENT_INFO_PB</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info">DHCPV4_FAILOVER_CLIENT_INFO</a> structures.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-quarantinestatus
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class QuarantineStatus extends Win32Enum{

    /**
     * The DHCP client is compliant with the health policies defined by the administrator and has normal access to the network.
     * @type {Integer (Int32)}
     */
    static NOQUARANTINE => 0

    /**
     * The DHCP client is not compliant with the health policies defined by the administrator and is being quarantined with restricted access to the network.
     * @type {Integer (Int32)}
     */
    static RESTRICTEDACCESS => 1

    /**
     * The DHCP client is not compliant with the health policies defined by the administrator and is being denied access to the network. The DHCP server does not grant an IP address lease to this client.
     * @type {Integer (Int32)}
     */
    static DROPPACKET => 2

    /**
     * The DHCP client is not compliant with the health policies defined by the administrator and is being granted normal access to the network for a limited time.
     * @type {Integer (Int32)}
     */
    static PROBATION => 3

    /**
     * The DHCP client is exempt from compliance with the health policies defined by the administrator and is granted normal access to the network.
     * @type {Integer (Int32)}
     */
    static EXEMPT => 4

    /**
     * The DHCP client is put into the default quarantine state configured on the DHCP NAP server. When a network policy server (NPS) is unavailable, the DHCP client can be put in any of the states NOQUARANTINE, RESTRICTEDACCESS, or DROPPACKET, depending on the default setting on the DHCP NAP server.
     * @type {Integer (Int32)}
     */
    static DEFAULTQUARSETTING => 5

    /**
     * No quarantine.
     * @type {Integer (Int32)}
     */
    static NOQUARINFO => 6
}
