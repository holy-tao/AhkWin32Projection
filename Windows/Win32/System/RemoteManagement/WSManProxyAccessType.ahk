#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the proxy access type.
 * @remarks
 * 
 * The <b>WSMAN_OPTION_PROXY_IE_PROXY_CONFIG</b> option returns the current user Internet Explorer proxy settings for the current active network connection. This option requires the user profile to be loaded. This option can be directly used when called within a process that is running under an interactive user account identity. If the client application is running under a user context that is different than the interactive user, the client application must explicitly load the user profile prior to using this option.
 * 
 * If the Windows Remote Management API is called from a service,  <b>WSMAN_OPTION_PROXY_WINHTTP_PROXY_CONFIG</b> or <b>WSMAN_OPTION_PROXY_AUTO_DETECT</b> should be used if a proxy is required.
 * 
 * The <b>WSMAN_OPTION_PROXY_WINHTTP_PROXY_CONFIG</b> option translates into the <b>WINHTTP_ACCESS_TYPE_DEFAULT_PROXY</b> option in WinHTTP. WinHTTP retrieves the static proxy or direct configuration from the registry. <b>WINHTTP_ACCESS_TYPE_DEFAULT_PROXY</b> does not inherit browser proxy settings. WinHTTP does not share any proxy settings with Internet Explorer. This option gets the WinHTTP proxy configuration set by the ProxyCfg.exe utility.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ne-wsman-wsmanproxyaccesstype
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManProxyAccessType{

    /**
     * Use the Internet Explorer proxy configuration for the current user. This is the default setting.
     * @type {Integer (Int32)}
     */
    static WSMAN_OPTION_PROXY_IE_PROXY_CONFIG => 1

    /**
     * Use the proxy settings configured for WinHTTP.
     * @type {Integer (Int32)}
     */
    static WSMAN_OPTION_PROXY_WINHTTP_PROXY_CONFIG => 2

    /**
     * Force autodetection of a proxy.
     * @type {Integer (Int32)}
     */
    static WSMAN_OPTION_PROXY_AUTO_DETECT => 4

    /**
     * Do not use a proxy server. All host names are resolved locally.
     * @type {Integer (Int32)}
     */
    static WSMAN_OPTION_PROXY_NO_PROXY_SERVER => 8
}
