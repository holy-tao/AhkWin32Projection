#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_SESSION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateCreated => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateInitialized => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateConnected => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateDisconnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateDisconnectedLoggedOn => 5

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateLoggedOn => 6

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateLoggedOff => 7

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateTerminated => 8

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateMax => 9
}
