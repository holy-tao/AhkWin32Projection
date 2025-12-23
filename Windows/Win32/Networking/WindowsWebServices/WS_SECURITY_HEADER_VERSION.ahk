#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WS-Security specification version to be used with message security and mixed-mode security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_header_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_HEADER_VERSION extends Win32Enum{

    /**
     * WS-Security 1.0.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_VERSION_1_0 => 1

    /**
     * WS-Security 1.1.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_VERSION_1_1 => 2
}
