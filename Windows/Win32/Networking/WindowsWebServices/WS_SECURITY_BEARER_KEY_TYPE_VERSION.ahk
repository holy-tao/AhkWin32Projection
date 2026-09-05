#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SECURITY_BEARER_KEY_TYPE_VERSION extends Win32Enum {

    /**
     * Native name: WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ORIGINAL_SPECIFICATION
     * @type {Integer (Int32)}
     */
    static 1_3_ORIGINAL_SPECIFICATION => 1

    /**
     * Native name: WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ORIGINAL_SCHEMA
     * @type {Integer (Int32)}
     */
    static 1_3_ORIGINAL_SCHEMA => 2

    /**
     * Native name: WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ERRATA_01
     * @type {Integer (Int32)}
     */
    static 1_3_ERRATA_01 => 3
}
