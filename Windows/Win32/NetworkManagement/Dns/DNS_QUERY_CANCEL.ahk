#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A DNS_QUERY_CANCEL structure can be used to cancel an asynchronous DNS query.
 * @remarks
 * This structure is returned in the <i>pCancelHandle</i> parameter from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_cancel
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_QUERY_CANCEL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * Contains a handle to the asynchronous query to cancel. Applications must not modify this value.
     * @type {Array<SByte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
