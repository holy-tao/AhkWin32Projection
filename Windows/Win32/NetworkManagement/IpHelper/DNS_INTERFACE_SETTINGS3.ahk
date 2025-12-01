#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the DNS settings that can be configured on a given interface by calling the [**SetInterfaceDnsSettings**](/windows/win32/api/netioapi/nf-netioapi-setinterfacednssettings) function. (DNS_INTERFACE_SETTINGS3)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_INTERFACE_SETTINGS3 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be set to **DNS_INTERFACE_SETTINGS_VERSION3**.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * A bitmap of the following options.
     *  
     * **DNS_SETTING_IPV6** (0x0001). Configures the interface settings only for the IPv6 networking stack. If this option is set, then any IP addresses specified in the *NameServer* or *ProfileNameServer* members must be IPv6 addresses. By default, the DNS interface settings specified in this structure are applied only to the IPv4 networking stack.
     * 
     * **DNS_SETTING_NAMESERVER** (0x0002). Configures static adapter DNS servers on the specified interface via the *NameServer* member.
     * 
     * **DNS_SETTING_SEARCHLIST** (0x0004). Configures the connection-specific DNS suffix search list for the given adapter via the *SearchList* member. 
     * 
     * **DNS_SETTING_REGISTRATION_ENABLED** (0x0008). Enables or disables the dynamic DNS registration for the given adapter. This is system-enabled by default.
     * 
     * **DNS_SETTING_DOMAIN** (0x0020). Configures the connection-specific DNS suffix for the given adapter via the *Domain* member.
     * 
     * **DNS_SETTINGS_ENABLE_LLMNR** (0x0080). Enables or disables name resolution using LLMNR and mDNS on the specified adapter. This is system-enabled by default.
     * 
     * **DNS_SETTINGS_QUERY_ADAPTER_NAME** (0x0100). Enables or disables the use of the adapter name as a suffix for DNS queries. This is system-enabled by default.
     * 
     * **DNS_SETTING_PROFILE_NAMESERVER** (0x0200). Configures static profile DNS servers on the specified interface via the *ProfileNameServer* member.
     * 
     * **DNS_SETTING_DOH** (0x1000). Configures DNS-over-HTTPS settings on the specified adapter via the *cServerProperties* and *ServerProperties* members. If this option is set, then the *NameServer* member must point to a valid string containing a series of space- or comma-separated DNS servers.
     *  
     * **DNS_SETTING_DOH_PROFILE** (0x2000). Configures profile DNS-over-HTTPS settings on the specified adapter via the *cProfileServerProperties* and *ProfileServerProperties* members. If this option is set, then the *ProfileNameServer* member must point to a valid string containing a series of space- or comma-separated DNS servers.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A NULL-terminated wide string containing the adapter domain name.
     * @type {PWSTR}
     */
    Domain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A NULL-terminated wide string containing a series of comma- or space-separated DNS servers. For example, L"1.1.1.1 8.8.8.8", or L"1.1.1.1,8.8.8.8".
     *  
     * If the **DNS_SETTING_IPV6** flag is present, then the servers must be IPv6 addresses. For example, L"2606:4700:4700::1001,2606:4700:4700::1111".
     * @type {PWSTR}
     */
    NameServer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A NULL-terminated wide string containing a series of comma- or space-separated search names. For example, L"contoso1.com contoso2.com", or L"contoso1.com, contoso2.com".
     * @type {PWSTR}
     */
    SearchList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** to enable adapter dynamic registration; **FALSE** to disable it.
     * @type {Integer}
     */
    RegistrationEnabled {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** to enable adapter name registration; **FALSE** to disable it.
     * @type {Integer}
     */
    RegisterAdapterName {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** to enable mDNS and LLMNR on the given interface; **FALSE** to disable them.
     * @type {Integer}
     */
    EnableLLMNR {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** if the adapter name should be used as a search suffix; otherwise **FALSE**.
     * @type {Integer}
     */
    QueryAdapterName {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A NULL-terminated wide string containing a series of comma- or space-separated DNS servers. For example, L"1.1.1.1 8.8.8.8" or L"1.1.1.1,8.8.8.8".
     *  
     * If the **DNS_SETTING_IPV6** flag is present, then the servers must be IPv6 addresses. For example, L"2606:4700:4700::1001,2606:4700:4700::1111".
     * @type {PWSTR}
     */
    ProfileNameServer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Reserved.
     * @type {Integer}
     */
    DisableUnconstrainedQueries {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * Reserved.
     * @type {PWSTR}
     */
    SupplementalSearchList {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of server properties specified in the *ServerProperties* member. If this is equal to 0, then the "ServerProperties" member must be NULL.
     * @type {Integer}
     */
    cServerProperties {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: **[DNS_SERVER_PROPERTY](ns-netioapi-dns_server_property.md)\***
     * 
     * An array of **DNS_SERVER_PROPERTY** structures, containing *cServerProperties* elements. If *cServerProperties* is 0, then this must be NULL.
     * 
     * Only DNS-over-HTTPS properties are supported, with the additional restriction of at most 1 property for each server specified in the *NameServer* member.
     *  
     * The **DNS_SERVER_PROPERTY::Version** member must be set to **DNS_SERVER_PROPERTY_VERSION1**, **::Type** must be set to **DNS_SERVER_PROPERTY_TYPE::DnsServerDohProperty**, and the **Property.DohSettings** must point to a valid [**DNS_DOH_SERVER_SETTINGS**](ns-netioapi-dns_doh_server_settings.md) object.
     *  
     * The *ServerIndex* member of the **DNS_SERVER_PROPERTY** must be set to the index of the corresponding DNS server from the *NameServer* member.
     *  
     * For example, if the *NameServer* member is set to L"1.1.1.1, 8.8.8.8, 9.9.9.9", then a property for the server 1.1.1.1 would have the *ServerIndex* member set to 0. Similarly, 8.8.8.8 would require *ServerIndex* set to 1, and 9.9.9.9 would require the *ServerIndex* member set to 2.
     * @type {Pointer<DNS_SERVER_PROPERTY>}
     */
    ServerProperties {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of server properties specified in the *ProfileServerProperties* member. If this is equal to 0, then the *ProfileServerProperties* member must be NULL.
     * @type {Integer}
     */
    cProfileServerProperties {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: **[DNS_SERVER_PROPERTY](ns-netioapi-dns_server_property.md)\***
     * 
     * An array of **DNS_SERVER_PROPERTY** structures, containing *cProfileServerProperties* elements. If *cProfileServerProperties* is 0, then this must be NULL.
     * 
     * Only DNS-over-HTTPS properties are supported, with the additional restriction of at most 1 property for each server specified in the *ProfileNameServer* member.
     * 
     * The **DNS_SERVER_PROPERTY::Version** member must be set to **DNS_SERVER_PROPERTY_VERSION1**, **::Type** must be set to **DNS_SERVER_PROPERTY_TYPE::DnsServerDohProperty** and the **Property.DohSettings** must point to a valid [**DNS_DOH_SERVER_SETTINGS**](ns-netioapi-dns_doh_server_settings.md) object.
     * 
     * The *ServerIndex* member of the **DNS_SERVER_PROPERTY** must be set to the index of the corresponding DNS server from the *ProfileNameServer* member.
     * 
     * For example, if the *ProfileNameServer* member is set to L"1.1.1.1, 8.8.8.8, 9.9.9.9", then a property for the server 1.1.1.1 would have the *ServerIndex* member set to 0. Similarly, 8.8.8.8 would require *ServerIndex* set to 1, and 9.9.9.9 would require the *ServerIndex* member set to 2.
     * @type {Pointer<DNS_SERVER_PROPERTY>}
     */
    ProfileServerProperties {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
