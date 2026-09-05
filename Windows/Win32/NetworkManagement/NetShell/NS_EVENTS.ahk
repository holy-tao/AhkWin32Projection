#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
class NS_EVENTS extends Win32Enum {

    /**
     * Native name: NS_EVENT_LOOP
     * @type {Integer (Int32)}
     */
    static EVENT_LOOP => 65536

    /**
     * Native name: NS_EVENT_LAST_N
     * @type {Integer (Int32)}
     */
    static EVENT_LAST_N => 1

    /**
     * Native name: NS_EVENT_LAST_SECS
     * @type {Integer (Int32)}
     */
    static EVENT_LAST_SECS => 2

    /**
     * Native name: NS_EVENT_FROM_N
     * @type {Integer (Int32)}
     */
    static EVENT_FROM_N => 4

    /**
     * Native name: NS_EVENT_FROM_START
     * @type {Integer (Int32)}
     */
    static EVENT_FROM_START => 8
}
