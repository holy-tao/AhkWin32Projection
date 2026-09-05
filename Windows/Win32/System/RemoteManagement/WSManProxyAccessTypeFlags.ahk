#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the proxy access type flags.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/ne-wsmandisp-wsmanproxyaccesstypeflags
 * @namespace Windows.Win32.System.RemoteManagement
 */
class WSManProxyAccessTypeFlags extends Win32Enum {

    /**
     * Use the Internet Explorer proxy configuration for the current user.
     * Native name: WSManProxyIEConfig
     * @type {Integer (Int32)}
     */
    static ProxyIEConfig => 1

    /**
     * Use the proxy settings configured for WinHTTP. This is the default setting.
     * Native name: WSManProxyWinHttpConfig
     * @type {Integer (Int32)}
     */
    static WinHttpConfig => 2

    /**
     * Force autodetection of a proxy.
     * Native name: WSManProxyAutoDetect
     * @type {Integer (Int32)}
     */
    static AutoDetect => 4

    /**
     * Do not use a proxy server. All host names are resolved locally.
     * Native name: WSManProxyNoProxyServer
     * @type {Integer (Int32)}
     */
    static NoProxyServer => 8
}
