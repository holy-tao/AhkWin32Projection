#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the quality of service for a [DatagramSocket](datagramsocket.md) or [StreamSocket](streamsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketqualityofservice
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketQualityOfService extends Win32Enum{

    /**
     * Normal quality of service.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Low latency quality of service commonly used for audio.
     * @type {Integer (Int32)}
     */
    static LowLatency => 1
}
