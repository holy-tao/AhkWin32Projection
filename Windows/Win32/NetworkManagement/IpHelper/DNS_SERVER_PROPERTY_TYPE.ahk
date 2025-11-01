#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ne-netioapi-dns_server_property_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_SERVER_PROPERTY_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static DnsServerInvalidProperty => 0

    /**
     * @type {Integer (Int32)}
     */
    static DnsServerDohProperty => 1

    /**
     * @type {Integer (Int32)}
     */
    static DnsServerDotProperty => 2
}
