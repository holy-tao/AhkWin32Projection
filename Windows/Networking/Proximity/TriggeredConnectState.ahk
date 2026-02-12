#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the current state of a connection to a peer application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.triggeredconnectstate
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class TriggeredConnectState extends Win32Enum{

    /**
     * A device that supports proximity socket connections is within proximity. The tap gesture is complete.
     * @type {Integer (Int32)}
     */
    static PeerFound => 0

    /**
     * This side of the socket connection will be the host and is waiting for a connection from the peer.
     * @type {Integer (Int32)}
     */
    static Listening => 1

    /**
     * This side of the socket connection will be the client and is attempting to connect to the peer.
     * @type {Integer (Int32)}
     */
    static Connecting => 2

    /**
     * The connection is complete, and the [StreamSocket](../windows.networking.sockets/streamsocket_streamsocket_1221375020.md) class can now be used to communicate with the peer.
     * @type {Integer (Int32)}
     */
    static Completed => 3

    /**
     * The connection was stopped before it was completed.
     * @type {Integer (Int32)}
     */
    static Canceled => 4

    /**
     * An error prevented a successful connection.
     * @type {Integer (Int32)}
     */
    static Failed => 5
}
