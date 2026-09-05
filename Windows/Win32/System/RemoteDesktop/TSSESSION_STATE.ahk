#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the state of a session.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TSSESSION_STATE extends Win32Enum {

    /**
     * The session state is not valid.
     * Native name: STATE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => -1

    /**
     * The user is logged on to WinStation.
     * Native name: STATE_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 0

    /**
     * WinStation is connected to the client (session reconnected).
     * Native name: STATE_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 1

    /**
     * In the process of connecting to the client (session reconnect pending).
     * Native name: STATE_CONNECTQUERY
     * @type {Integer (Int32)}
     */
    static CONNECTQUERY => 2

    /**
     * Shadowing another WinStation.
     * Native name: STATE_SHADOW
     * @type {Integer (Int32)}
     */
    static SHADOW => 3

    /**
     * WinStation is active but the client is disconnected.
     * Native name: STATE_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 4

    /**
     * Waiting for the client to connect.
     * Native name: STATE_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 5

    /**
     * WinStation is listening for a connection.
     * Native name: STATE_LISTEN
     * @type {Integer (Int32)}
     */
    static LISTEN => 6

    /**
     * WinStation is being reset (session logged off).
     * Native name: STATE_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 7

    /**
     * WinStation is down due to error.
     * Native name: STATE_DOWN
     * @type {Integer (Int32)}
     */
    static DOWN => 8

    /**
     * WinStation is initializing.
     * Native name: STATE_INIT
     * @type {Integer (Int32)}
     */
    static INIT => 9

    /**
     * Native name: STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 10
}
