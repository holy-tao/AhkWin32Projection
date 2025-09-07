#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Describes a DNS-over-HTTPS server.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-dns_doh_server_settings
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_DOH_SERVER_SETTINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A NULL-terminated wide string containing a valid DNS-over-HTTPS URI template.
     * 
     * This field must be NULL if the **DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO** flag is present.
     * 
     * > [!IMPORTANT]
     * > The URI template mustn't contain an IP address as hostname that's different from the IP address of the referenced server. For example, if the referenced server is 1.1.1.1, and the URI template is `https://1.0.0.1/dns-query`, then that wouldn't be valid because 1.0.0.1 doesn't match the server IP 1.1.1.1.
     * @type {PWSTR}
     */
    Template{
        get {
            if(!this.HasProp("__Template"))
                this.__Template := PWSTR(this.ptr + 0)
            return this.__Template
        }
    }

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * A bitmap containing any of the following options.
     * 
     * **DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO** (0x0001). If this option is present, then the DNS server that's referenced by this property will load its URI template from the system DNS-over-HTTPS system list. When this option is present, the *Template* field must be set to NULL. This option must not be used together with the **DNS_DOH_SERVER_SETTINGS_ENABLE** option.
     * 
     * **DNS_DOH_SERVER_SETTINGS_ENABLE** (0x0002). If this option is present, then the *Template* field must point to a valid DNS-over-HTTPS URI template. This option must not be used together with the **DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO** option.
     * 
     * **DNS_DOH_SERVER_SETTINGS_FALLBACK_TO_UDP** (0x0004). This option indicates that the referenced server may fallback to unsecure name resolution (UDP/TCP) if the DNS-over-HTTPS query failed. This option can be used only in addition to **DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO** or **DNS_DOH_SERVER_SETTINGS_ENABLE**.
     * 
     * **DNS_DOH_AUTO_UPGRADE_SERVER** (0x0008). This option allows a DNS server present in an NRPT rule to use the DNS-over-HTTPS template if it has the same IP address as the server referenced by this property. This option can't be used by itself; it must be in addition to **DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO** or **DNS_DOH_SERVER_SETTINGS_ENABLE**.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
