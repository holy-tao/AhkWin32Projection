#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify proxy settings types for extended proxy settings APIs.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ne-winhttp-winhttp_proxy_settings_type
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_SETTINGS_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpProxySettingsTypeXBox => 3
}
