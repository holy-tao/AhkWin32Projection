#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The reason why a [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) occurred.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitytriggerreason
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketActivityTriggerReason extends Win32Enum{

    /**
     * No reason why a  occurred is available.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A packet was received by the socket brokering service for a [StreamSocket](streamsocket.md) or [DatagramSocket](datagramsocket.md).
     * @type {Integer (Int32)}
     */
    static SocketActivity => 1

    /**
     * A connection was accepted by the socket brokering service for a [StreamSocketListener](streamsocketlistener.md).
     * @type {Integer (Int32)}
     */
    static ConnectionAccepted => 2

    /**
     * The keep-alive timer expired on a [StreamSocket](streamsocket.md).
     * @type {Integer (Int32)}
     */
    static KeepAliveTimerExpired => 3

    /**
     * A [StreamSocket](streamsocket.md) was closed.
     * @type {Integer (Int32)}
     */
    static SocketClosed => 4
}
