#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATE_TIME.ahk

/**
 * Contains statistics for the DHCPv6 server.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_mib_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_MIB_INFO_V6 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Integer value that specifies the number of DHCPSOLICIT messages received by the DHCPv6 server from DHCPv6 clients.
     * @type {Integer}
     */
    Solicits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Integer value that specifies the number of DHCPADVERTISE messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Advertises {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Integer value that specifies the number of DHCPREQUEST messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Requests {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Integer value that specifies the number of DHCPRENEW messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Renews {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Integer value that specifies the number of DHCPREBIND messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Rebinds {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Integer value that specifies the number of DHCPREPLY messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Replies {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Integer value that specifies the number of DHCPCONFIRM messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Confirms {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Integer value that specifies the number of DHCPDECLINE messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Declines {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Integer value that specifies the number of DHCPRELEASE messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Releases {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Integer value that specifies the number of DHCPINFORM messages sent by DHCPv6 server to DHCPv6 clients.
     * @type {Integer}
     */
    Informs {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> value that specifies the time the DHCPv6 server was started.
     * @type {DATE_TIME}
     */
    ServerStartTime{
        get {
            if(!this.HasProp("__ServerStartTime"))
                this.__ServerStartTime := DATE_TIME(40, this)
            return this.__ServerStartTime
        }
    }

    /**
     * Integer value that contains the number of IPv6 scopes configured on the current DHCPv6 server. This member defines the number of DHCPv6 scopes in the subsequent member <b>ScopeInfo</b>.
     * @type {Integer}
     */
    Scopes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-scope_mib_info">SCOPE_MIB_INFO</a> structures that contain statistics on individual scopes defined on the DHCPv6 server.
     * @type {Pointer<SCOPE_MIB_INFO_V6>}
     */
    ScopeInfo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
