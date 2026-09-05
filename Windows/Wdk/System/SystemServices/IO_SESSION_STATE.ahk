#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_SESSION_STATE extends Win32Enum {

    /**
     * Native name: IoSessionStateCreated
     * @type {Integer (Int32)}
     */
    static Created => 1

    /**
     * Native name: IoSessionStateInitialized
     * @type {Integer (Int32)}
     */
    static Initialized => 2

    /**
     * Native name: IoSessionStateConnected
     * @type {Integer (Int32)}
     */
    static Connected => 3

    /**
     * Native name: IoSessionStateDisconnected
     * @type {Integer (Int32)}
     */
    static Disconnected => 4

    /**
     * Native name: IoSessionStateDisconnectedLoggedOn
     * @type {Integer (Int32)}
     */
    static DisconnectedLoggedOn => 5

    /**
     * Native name: IoSessionStateLoggedOn
     * @type {Integer (Int32)}
     */
    static LoggedOn => 6

    /**
     * Native name: IoSessionStateLoggedOff
     * @type {Integer (Int32)}
     */
    static LoggedOff => 7

    /**
     * Native name: IoSessionStateTerminated
     * @type {Integer (Int32)}
     */
    static Terminated => 8

    /**
     * Native name: IoSessionStateMax
     * @type {Integer (Int32)}
     */
    static Max => 9
}
