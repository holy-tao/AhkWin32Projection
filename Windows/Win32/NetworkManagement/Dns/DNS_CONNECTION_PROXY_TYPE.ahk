#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_CONNECTION_PROXY_TYPE extends Win32Enum {

    /**
     * Native name: DNS_CONNECTION_PROXY_TYPE_NULL
     * @type {Integer (Int32)}
     */
    static NULL => 0

    /**
     * Native name: DNS_CONNECTION_PROXY_TYPE_HTTP
     * @type {Integer (Int32)}
     */
    static HTTP => 1

    /**
     * Native name: DNS_CONNECTION_PROXY_TYPE_WAP
     * @type {Integer (Int32)}
     */
    static WAP => 2

    /**
     * Native name: DNS_CONNECTION_PROXY_TYPE_SOCKS4
     * @type {Integer (Int32)}
     */
    static SOCKS4 => 4

    /**
     * Native name: DNS_CONNECTION_PROXY_TYPE_SOCKS5
     * @type {Integer (Int32)}
     */
    static SOCKS5 => 5
}
