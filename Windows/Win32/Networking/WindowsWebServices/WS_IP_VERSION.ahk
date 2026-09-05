#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an IP version.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_ip_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_IP_VERSION extends Win32Enum {

    /**
     * Use IPv4.
     * Native name: WS_IP_VERSION_4
     * @type {Integer (Int32)}
     */
    static 4 => 1

    /**
     * Use IPv6.
     * Native name: WS_IP_VERSION_6
     * @type {Integer (Int32)}
     */
    static 6 => 2

    /**
     * Native name: WS_IP_VERSION_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 3
}
