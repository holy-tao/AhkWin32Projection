#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequestSecureProtocols{

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_SSL2 => 8

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_SSL3 => 32

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_TLS1 => 128

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_TLS1_1 => 512

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_TLS1_2 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_ALL => 168
}
