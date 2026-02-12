#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMessageWebSocket.ahk
#Include .\IWebSocket.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMessageWebSocket2.ahk
#Include .\IMessageWebSocket3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MessageWebSocket.ahk
#Include .\MessageWebSocketMessageReceivedEventArgs.ahk
#Include .\WebSocketClosedEventArgs.ahk
#Include .\WebSocketServerCustomValidationRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports network communication that allows reading and writing whole messages using a WebSocket.
 * @remarks
 * The MessageWebSocket class provides a message-based abstraction of the [WebSocket protocol](https://tools.ietf.org/html/rfc6455). When using MessageWebSocket, the entire WebSocket message is read or written in a single operation. In contrast, the [StreamWebSocket](streamwebsocket.md) allows sections of a message to be read with each read operation, rather than requiring the entire message to be read in a single operation.
 * 
 * For UTF-8 messages, MessageWebSocket must be used. [StreamWebSocket](streamwebsocket.md) only supports binary messages.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class MessageWebSocket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMessageWebSocket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMessageWebSocket.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets socket control data on a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The Control property gets the [MessageWebSocketControl](messagewebsocketcontrol.md) instance associated with a [MessageWebSocket](messagewebsocket.md) object.
     * 
     * A [MessageWebSocketControl](messagewebsocketcontrol.md) object is automatically created with the parent [MessageWebSocket](messagewebsocket.md) object. The [MessageWebSocketControl](messagewebsocketcontrol.md) instance can then be used to get or set control data used by the [MessageWebSocket](messagewebsocket.md) object. These properties on the [MessageWebSocketControl](messagewebsocketcontrol.md) instance include the following:
     * 
     * 
     * + [MaxMessageSize](messagewebsocketcontrol_maxmessagesize.md) - The maximum message size, in bytes, for a WebSocket message to be configured on the [MessageWebSocket](messagewebsocket.md) object.
     * + [MessageType](messagewebsocketcontrol_messagetype.md) - The WebSocket message type to be configured on a [MessageWebSocket](messagewebsocket.md) object for write operations.
     * + [OutboundBufferSizeInBytes](messagewebsocketcontrol_outboundbuffersizeinbytes.md) - The size, in bytes, of the send buffer to be used for sending data on a [MessageWebSocket](messagewebsocket.md) object.
     * + [ProxyCredential](messagewebsocketcontrol_proxycredential.md) - The credential to use to authenticate to the proxy server through HTTP header authentication using a [MessageWebSocket](messagewebsocket.md) object.
     * + [ServerCredential](messagewebsocketcontrol_servercredential.md) - The credential to use to authenticate to the WebSocket server through HTTP header authentication using a [MessageWebSocket](messagewebsocket.md) object.
     * + [SupportedProtocols](messagewebsocketcontrol_supportedprotocols.md) - Gets a collection that can be used to add a list of supported sub-protocols that will be advertised to the server during the connect handshake.
     * 
     * 
     * The [SupportedProtocols](messagewebsocketcontrol_supportedprotocols.md) property gets the value of this property and can be called at any time.
     * 
     * The [MessageType](messagewebsocketcontrol_messagetype.md) property can be changed at any time before or after the [MessageWebSocket](messagewebsocket.md) is connected. This allows an app to switch between binary and UTF-8 messages when needed.
     * 
     * The [OutboundBufferSizeInBytes](messagewebsocketcontrol_outboundbuffersizeinbytes.md) property must be set before the [MessageWebSocket](messagewebsocket.md) is connected. Setting this property after the [MessageWebSocket](messagewebsocket.md) is connected has no effect.
     * 
     * Changes to any other property values on the [MessageWebSocketControl](messagewebsocketcontrol.md) must be set before the [MessageWebSocket](messagewebsocket.md) is connected. As a result if you need to make changes to the [MaxMessageSize](messagewebsocketcontrol_maxmessagesize.md), [OutboundBufferSizeInBytes](messagewebsocketcontrol_outboundbuffersizeinbytes.md), [ProxyCredential](messagewebsocketcontrol_proxycredential.md), or [ServerCredential](messagewebsocketcontrol_servercredential.md) properties, then these changes must occur before a successful call to the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method on the [MessageWebSocket](messagewebsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.control
     * @type {MessageWebSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * Gets socket information on a [MessageWebSocket](messagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.information
     * @type {MessageWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Gets the output stream to write to the remote network destination on a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * This property is used with the [DataWriter](../windows.storage.streams/datawriter.md) object to write outgoing data to be sent to the remote network destination on a socket object.
     * 
     * The following specific errors can occur when you call [IOutputStream.FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) on the OutputStream of a [MessageWebSocket](messagewebsocket.md) if the websocket is in an invalid state at the time.
     * 
     * 
     * + If the websocket instance has been explicitly closed (via delete, **Dispose**, or **Close**) or implicitly closed (fallen out of scope), [FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) throws an **RO_E_CLOSED** exception.
     * + If the IOutputStream object associated with the websocket has been explicitly closed (via delete, **Dispose**, or **Close**) or implicitly closed (for example, by disposing of a [DataWriter](../windows.storage.streams/datawriter.md) instance before calling [DetachStream](../windows.storage.streams/datawriter_detachstream_464403539.md) on it), [FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) throws an **RO_E_CLOSED** exception.
     * + If the websocket is not connected yet ([ConnectAsync](messagewebsocket_connectasync_682685111.md) has not been called), then [FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) throws an **E_ILLEGAL_METHOD_CALL** exception.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * An event that indicates that a message was received on the [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * All message processing and connection related errors are communicated through the [GetDataReader](messagewebsocketmessagereceivedeventargs_getdatareader_509392724.md) and [GetDataStream](messagewebsocketmessagereceivedeventargs_getdatastream_1357691687.md) methods. If either of these methods throws an exception, it indicates that either the underlying connection is broken, or the server has sent invalid data, such as corrupt HTTP headers or a message that exceeds the maximum message size. The appropriate action for your code to take in the face of an exception from these methods is to re-establish a known good state by closing the websocket, creating a new one, and reconnecting to the server.
     * 
     * All MessageReceived event handlers must be registered before [ConnectAsync](iwebsocket_connectasync_682685111.md) is called. After that, attempting to add or remove a [MessageReceived](messagewebsocket_messagereceived.md) event handler will fail with E_ILLEGAL_METHOD_CALL, even after the socket has been closed
     * 
     * An empty message results in [GetDataReader](messagewebsocketmessagereceivedeventargs_getdatareader_509392724.md) returning a valid [IDataReader](../windows.storage.streams/idatareader.md) instance with [UnconsumedBufferLength](../windows.storage.streams/idatareader_unconsumedbufferlength.md) set to 0. [GetDataStream](messagewebsocketmessagereceivedeventargs_getdatastream_1357691687.md) returns a valid [IInputStream](../windows.storage.streams/iinputstream.md) instance that yields zero bytes.
     * @type {TypedEventHandler<MessageWebSocket, MessageWebSocketMessageReceivedEventArgs>}
    */
    OnMessageReceived {
        get {
            if(!this.HasProp("__OnMessageReceived")){
                this.__OnMessageReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{de980538-6dcd-52b0-802f-4b6cf59a01ab}"),
                    MessageWebSocket,
                    MessageWebSocketMessageReceivedEventArgs
                )
                this.__OnMessageReceivedToken := this.add_MessageReceived(this.__OnMessageReceived.iface)
            }
            return this.__OnMessageReceived
        }
    }

    /**
     * Occurs when a close frame is received on the [MessageWebSocket](messagewebsocket.md) object as part of the close handshake.
     * @remarks
     * This event is only triggered if a close frame is received from the server or if [Close](messagewebsocket_close_294895258.md) is explicitly called on the local socket. If the underlying TCP connection is suddenly terminated, [GetDataReader](messagewebsocketmessagereceivedeventargs_getdatareader_509392724.md) and/or [GetDataStream](messagewebsocketmessagereceivedeventargs_getdatastream_1357691687.md) throw the WININET_E_CONNECTION_ABORTED exception, without the Close event ever being raised.
     * 
     * Your code should handle aborted connections by first closing and disposing of the current [MessageWebSocket](messagewebsocket.md) object (as it is now useless), and then performing whatever other steps are appropriate for your app, such as creating a new MessageWebSocket and trying to connect again.
     * @type {TypedEventHandler<IWebSocket, WebSocketClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{03cf8f90-1669-5f4d-9404-2b784678e6dd}"),
                    IWebSocket,
                    WebSocketClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when a new [MessageWebSocket](messagewebsocket.md) connection to a secured server URI (**wss:** protocol) is being validated. Handle this event if you want to implement custom server validation for the connection.
     * @remarks
     * Note that this event is raised after the default OS validation has been performed successfully, and that the default OS validation includes taking the [IgnorableServerCertificateErrors](messagewebsocketcontrol_ignorableservercertificateerrors.md) control option into account.
     * 
     * Use the [WebSocketServerCustomValidationRequestedEventArgs](websocketservercustomvalidationrequestedeventargs.md) properties to access the server certificate and intermediate certificates being offered for validation.
     * 
     * In order to ensure proper completion, if your custom validation process involves any async operations, be sure to use the [WebSocketServerCustomValidationRequestedEventArgs.GetDeferral](websocketservercustomvalidationrequestedeventargs_getdeferral_254836512.md) method to get a deferral object that your event handler holds for the duration of the validation operation. When your validation is complete, you must call [Deferral.Complete](../windows.foundation/deferral_complete_1807836922.md) whether you accept or reject validation.
     * 
     * As an example of the kind of validation you can do in this event handler: you could compare the server certificate to a locally stored trusted certificate that matches the expected server certificate. In your event handler, you would compare the SHA-256 hash of the local certificate to the hash of the server certificate. If the hash values match, then the certificates are assumed to match, and server validation should succeed. If the hash values don't match, then the certificates don't match and validation should fail.
     * 
     * To indicate validation failure, call the [WebSocketServerCustomValidationRequestedEventArgs.Reject](websocketservercustomvalidationrequestedeventargs_reject_731021879.md) method. To indicate validation success, simply return from the event handler.
     * 
     * Note that whether validation succeeds or fails, you must call [Deferral.Complete](../windows.foundation/deferral_complete_1807836922.md) on the deferral object you acquired when you started the validation process.
     * @type {TypedEventHandler<MessageWebSocket, WebSocketServerCustomValidationRequestedEventArgs>}
    */
    OnServerCustomValidationRequested {
        get {
            if(!this.HasProp("__OnServerCustomValidationRequested")){
                this.__OnServerCustomValidationRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2c34c585-9cf6-56c7-8dd1-5da26e322078}"),
                    MessageWebSocket,
                    WebSocketServerCustomValidationRequestedEventArgs
                )
                this.__OnServerCustomValidationRequestedToken := this.add_ServerCustomValidationRequested(this.__OnServerCustomValidationRequested.iface)
            }
            return this.__OnServerCustomValidationRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [MessageWebSocket](messagewebsocket.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.MessageWebSocket")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageReceivedToken")) {
            this.remove_MessageReceived(this.__OnMessageReceivedToken)
            this.__OnMessageReceived.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnServerCustomValidationRequestedToken")) {
            this.remove_ServerCustomValidationRequested(this.__OnServerCustomValidationRequestedToken)
            this.__OnServerCustomValidationRequested.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {MessageWebSocketControl} 
     */
    get_Control() {
        if (!this.HasProp("__IMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket := IMessageWebSocket(outPtr)
        }

        return this.__IMessageWebSocket.get_Control()
    }

    /**
     * 
     * @returns {MessageWebSocketInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket := IMessageWebSocket(outPtr)
        }

        return this.__IMessageWebSocket.get_Information()
    }

    /**
     * 
     * @param {TypedEventHandler<MessageWebSocket, MessageWebSocketMessageReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(eventHandler) {
        if (!this.HasProp("__IMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket := IMessageWebSocket(outPtr)
        }

        return this.__IMessageWebSocket.add_MessageReceived(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(eventCookie) {
        if (!this.HasProp("__IMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket := IMessageWebSocket(outPtr)
        }

        return this.__IMessageWebSocket.remove_MessageReceived(eventCookie)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IWebSocket")) {
            if ((queryResult := this.QueryInterface(IWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocket := IWebSocket(outPtr)
        }

        return this.__IWebSocket.get_OutputStream()
    }

    /**
     * Starts an asynchronous operation to connect to a remote network destination on a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The ConnectAsync method initiates the WebSocket handshake with a remote network destination, and then negotiates the subprotocol.
     * 
     * For WebSocket connections over TCP, use the **ws:///* scheme in the *uri*. For secure WebSocket connections over TLS/SSL, use the **wss:///* scheme.
     * @param {Uri} uri_ An absolute [Uri](../windows.foundation/uri.md) for the server to connect to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.connectasync
     */
    ConnectAsync(uri_) {
        if (!this.HasProp("__IWebSocket")) {
            if ((queryResult := this.QueryInterface(IWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocket := IWebSocket(outPtr)
        }

        return this.__IWebSocket.ConnectAsync(uri_)
    }

    /**
     * Adds an HTTP request header to the HTTP request message used in the WebSocket protocol handshake by the [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The SetRequestHeader method must be called prior to calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method. Calling the SetRequestHeader method after calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method will result in an error.
     * 
     * Using the SetRequestHeader method to add a **Sec-WebSocket-Extensions** header is not supported.
     * @param {HSTRING} headerName The name of the request header.
     * @param {HSTRING} headerValue The value of the request header.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.setrequestheader
     */
    SetRequestHeader(headerName, headerValue) {
        if (!this.HasProp("__IWebSocket")) {
            if ((queryResult := this.QueryInterface(IWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocket := IWebSocket(outPtr)
        }

        return this.__IWebSocket.SetRequestHeader(headerName, headerValue)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebSocket, WebSocketClosedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(eventHandler) {
        if (!this.HasProp("__IWebSocket")) {
            if ((queryResult := this.QueryInterface(IWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocket := IWebSocket(outPtr)
        }

        return this.__IWebSocket.add_Closed(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Closed(eventCookie) {
        if (!this.HasProp("__IWebSocket")) {
            if ((queryResult := this.QueryInterface(IWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocket := IWebSocket(outPtr)
        }

        return this.__IWebSocket.remove_Closed(eventCookie)
    }

    /**
     * Closes the [MessageWebSocket](messagewebsocket.md) object and indicates a reason for the closure.
     * @param {Integer} code Status code indicating the reason for closure. The list of appropriate codes is on the IANA (Internet Assigned Numbers Authority) WebSocket Protocol [Registry](https://www.iana.org/assignments/websocket/websocket.xml#close-code-number) and is also documented on [MDN](https://developer.mozilla.org/docs/Web/API/CloseEvent).
     * @param {HSTRING} reason Optional UTF-8-encoded data with additional information about the closure.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.close
     */
    CloseWithStatus(code, reason) {
        if (!this.HasProp("__IWebSocket")) {
            if ((queryResult := this.QueryInterface(IWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocket := IWebSocket(outPtr)
        }

        return this.__IWebSocket.CloseWithStatus(code, reason)
    }

    /**
     * Closes the [MessageWebSocket](messagewebsocket.md) object and sends an empty close frame to the server.
     * @remarks
     * The Close method is used by Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the Close method is exposed as the  method on the [MessageWebSocket](messagewebsocket.md). For apps written in C++, the Close method will be called when using the delete keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @param {TypedEventHandler<MessageWebSocket, WebSocketServerCustomValidationRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ServerCustomValidationRequested(eventHandler) {
        if (!this.HasProp("__IMessageWebSocket2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket2 := IMessageWebSocket2(outPtr)
        }

        return this.__IMessageWebSocket2.add_ServerCustomValidationRequested(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ServerCustomValidationRequested(eventCookie) {
        if (!this.HasProp("__IMessageWebSocket2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket2 := IMessageWebSocket2(outPtr)
        }

        return this.__IMessageWebSocket2.remove_ServerCustomValidationRequested(eventCookie)
    }

    /**
     * Asynchronously (with progress) writes a frame of data in a sequential stream, with the semantics that more frames will follow for the same WebSocket message (the FIN bit on this frame is set to 0). This method and [SendFinalFrameAsync](messagewebsocket_sendfinalframeasync_1210635846.md) allow you to send individual WebSocket frames.
     * @param {IBuffer} data A buffer containing the data that constitutes the frame to be sent.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.sendnonfinalframeasync
     */
    SendNonfinalFrameAsync(data) {
        if (!this.HasProp("__IMessageWebSocket3")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket3 := IMessageWebSocket3(outPtr)
        }

        return this.__IMessageWebSocket3.SendNonfinalFrameAsync(data)
    }

    /**
     * Asynchronously (with progress) writes a frame of data in a sequential stream, with the semantics that this is the last frame in a WebSocket message (the FIN bit on this frame is set to 1). This method and [SendNonfinalFrameAsync](messagewebsocket_sendnonfinalframeasync_1560905117.md) allow you to send individual WebSocket frames.
     * @param {IBuffer} data A buffer containing the data that constitutes the frame to be sent.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocket.sendfinalframeasync
     */
    SendFinalFrameAsync(data) {
        if (!this.HasProp("__IMessageWebSocket3")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocket3 := IMessageWebSocket3(outPtr)
        }

        return this.__IMessageWebSocket3.SendFinalFrameAsync(data)
    }

;@endregion Instance Methods
}
