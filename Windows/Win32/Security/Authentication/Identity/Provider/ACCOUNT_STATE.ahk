#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class ACCOUNT_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NOT_CONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTING => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_COMPLETED => 2
}
