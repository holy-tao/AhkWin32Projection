#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the proxy access type flags.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/ne-wsmandisp-wsmanproxyaccesstypeflags
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManProxyAccessTypeFlags extends Win32Enum{

    /**
     * Use the Internet Explorer proxy configuration for the current user.
     * @type {Integer (Int32)}
     */
    static WSManProxyIEConfig => 1

    /**
     * Use the proxy settings configured for WinHTTP. This is the default setting.
     * @type {Integer (Int32)}
     */
    static WSManProxyWinHttpConfig => 2

    /**
     * Force autodetection of a proxy.
     * @type {Integer (Int32)}
     */
    static WSManProxyAutoDetect => 4

    /**
     * Do not use a proxy server. All host names are resolved locally.
     * @type {Integer (Int32)}
     */
    static WSManProxyNoProxyServer => 8
}
