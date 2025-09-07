#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the settings for the DHCPv6 server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_CONFIG_INFO_V6 extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Reserved. This must to be set to 0.
     * @type {Integer}
     */
    UnicastFlag {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved. This must to be set to 0.
     * @type {Integer}
     */
    RapidCommitFlag {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Integer value that specifies the preferred lifetime for IANA addresses.
     * @type {Integer}
     */
    PreferredLifetime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Integer value that specifies the valid lifetime for IANA addresses.
     * @type {Integer}
     */
    ValidLifetime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Integer that specifies the value for time T1.
     * @type {Integer}
     */
    T1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Integer that specifies the value for time T2.
     * @type {Integer}
     */
    T2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The preferred lifetime value for a temporary IPv6 address. This is not used, and must to be set to 0.
     * @type {Integer}
     */
    PreferredLifetimeIATA {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The valid lifetime value for a temporary IPv6 address. This is not used, and must to be set to 0.
     * @type {Integer}
     */
    ValidLifetimeIATA {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * If <b>TRUE</b>, audit logs are enabled on the DHCPv6 server; if <b>FALSE</b>, they are not.
     * @type {Integer}
     */
    fAuditLog {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
