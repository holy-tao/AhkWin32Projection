#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_SESSION_EVENT extends Win32Enum {

    /**
     * Native name: IoSessionEventIgnore
     * @type {Integer (Int32)}
     */
    static Ignore => 0

    /**
     * Native name: IoSessionEventCreated
     * @type {Integer (Int32)}
     */
    static Created => 1

    /**
     * Native name: IoSessionEventTerminated
     * @type {Integer (Int32)}
     */
    static Terminated => 2

    /**
     * Native name: IoSessionEventConnected
     * @type {Integer (Int32)}
     */
    static Connected => 3

    /**
     * Native name: IoSessionEventDisconnected
     * @type {Integer (Int32)}
     */
    static Disconnected => 4

    /**
     * Native name: IoSessionEventLogon
     * @type {Integer (Int32)}
     */
    static Logon => 5

    /**
     * Native name: IoSessionEventLogoff
     * @type {Integer (Int32)}
     */
    static Logoff => 6

    /**
     * Native name: IoSessionEventMax
     * @type {Integer (Int32)}
     */
    static Max => 7
}
