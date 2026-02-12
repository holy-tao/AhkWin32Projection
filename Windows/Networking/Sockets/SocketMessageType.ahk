#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a message for a [MessageWebSocket](messagewebsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketmessagetype
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketMessageType extends Win32Enum{

    /**
     * The message type is binary.
     * @type {Integer (Int32)}
     */
    static Binary => 0

    /**
     * The message type is UTF-8 text.
     * @type {Integer (Int32)}
     */
    static Utf8 => 1
}
