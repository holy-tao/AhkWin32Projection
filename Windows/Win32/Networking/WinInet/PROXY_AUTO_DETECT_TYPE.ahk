#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class PROXY_AUTO_DETECT_TYPE extends Win32BitflagEnum {

    /**
     * Native name: PROXY_AUTO_DETECT_TYPE_DHCP
     * @type {Integer (UInt32)}
     */
    static DHCP => 1

    /**
     * Native name: PROXY_AUTO_DETECT_TYPE_DNS_A
     * @type {Integer (UInt32)}
     */
    static DNS_A => 2
}
