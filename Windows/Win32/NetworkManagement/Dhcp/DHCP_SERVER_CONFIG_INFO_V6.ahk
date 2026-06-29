#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the settings for the DHCPv6 server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SERVER_CONFIG_INFO_V6 {
    #StructPack 4

    /**
     * Reserved. This must to be set to 0.
     */
    UnicastFlag : BOOL

    /**
     * Reserved. This must to be set to 0.
     */
    RapidCommitFlag : BOOL

    /**
     * Integer value that specifies the preferred lifetime for IANA addresses.
     */
    PreferredLifetime : UInt32

    /**
     * Integer value that specifies the valid lifetime for IANA addresses.
     */
    ValidLifetime : UInt32

    /**
     * Integer that specifies the value for time T1.
     */
    T1 : UInt32

    /**
     * Integer that specifies the value for time T2.
     */
    T2 : UInt32

    /**
     * The preferred lifetime value for a temporary IPv6 address. This is not used, and must to be set to 0.
     */
    PreferredLifetimeIATA : UInt32

    /**
     * The valid lifetime value for a temporary IPv6 address. This is not used, and must to be set to 0.
     */
    ValidLifetimeIATA : UInt32

    /**
     * If <b>TRUE</b>, audit logs are enabled on the DHCPv6 server; if <b>FALSE</b>, they are not.
     */
    fAuditLog : BOOL

}
