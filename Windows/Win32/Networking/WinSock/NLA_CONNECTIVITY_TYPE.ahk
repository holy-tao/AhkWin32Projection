#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class NLA_CONNECTIVITY_TYPE extends Win32Enum {

    /**
     * Native name: NLA_NETWORK_AD_HOC
     * @type {Integer (Int32)}
     */
    static NETWORK_AD_HOC => 0

    /**
     * Native name: NLA_NETWORK_MANAGED
     * @type {Integer (Int32)}
     */
    static NETWORK_MANAGED => 1

    /**
     * Native name: NLA_NETWORK_UNMANAGED
     * @type {Integer (Int32)}
     */
    static NETWORK_UNMANAGED => 2

    /**
     * Native name: NLA_NETWORK_UNKNOWN
     * @type {Integer (Int32)}
     */
    static NETWORK_UNKNOWN => 3
}
