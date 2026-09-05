#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_CONNECTION_PROXY_INFO_SWITCH extends Win32Enum {

    /**
     * Native name: DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG
     * @type {Integer (Int32)}
     */
    static CONFIG => 0

    /**
     * Native name: DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT
     * @type {Integer (Int32)}
     */
    static SCRIPT => 1

    /**
     * Native name: DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD
     * @type {Integer (Int32)}
     */
    static WPAD => 2
}
