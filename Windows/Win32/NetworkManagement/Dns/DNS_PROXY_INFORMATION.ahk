#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the proxy information for a DNS server's name resolution policy table.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_proxy_information
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_PROXY_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that specifies the structure version. This value must be 1.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_proxy_information_type">DNS_PROXY_INFORMATION_TYPE</a> enumeration that contains the proxy information type.
     * @type {Integer}
     */
    proxyInformationType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A pointer to a string that contains the proxy server name if <b>proxyInformationType</b> is <b>DNS_PROXY_INFORMATION_PROXY_NAME</b>. Otherwise, this member is ignored.
     * 
     * <div class="alert"><b>Note</b>  To free this string, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsfreeproxyname">DnsFreeProxyName</a> function.</div>
     * <div> </div>
     * @type {Pointer<Char>}
     */
    proxyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
