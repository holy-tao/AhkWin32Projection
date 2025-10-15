#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains the settings for the DHCPv6 server.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_CONFIG_INFO_V6 extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Reserved. This must to be set to 0.
     * @type {BOOL}
     */
    UnicastFlag{
        get {
            if(!this.HasProp("__UnicastFlag"))
                this.__UnicastFlag := BOOL(this.ptr + 0)
            return this.__UnicastFlag
        }
    }

    /**
     * Reserved. This must to be set to 0.
     * @type {BOOL}
     */
    RapidCommitFlag{
        get {
            if(!this.HasProp("__RapidCommitFlag"))
                this.__RapidCommitFlag := BOOL(this.ptr + 4)
            return this.__RapidCommitFlag
        }
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
     * @type {BOOL}
     */
    fAuditLog{
        get {
            if(!this.HasProp("__fAuditLog"))
                this.__fAuditLog := BOOL(this.ptr + 32)
            return this.__fAuditLog
        }
    }
}
