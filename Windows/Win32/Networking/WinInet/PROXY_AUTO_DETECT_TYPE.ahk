#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class PROXY_AUTO_DETECT_TYPE extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_AUTO_DETECT_TYPE_DHCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_AUTO_DETECT_TYPE_DNS_A => 2
}
