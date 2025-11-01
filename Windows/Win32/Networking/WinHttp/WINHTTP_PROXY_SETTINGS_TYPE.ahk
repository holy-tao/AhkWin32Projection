#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ne-winhttp-winhttp_proxy_settings_type
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeWsl => 1

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeWsa => 2
}
