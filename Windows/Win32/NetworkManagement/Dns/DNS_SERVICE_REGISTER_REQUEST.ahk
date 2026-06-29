#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_SERVICE_INSTANCE.ahk" { DNS_SERVICE_INSTANCE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the information necessary to advertise a service using [DnsServiceRegister](../windns/nf-windns-dnsserviceregister.md), or to stop advertising it using [DnsServiceDeRegister](../windns/nf-windns-dnsservicederegister.md).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_service_register_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SERVICE_REGISTER_REQUEST {
    #StructPack 8

    /**
     * The structure version must be **DNS_QUERY_REQUEST_VERSION1**.
     */
    Version : UInt32

    /**
     * A value that contains the interface index over which the service is to be advertised. If `InterfaceIndex` is 0, then all interfaces will be considered.
     */
    InterfaceIndex : UInt32

    /**
     * A pointer to a [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure that describes the service to be registered.
     */
    pServiceInstance : DNS_SERVICE_INSTANCE.Ptr

    /**
     * A pointer to a function (of type [DNS_SERVICE_REGISTER_COMPLETE](nc-windns-dns_service_register_complete.md)) that represents the callback to be invoked asynchronously.
     */
    pRegisterCompletionCallback : IntPtr

    /**
     * A pointer to a user context.
     */
    pQueryContext : IntPtr

    /**
     * Not used.
     */
    hCredentials : HANDLE

    /**
     * `true` if the DNS protocol should be used to advertise the service; `false` if the mDNS protocol should be used.
     */
    unicastEnabled : BOOL

}
