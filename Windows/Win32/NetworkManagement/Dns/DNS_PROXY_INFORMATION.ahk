#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_PROXY_INFORMATION_TYPE.ahk" { DNS_PROXY_INFORMATION_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the proxy information for a DNS server's name resolution policy table.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_proxy_information
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_PROXY_INFORMATION {
    #StructPack 8

    /**
     * A value that specifies the structure version. This value must be 1.
     */
    version : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_proxy_information_type">DNS_PROXY_INFORMATION_TYPE</a> enumeration that contains the proxy information type.
     */
    proxyInformationType : DNS_PROXY_INFORMATION_TYPE

    /**
     * A pointer to a string that contains the proxy server name if <b>proxyInformationType</b> is <b>DNS_PROXY_INFORMATION_PROXY_NAME</b>. Otherwise, this member is ignored.
     * 
     * <div class="alert"><b>Note</b>  To free this string, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsfreeproxyname">DnsFreeProxyName</a> function.</div>
     * <div> </div>
     */
    proxyName : PWSTR

}
