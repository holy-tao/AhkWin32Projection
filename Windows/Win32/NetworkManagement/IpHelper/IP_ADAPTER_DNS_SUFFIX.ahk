#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP_ADAPTER_DNS_SUFFIX structure stores a DNS suffix in a linked list of DNS suffixes for a particular adapter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function. The <b>FirstDnsSuffix</b> member of the <b>IP_ADAPTER_ADDRESSES</b> structure is a pointer to a linked list of <b>IP_ADAPTER_DNS_SUFFIX</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_dns_suffix
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_DNS_SUFFIX extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * A pointer to the next DNS suffix in the linked list.
     * @type {Pointer<IP_ADAPTER_DNS_SUFFIX>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The DNS suffix for this DNS suffix entry.
     * @type {String}
     */
    String {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }
}
