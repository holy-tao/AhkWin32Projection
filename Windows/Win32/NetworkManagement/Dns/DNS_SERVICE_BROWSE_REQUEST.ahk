#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the query parameters used in a call to [DnsServiceBrowse](../windns/nf-windns-dnsservicebrowse.md).
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_service_browse_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SERVICE_BROWSE_REQUEST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The structure version must be either **DNS_QUERY_REQUEST_VERSION1** or **DNS_QUERY_REQUEST_VERSION2**. The value determines which of `pBrowseCallback` or `pBrowseCallbackV2` is active.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that contains the interface index over which the query is sent. If `InterfaceIndex` is 0, then all interfaces will be considered.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a string that represents the service type whose matching services you wish to browse for. It takes the generalized form "\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "_http._tcp.local", which defines a query to browse for http services on the local link.
     * @type {PWSTR}
     */
    QueryName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PDNS_SERVICE_BROWSE_CALLBACK>}
     */
    pBrowseCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PDNS_QUERY_COMPLETION_ROUTINE>}
     */
    pBrowseCallbackV2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a user context.
     * @type {Pointer<Void>}
     */
    pQueryContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
