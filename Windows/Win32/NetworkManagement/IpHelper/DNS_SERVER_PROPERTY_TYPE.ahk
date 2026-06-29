#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the validity of the property held in the [DNS_SERVER_PROPERTY::Property](/windows/win32/api/netioapi/ns-netioapi-dns_server_property) member.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ne-netioapi-dns_server_property_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_SERVER_PROPERTY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

    /**
     * @type {Integer (Int32)}
     */
    static DnsServerDotProperty => 2
}
