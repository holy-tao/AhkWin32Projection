#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the validity of the property held in the [DNS_SERVER_PROPERTY::Property](/windows/win32/api/netioapi/ns-netioapi-dns_server_property) member.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ne-netioapi-dns_server_property_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_SERVER_PROPERTY_TYPE{

    /**
     * Specifies that the [DNS_SERVER_PROPERTY::Property](ns-netioapi-dns_server_property.md) member doesn't contain a valid DNS server property.
     * @type {Integer (Int32)}
     */
    static DnsServerInvalidProperty => 0

    /**
     * Specifies that the *DohSettings* union member contained in the [DNS_SERVER_PROPERTY::Property](ns-netioapi-dns_server_property.md) member points to a valid DNS-over-HTTPS server property.
     * @type {Integer (Int32)}
     */
    static DnsServerDohProperty => 1
}
