#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WinHttpRequestSecureProtocols extends Win32Enum {

    /**
     * Native name: SecureProtocol_SSL2
     * @type {Integer (Int32)}
     */
    static Protocol_SSL2 => 8

    /**
     * Native name: SecureProtocol_SSL3
     * @type {Integer (Int32)}
     */
    static Protocol_SSL3 => 32

    /**
     * Native name: SecureProtocol_TLS1
     * @type {Integer (Int32)}
     */
    static Protocol_TLS1 => 128

    /**
     * Native name: SecureProtocol_TLS1_1
     * @type {Integer (Int32)}
     */
    static Protocol_TLS1_1 => 512

    /**
     * Native name: SecureProtocol_TLS1_2
     * @type {Integer (Int32)}
     */
    static Protocol_TLS1_2 => 2048

    /**
     * Native name: SecureProtocol_ALL
     * @type {Integer (Int32)}
     */
    static Protocol_ALL => 168
}
