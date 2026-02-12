#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the kind of socket object being transferred to or from the socket broker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitykind
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketActivityKind extends Win32Enum{

    /**
     * The socket type is unknown.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A socket type of [StreamSocketListener](streamsocketlistener.md).
     * @type {Integer (Int32)}
     */
    static StreamSocketListener => 1

    /**
     * A socket type of [DatagramSocket](datagramsocket.md).
     * @type {Integer (Int32)}
     */
    static DatagramSocket => 2

    /**
     * A socket type of [StreamSocket](streamsocket.md).
     * @type {Integer (Int32)}
     */
    static StreamSocket => 3
}
