#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_SECURE_DNS_SETTING{

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingForcePlaintext => 1

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingRequireEncryption => 2

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingTryEncryptionWithFallback => 3

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingMax => 4
}
