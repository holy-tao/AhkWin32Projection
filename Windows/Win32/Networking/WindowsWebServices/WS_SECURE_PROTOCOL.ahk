#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SECURE_PROTOCOL extends Win32Enum {

    /**
     * Native name: WS_SECURE_PROTOCOL_SSL2
     * @type {Integer (Int32)}
     */
    static SSL2 => 1

    /**
     * Native name: WS_SECURE_PROTOCOL_SSL3
     * @type {Integer (Int32)}
     */
    static SSL3 => 2

    /**
     * Native name: WS_SECURE_PROTOCOL_TLS1_0
     * @type {Integer (Int32)}
     */
    static TLS1_0 => 4

    /**
     * Native name: WS_SECURE_PROTOCOL_TLS1_1
     * @type {Integer (Int32)}
     */
    static TLS1_1 => 8

    /**
     * Native name: WS_SECURE_PROTOCOL_TLS1_2
     * @type {Integer (Int32)}
     */
    static TLS1_2 => 16
}
