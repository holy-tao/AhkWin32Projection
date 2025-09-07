#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a pointer to a DNS server property. The type of the property depends on the value of [DNS_SERVER_PROPERTY::Type](/windows/win32/api/netioapi/ns-netioapi-dns_server_property).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-dns_server_property_types
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_SERVER_PROPERTY_TYPES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * If [DNS_SERVER_PROPERTY::Type](ns-netioapi-dns_server_property.md) is set to *DnsServerDohProperty*, then *DohSettings* points to a valid DNS-over-HTTPS server property.
     * @type {Pointer<DNS_DOH_SERVER_SETTINGS>}
     */
    DohSettings {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
