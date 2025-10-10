#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information necessary to advertise a service using [DnsServiceRegister](../windns/nf-windns-dnsserviceregister.md), or to stop advertising it using [DnsServiceDeRegister](../windns/nf-windns-dnsservicederegister.md).
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_service_register_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SERVICE_REGISTER_REQUEST extends Win32Struct
{
    static sizeof => 48

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
     * A value that contains the interface index over which the service is to be advertised. If `InterfaceIndex` is 0, then all interfaces will be considered.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure that describes the service to be registered.
     * @type {Pointer<DNS_SERVICE_INSTANCE>}
     */
    pServiceInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a function (of type [DNS_SERVICE_REGISTER_COMPLETE](nc-windns-dns_service_register_complete.md)) that represents the callback to be invoked asynchronously.
     * @type {Pointer<PDNS_SERVICE_REGISTER_COMPLETE>}
     */
    pRegisterCompletionCallback {
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

    /**
     * Not used.
     * @type {Pointer<Void>}
     */
    hCredentials {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * `true` if the DNS protocol should be used to advertise the service; `false` if the mDNS protocol should be used.
     * @type {Integer}
     */
    unicastEnabled {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
