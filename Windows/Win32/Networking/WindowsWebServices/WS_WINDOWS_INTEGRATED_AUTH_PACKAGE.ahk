#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the specific SSP package to be used for Windows Integrated Authentication.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_windows_integrated_auth_package
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_WINDOWS_INTEGRATED_AUTH_PACKAGE{

    /**
     * The Kerberos package.
     * @type {Integer (Int32)}
     */
    static WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_KERBEROS => 1

    /**
     * The NTLM package.
     * @type {Integer (Int32)}
     */
    static WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_NTLM => 2

    /**
     * The SPNEGO package.
     * @type {Integer (Int32)}
     */
    static WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_SPNEGO => 3
}
