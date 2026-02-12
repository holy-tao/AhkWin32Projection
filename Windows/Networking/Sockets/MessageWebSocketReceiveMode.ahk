#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the kind of message that the client will accept.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketreceivemode
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class MessageWebSocketReceiveMode extends Win32Enum{

    /**
     * The client will accept a full message.
     * @type {Integer (Int32)}
     */
    static FullMessage => 0

    /**
     * The client will accept a partial message.
     * @type {Integer (Int32)}
     */
    static PartialMessage => 1
}
