#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMessageWebSocketMessageReceivedEventArgs.ahk
#Include .\IMessageWebSocketMessageReceivedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a message received event on a [MessageWebSocket](messagewebsocket.md).
 * @remarks
 * The MessageWebSocketMessageReceivedEventArgs is used to receive data on a [MessageWebSocket](messagewebsocket.md) object.
 * 
 * A [MessageWebSocket.MessageReceived](messagewebsocket_messagereceived.md) event occurs on a [MessageWebSocket](messagewebsocket.md) when a message is received. A MessageWebSocketMessageReceivedEventArgs instance is created when the [MessageWebSocket.MessageReceived](messagewebsocket_messagereceived.md) event occurs.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketmessagereceivedeventargs
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class MessageWebSocketMessageReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMessageWebSocketMessageReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMessageWebSocketMessageReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the message received by a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The WebSocket protocol currently supports two message types: UTF-8 and binary messages. If a message is sent as a binary message, it is up to the app to correctly interpret the binary data. Note that it is perfectly legal to return a binary message where the binary data is a UTF-8 string.
     * 
     * The value of MessageType property is informative. It does not affect what methods are supported on the returned data by the [MessageWebSocket](messagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketmessagereceivedeventargs.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Allow clients to query if a MessageReceived callback indicates the received message is complete or just a partial message.
     * @remarks
     * This flag is always true if ReceiveMode is FullMessage mode (the default), but only true for the last (for a given set of fragments) MessageReceive callback in the new PartialMessage mode.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketmessagereceivedeventargs.ismessagecomplete
     * @type {Boolean} 
     */
    IsMessageComplete {
        get => this.get_IsMessageComplete()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        if (!this.HasProp("__IMessageWebSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketMessageReceivedEventArgs := IMessageWebSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IMessageWebSocketMessageReceivedEventArgs.get_MessageType()
    }

    /**
     * Gets a [DataReader](../windows.storage.streams/datareader.md) object to read incoming data received from the remote network destination on a [MessageWebSocket](messagewebsocket.md).
     * @remarks
     * If the underlying TCP connection is suddenly terminated, GetDataReader throws the WININET_E_CONNECTION_ABORTED exception.
     * 
     * An empty message results in GetDataReader returning a valid [IDataReader](../windows.storage.streams/idatareader.md) instance with [UnconsumedBufferLength](../windows.storage.streams/idatareader_unconsumedbufferlength.md) set to 0.
     * @returns {DataReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketmessagereceivedeventargs.getdatareader
     */
    GetDataReader() {
        if (!this.HasProp("__IMessageWebSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketMessageReceivedEventArgs := IMessageWebSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IMessageWebSocketMessageReceivedEventArgs.GetDataReader()
    }

    /**
     * Gets an [IInputStream](../windows.storage.streams/iinputstream.md) object (a message represented as a sequential stream of bytes) from the remote network destination on a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * If the underlying TCP connection is suddenly terminated, GetDataStream throws the WININET_E_CONNECTION_ABORTED exception.
     * 
     * An empty message results in GetDataStream returning a valid [IInputStream](../windows.storage.streams/iinputstream.md) instance that yields zero bytes.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketmessagereceivedeventargs.getdatastream
     */
    GetDataStream() {
        if (!this.HasProp("__IMessageWebSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketMessageReceivedEventArgs := IMessageWebSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IMessageWebSocketMessageReceivedEventArgs.GetDataStream()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMessageComplete() {
        if (!this.HasProp("__IMessageWebSocketMessageReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketMessageReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketMessageReceivedEventArgs2 := IMessageWebSocketMessageReceivedEventArgs2(outPtr)
        }

        return this.__IMessageWebSocketMessageReceivedEventArgs2.get_IsMessageComplete()
    }

;@endregion Instance Methods
}
