#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_PROXY_INFO_SWITCH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD => 2
}
