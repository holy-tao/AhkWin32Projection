#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an IP version.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_ip_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_IP_VERSION extends Win32Enum{

    /**
     * Use IPv4.
     * @type {Integer (Int32)}
     */
    static WS_IP_VERSION_4 => 1

    /**
     * Use IPv6.
     * @type {Integer (Int32)}
     */
    static WS_IP_VERSION_6 => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_IP_VERSION_AUTO => 3
}
