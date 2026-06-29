#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the query parameters used in a call to [DnsServiceBrowse](../windns/nf-windns-dnsservicebrowse.md).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_service_browse_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SERVICE_BROWSE_REQUEST {
    #StructPack 8

    /**
     * The structure version must be either **DNS_QUERY_REQUEST_VERSION1** or **DNS_QUERY_REQUEST_VERSION2**. The value determines which of `pBrowseCallback` or `pBrowseCallbackV2` is active.
     */
    Version : UInt32

    /**
     * A value that contains the interface index over which the query is sent. If `InterfaceIndex` is 0, then all interfaces will be considered.
     */
    InterfaceIndex : UInt32

    /**
     * A pointer to a string that represents the service type whose matching services you wish to browse for. It takes the generalized form "\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "_http._tcp.local", which defines a query to browse for http services on the local link.
     */
    QueryName : PWSTR

    pBrowseCallback : IntPtr

    /**
     * A pointer to a user context.
     */
    pQueryContext : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pBrowseCallbackV2', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
