#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify proxy settings types for extended proxy settings APIs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ne-winhttp-winhttp_proxy_settings_type
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS_TYPE extends Win32Enum{

    /**
     * Specifies an unknown type.
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeUnknown => 0

    /**
     * Specifies settings for Windows Subsystem for Linux (WSL).
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeWsl => 1

    /**
     * Specifies settings for Windows Subsystem for Android (WSA).
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeWsa => 2
}
