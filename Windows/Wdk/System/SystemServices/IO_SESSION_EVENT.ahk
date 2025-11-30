#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_SESSION_EVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventIgnore => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventCreated => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventTerminated => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventConnected => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventDisconnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventLogon => 5

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventLogoff => 6

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventMax => 7
}
