#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class LOGON32_LOGON extends Win32Enum {

    /**
     * Native name: LOGON32_LOGON_BATCH
     * @type {Integer (UInt32)}
     */
    static BATCH => 4

    /**
     * Native name: LOGON32_LOGON_INTERACTIVE
     * @type {Integer (UInt32)}
     */
    static INTERACTIVE => 2

    /**
     * Native name: LOGON32_LOGON_NETWORK
     * @type {Integer (UInt32)}
     */
    static NETWORK => 3

    /**
     * Native name: LOGON32_LOGON_NETWORK_CLEARTEXT
     * @type {Integer (UInt32)}
     */
    static NETWORK_CLEARTEXT => 8

    /**
     * Native name: LOGON32_LOGON_NEW_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static NEW_CREDENTIALS => 9

    /**
     * Native name: LOGON32_LOGON_SERVICE
     * @type {Integer (UInt32)}
     */
    static SERVICE => 5

    /**
     * Native name: LOGON32_LOGON_UNLOCK
     * @type {Integer (UInt32)}
     */
    static UNLOCK => 7
}
