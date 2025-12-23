#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class LOGON32_LOGON extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_BATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_INTERACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_NETWORK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_NETWORK_CLEARTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_NEW_CREDENTIALS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_SERVICE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_UNLOCK => 7
}
