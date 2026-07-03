#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_DOH_SERVER_SETTINGS.ahk" { DNS_DOH_SERVER_SETTINGS }
#Import ".\DNS_DOT_SERVER_SETTINGS.ahk" { DNS_DOT_SERVER_SETTINGS }

/**
 * Contains a pointer to a DNS server property. The type of the property depends on the value of [DNS_SERVER_PROPERTY::Type](/windows/win32/api/netioapi/ns-netioapi-dns_server_property).
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-dns_server_property_types
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_SERVER_PROPERTY_TYPES {
    #StructPack 8

    /**
     * If [DNS_SERVER_PROPERTY::Type](ns-netioapi-dns_server_property.md) is set to *DnsServerDohProperty*, then *DohSettings* points to a valid DNS-over-HTTPS server property.
     */
    DohSettings : DNS_DOH_SERVER_SETTINGS.Ptr

    static __New() {
        DefineProp(this.Prototype, 'DotSettings', { type: DNS_DOT_SERVER_SETTINGS.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }
}
