#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the connection state of a Remote Desktop Services session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_connectstate_class
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CONNECTSTATE_CLASS{

    /**
     * A user is logged on to the WinStation. This state occurs when a user is signed in and actively connected to the device.
     * @type {Integer (Int32)}
     */
    static WTSActive => 0

    /**
     * The WinStation is connected to the client.
     * @type {Integer (Int32)}
     */
    static WTSConnected => 1

    /**
     * The WinStation is in the process of connecting to the client.
     * @type {Integer (Int32)}
     */
    static WTSConnectQuery => 2

    /**
     * The WinStation is shadowing another WinStation.
     * @type {Integer (Int32)}
     */
    static WTSShadow => 3

    /**
     * The WinStation is active but the client is disconnected. This state occurs when a user is signed in but not actively connected to the device, such as when the user has chosen to exit to the lock screen.
     * @type {Integer (Int32)}
     */
    static WTSDisconnected => 4

    /**
     * The WinStation is waiting for a client to connect.
     * @type {Integer (Int32)}
     */
    static WTSIdle => 5

    /**
     * The WinStation is listening for a connection. A listener session waits for requests for new client connections. No user is logged on a listener session. A listener session cannot be reset, shadowed, or changed to a regular client session.
     * @type {Integer (Int32)}
     */
    static WTSListen => 6

    /**
     * The WinStation is being reset.
     * @type {Integer (Int32)}
     */
    static WTSReset => 7

    /**
     * The WinStation is down due to an error.
     * @type {Integer (Int32)}
     */
    static WTSDown => 8

    /**
     * The WinStation is initializing.
     * @type {Integer (Int32)}
     */
    static WTSInit => 9
}
