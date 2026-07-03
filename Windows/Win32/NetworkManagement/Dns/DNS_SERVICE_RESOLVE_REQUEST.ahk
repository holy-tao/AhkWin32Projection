#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the query parameters used in a call to [DnsServiceResolve](../windns/nf-windns-dnsserviceresolve.md).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_service_resolve_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SERVICE_RESOLVE_REQUEST {
    #StructPack 8

    /**
     * The structure version must be **DNS_QUERY_REQUEST_VERSION1**.
     */
    Version : UInt32

    /**
     * A value that contains the interface index over which the query is sent. If `InterfaceIndex` is 0, then all interfaces will be considered.
     */
    InterfaceIndex : UInt32

    /**
     * A pointer to a string that represents the service name. This is a fully qualified domain name that begins with a service name, and ends with ".local". It takes the generalized form "\<ServiceName\>.\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "MyMusicServer._http._tcp.local".
     */
    QueryName : PWSTR

    /**
     * A pointer to a function (of type [DNS_SERVICE_RESOLVE_COMPLETE](nc-windns-dns_service_resolve_complete.md)) that represents the callback to be invoked asynchronously.
     */
    pResolveCompletionCallback : IntPtr

    /**
     * A pointer to a user context.
     */
    pQueryContext : IntPtr

}
