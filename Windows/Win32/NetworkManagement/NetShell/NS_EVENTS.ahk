#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NS_EVENTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_LOOP => 65536

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_LAST_N => 1

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_LAST_SECS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_FROM_N => 4

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_FROM_START => 8
}
