#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the query parameters used in a call to [DnsServiceResolve](../windns/nf-windns-dnsserviceresolve.md).
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_service_resolve_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SERVICE_RESOLVE_REQUEST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The structure version must be **DNS_QUERY_REQUEST_VERSION1**.
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
     * A pointer to a string that represents the service name. This is a fully qualified domain name that begins with a service name, and ends with ".local". It takes the generalized form "\<ServiceName\>.\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "MyMusicServer._http._tcp.local".
     * @type {PWSTR}
     */
    QueryName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a function (of type [DNS_SERVICE_RESOLVE_COMPLETE](nc-windns-dns_service_resolve_complete.md)) that represents the callback to be invoked asynchronously.
     * @type {Pointer<PDNS_SERVICE_RESOLVE_COMPLETE>}
     */
    pResolveCompletionCallback {
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
