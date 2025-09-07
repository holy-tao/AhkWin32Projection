#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the state of a session.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TSSESSION_STATE{

    /**
     * The session state is not valid.
     * @type {Integer (Int32)}
     */
    static STATE_INVALID => -1

    /**
     * The user is logged on to WinStation.
     * @type {Integer (Int32)}
     */
    static STATE_ACTIVE => 0

    /**
     * WinStation is connected to the client (session reconnected).
     * @type {Integer (Int32)}
     */
    static STATE_CONNECTED => 1

    /**
     * In the process of connecting to the client (session reconnect pending).
     * @type {Integer (Int32)}
     */
    static STATE_CONNECTQUERY => 2

    /**
     * Shadowing another WinStation.
     * @type {Integer (Int32)}
     */
    static STATE_SHADOW => 3

    /**
     * WinStation is active but the client is disconnected.
     * @type {Integer (Int32)}
     */
    static STATE_DISCONNECTED => 4

    /**
     * Waiting for the client to connect.
     * @type {Integer (Int32)}
     */
    static STATE_IDLE => 5

    /**
     * WinStation is listening for a connection.
     * @type {Integer (Int32)}
     */
    static STATE_LISTEN => 6

    /**
     * WinStation is being reset (session logged off).
     * @type {Integer (Int32)}
     */
    static STATE_RESET => 7

    /**
     * WinStation is down due to error.
     * @type {Integer (Int32)}
     */
    static STATE_DOWN => 8

    /**
     * WinStation is initializing.
     * @type {Integer (Int32)}
     */
    static STATE_INIT => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STATE_MAX => 10
}
