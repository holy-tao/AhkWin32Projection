#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCOPE_MIB_INFO_V6.ahk" { SCOPE_MIB_INFO_V6 }
#Import ".\DATE_TIME.ahk" { DATE_TIME }

/**
 * Contains statistics for the DHCPv6 server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_mib_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_MIB_INFO_V6 {
    #StructPack 8

    /**
     * Integer value that specifies the number of DHCPSOLICIT messages received by the DHCPv6 server from DHCPv6 clients.
     */
    Solicits : UInt32

    /**
     * Integer value that specifies the number of DHCPADVERTISE messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Advertises : UInt32

    /**
     * Integer value that specifies the number of DHCPREQUEST messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Requests : UInt32

    /**
     * Integer value that specifies the number of DHCPRENEW messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Renews : UInt32

    /**
     * Integer value that specifies the number of DHCPREBIND messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Rebinds : UInt32

    /**
     * Integer value that specifies the number of DHCPREPLY messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Replies : UInt32

    /**
     * Integer value that specifies the number of DHCPCONFIRM messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Confirms : UInt32

    /**
     * Integer value that specifies the number of DHCPDECLINE messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Declines : UInt32

    /**
     * Integer value that specifies the number of DHCPRELEASE messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Releases : UInt32

    /**
     * Integer value that specifies the number of DHCPINFORM messages sent by DHCPv6 server to DHCPv6 clients.
     */
    Informs : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> value that specifies the time the DHCPv6 server was started.
     */
    ServerStartTime : DATE_TIME

    /**
     * Integer value that contains the number of IPv6 scopes configured on the current DHCPv6 server. This member defines the number of DHCPv6 scopes in the subsequent member <b>ScopeInfo</b>.
     */
    Scopes : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-scope_mib_info">SCOPE_MIB_INFO</a> structures that contain statistics on individual scopes defined on the DHCPv6 server.
     */
    ScopeInfo : SCOPE_MIB_INFO_V6.Ptr

}
