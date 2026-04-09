#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SECURE_PROTOCOL extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_SSL2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_SSL3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_TLS1_0 => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_TLS1_1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_TLS1_2 => 16
}
