#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the validity of the property held in the [DNS_SERVER_PROPERTY::Property](/windows/win32/api/netioapi/ns-netioapi-dns_server_property) member.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ne-netioapi-dns_server_property_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class DNS_SERVER_PROPERTY_TYPE extends Win32Enum {

    /**
     * Specifies that the [DNS_SERVER_PROPERTY::Property](ns-netioapi-dns_server_property.md) member doesn't contain a valid DNS server property.
     * Native name: DnsServerInvalidProperty
     * @type {Integer (Int32)}
     */
    static InvalidProperty => 0

    /**
     * Specifies that the *DohSettings* union member contained in the [DNS_SERVER_PROPERTY::Property](ns-netioapi-dns_server_property.md) member points to a valid DNS-over-HTTPS server property.
     * Native name: DnsServerDohProperty
     * @type {Integer (Int32)}
     */
    static DohProperty => 1

    /**
     * Native name: DnsServerDotProperty
     * @type {Integer (Int32)}
     */
    static DotProperty => 2
}
