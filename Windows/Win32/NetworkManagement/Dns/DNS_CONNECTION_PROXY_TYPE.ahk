#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_PROXY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_TYPE_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_TYPE_HTTP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_TYPE_WAP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_TYPE_SOCKS4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_TYPE_SOCKS5 => 5
}
