#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a DNS custom server. A **DNS_CUSTOM_SERVER** object is passed to [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex) via the [DNS_QUERY_REQUEST3](/windows/win32/api/windns/ns-windns-dns_query_request3) structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_custom_server
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CUSTOM_SERVER extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The server type. Must be one of the following.
     * 
     * ||Value|Description|
     * |-|-|-|
     * |**DNS_CUSTOM_SERVER_TYPE_UDP**|0x1|Perform unsecure name resolution|
     * |**DNS_CUSTOM_SERVER_TYPE_DOH**|0x2|Perform **DNS-over-HTTPS** name resolution|
     * @type {Integer}
     */
    dwServerType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that contains a bitmap of the following options.
     * 
     * ||Value|Description|
     * |-|-|-|
     * |**DNS_CUSTOM_SERVER_UDP_FALLBACK**|0x1|Server might fall back to unsecure resolution|
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Anonymous1 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {String}
     */
    MaxSa {
        get => StrGet(this.ptr + 24, 31, "UTF-16")
        set => StrPut(value, this.ptr + 24, 31, "UTF-16")
    }
}
