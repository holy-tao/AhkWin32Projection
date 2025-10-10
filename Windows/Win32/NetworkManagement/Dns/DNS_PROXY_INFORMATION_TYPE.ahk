#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DNS_PROXY_INFORMATION_TYPE enumeration defines the proxy information type in the DNS_PROXY_INFORMATION structure.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ne-windns-dns_proxy_information_type
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_PROXY_INFORMATION_TYPE{

    /**
     * The type is bypass proxy information.
     * @type {Integer (Int32)}
     */
    static DNS_PROXY_INFORMATION_DIRECT => 0

    /**
     * The type is the user's default browser proxy settings.
     * @type {Integer (Int32)}
     */
    static DNS_PROXY_INFORMATION_DEFAULT_SETTINGS => 1

    /**
     * The type is defined by the <b>proxyName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_proxy_information">DNS_PROXY_INFORMATION</a> structure.
     * @type {Integer (Int32)}
     */
    static DNS_PROXY_INFORMATION_PROXY_NAME => 2

    /**
     * The type does not exist. DNS policy does not have proxy information for this name space. This type is used if no wildcard policy exists and there is no default proxy information.
     * @type {Integer (Int32)}
     */
    static DNS_PROXY_INFORMATION_DOES_NOT_EXIST => 3
}
