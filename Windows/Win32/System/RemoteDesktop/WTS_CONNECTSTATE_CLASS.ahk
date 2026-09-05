#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the connection state of a Remote Desktop Services session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_connectstate_class
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_CONNECTSTATE_CLASS extends Win32Enum {

    /**
     * A user is logged on to the WinStation. This state occurs when a user is signed in and actively connected to the device.
     * Native name: WTSActive
     * @type {Integer (Int32)}
     */
    static Active => 0

    /**
     * The WinStation is connected to the client.
     * Native name: WTSConnected
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * The WinStation is in the process of connecting to the client.
     * Native name: WTSConnectQuery
     * @type {Integer (Int32)}
     */
    static ConnectQuery => 2

    /**
     * The WinStation is shadowing another WinStation.
     * Native name: WTSShadow
     * @type {Integer (Int32)}
     */
    static Shadow => 3

    /**
     * The WinStation is active but the client is disconnected. This state occurs when a user is signed in but not actively connected to the device, such as when the user has chosen to exit to the lock screen.
     * Native name: WTSDisconnected
     * @type {Integer (Int32)}
     */
    static Disconnected => 4

    /**
     * The WinStation is waiting for a client to connect.
     * Native name: WTSIdle
     * @type {Integer (Int32)}
     */
    static Idle => 5

    /**
     * The WinStation is listening for a connection. A listener session waits for requests for new client connections. No user is logged on a listener session. A listener session cannot be reset, shadowed, or changed to a regular client session.
     * Native name: WTSListen
     * @type {Integer (Int32)}
     */
    static Listen => 6

    /**
     * The WinStation is being reset.
     * Native name: WTSReset
     * @type {Integer (Int32)}
     */
    static Reset => 7

    /**
     * The WinStation is down due to an error.
     * Native name: WTSDown
     * @type {Integer (Int32)}
     */
    static Down => 8

    /**
     * The WinStation is initializing.
     * Native name: WTSInit
     * @type {Integer (Int32)}
     */
    static Init => 9
}
