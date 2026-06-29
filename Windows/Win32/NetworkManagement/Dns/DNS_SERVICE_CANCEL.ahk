#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to cancel an asynchronous DNS-SD operation.
 * @remarks
 * This structure is returned in the `pCancel` parameter from a previous call to [DnsServiceBrowse](nf-windns-dnsservicebrowse.md), [DnsServiceRegister](nf-windns-dnsserviceregister.md), or [DnsServiceResolve](nf-windns-dnsserviceresolve.md).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_service_cancel
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SERVICE_CANCEL {
    #StructPack 8

    /**
     * Contains a handle associated with the asynchronous operation to cancel. Your application must not modify this value.
     */
    reserved : IntPtr

}
