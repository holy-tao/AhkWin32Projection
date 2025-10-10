#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to cancel an asynchronous DNS-SD operation.
 * @remarks
 * 
  * This structure is returned in the `pCancel` parameter from a previous call to [DnsServiceBrowse](nf-windns-dnsservicebrowse.md), [DnsServiceRegister](nf-windns-dnsserviceregister.md), or [DnsServiceResolve](nf-windns-dnsserviceresolve.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_service_cancel
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SERVICE_CANCEL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Contains a handle associated with the asynchronous operation to cancel. Your application must not modify this value.
     * @type {Pointer<Void>}
     */
    reserved {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
