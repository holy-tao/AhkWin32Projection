#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Represents a DNS custom server. A **DNS_CUSTOM_SERVER** object is passed to [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex) via the [DNS_QUERY_REQUEST3](/windows/win32/api/windns/ns-windns-dns_query_request3) structure.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_custom_server
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CUSTOM_SERVER {
    #StructPack 8

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The server type. Must be one of the following.
     * 
     * ||Value|Description|
     * |-|-|-|
     * |**DNS_CUSTOM_SERVER_TYPE_UDP**|0x1|Perform unsecure name resolution|
     * |**DNS_CUSTOM_SERVER_TYPE_DOH**|0x2|Perform **DNS-over-HTTPS** name resolution|
     */
    dwServerType : UInt32

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that contains a bitmap of the following options.
     * 
     * ||Value|Description|
     * |-|-|-|
     * |**DNS_CUSTOM_SERVER_UDP_FALLBACK**|0x1|Server might fall back to unsecure resolution|
     */
    ullFlags : Int64

    pwszTemplate : PWSTR

    MaxSa : CHAR[32]

    static __New() {
        DefineProp(this.Prototype, 'pwszHostname', { type: PWSTR, offset: 16 })
        this.DeleteProp("__New")
    }
}
