#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamWebSocket.ahk
#Include .\IWebSocket.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IStreamWebSocket2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WebSocketClosedEventArgs.ahk
#Include .\StreamWebSocket.ahk
#Include .\WebSocketServerCustomValidationRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports network communication that allows reading and writing streams using a WebSocket.
 * @remarks
 * The StreamWebSocket class provides a stream-based abstraction of the message-based [WebSocket protocol](https://tools.ietf.org/html/rfc6455). This is useful for scenarios in which large files (such as photos or movies) need to be transferred. Using StreamWebSocket allows sections of a message to be read with each read operation, rather than requiring the entire message to be read in a single operation (as with [MessageWebSocket](messagewebsocket.md)).
 * 
 * StreamWebSocket only supports binary messages. For UTF-8 messages, [MessageWebSocket](messagewebsocket.md) must be used.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamWebSocket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamWebSocket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamWebSocket.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets socket control data on a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The Control property gets the [StreamWebSocketControl](streamwebsocketcontrol.md) instance associated with a [StreamWebSocket](streamwebsocket.md) object.
     * 
     * A [StreamWebSocketControl](streamwebsocketcontrol.md) object is automatically created with the parent [StreamWebSocket](streamwebsocket.md) object. The [StreamWebSocketControl](streamwebsocketcontrol.md) instance can then be used to get or set control data used by the [StreamWebSocket](streamwebsocket.md) object. These properties on the [MessageWebSocketControl](messagewebsocketcontrol.md) instance include the following:
     * 
     * 
     * + [NoDelay](streamwebsocketcontrol_nodelay.md) - A value that indicates whether the Nagle algorithm is used on a [StreamWebSocket](streamwebsocket.md) object.
     * + [OutboundBufferSizeInBytes](streamwebsocketcontrol_outboundbuffersizeinbytes.md) - The size, in bytes, of the send buffer to be used for sending data on a [StreamWebSocket](streamwebsocket.md) object.
     * + [ProxyCredential](streamwebsocketcontrol_proxycredential.md) - The credential to use to authenticate to the proxy server through HTTP header authentication using a [StreamWebSocket](streamwebsocket.md) object.
     * + [ServerCredential](streamwebsocketcontrol_servercredential.md) - The credential to use to authenticate to the WebSocket server through HTTP header authentication using a [StreamWebSocket](streamwebsocket.md) object.
     * + [SupportedProtocols](streamwebsocketcontrol_supportedprotocols.md) - Gets a collection that can be used to add a list of supported sub-protocols that will be advertised to the server during the connect handshake.
     * 
     * 
     * Any changes to the [StreamWebSocketControl](streamwebsocketcontrol.md) property values must be set before the [StreamWebSocket](streamwebsocket.md) is connected. As a result if you need to make changes to the [NoDelay](streamwebsocketcontrol_nodelay.md), [OutboundBufferSizeInBytes](streamwebsocketcontrol_outboundbuffersizeinbytes.md), [ProxyCredential](streamwebsocketcontrol_proxycredential.md), [ServerCredential](streamwebsocketcontrol_servercredential.md), or [SupportedProtocols](streamwebsocketcontrol_supportedprotocols.md) properties, then these changes must occur before a successful call to the [ConnectAsync](streamsocket_connectasync_13692504.md) method on the [StreamWebSocket](streamwebsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.control
     * @type {StreamWebSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * Gets socket information on a [StreamWebSocket](streamwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.information
     * @type {StreamWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Gets the input stream to read from the remote destination on a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * This property is used with the [DataReader](../windows.storage.streams/datareader.md) object to read incoming data received from the remote network destination on a socket object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * Gets the output stream to write to the remote network destination on a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * This property is used with the [DataWriter](../windows.storage.streams/datawriter.md) object to write outgoing data to be sent to the remote network destination on a [StreamWebSocket](streamwebsocket.md) object.
     * 
     * The following specific errors can occur when you call [IOutputStream.FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) on the OutputStream of a [StreamWebSocket](streamwebsocket.md) if the websocket is in an invalid state at the time.
     * 
     * 
     * + If the websocket instance has been explicitly closed (via delete, **Dispose**, or **Close**) or implicitly closed (fallen out of scope), [FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) throws an **RO_E_CLOSED** exception.
     * + If the IOutputStream object associated with the websocket has been explicitly closed (via delete, **Dispose**, or **Close**) or implicitly closed (for example, by disposing of a [DataWriter](../windows.storage.streams/datawriter.md) instance before calling [DetachStream](../windows.storage.streams/datawriter_detachstream_464403539.md) on it), [FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) throws an **RO_E_CLOSED** exception.
     * + If the websocket is not connected yet ([ConnectAsync](streamwebsocket_connectasync_682685111.md) has not been called), then [FlushAsync](../windows.storage.streams/ioutputstream_flushasync_491532439.md) throws an **E_ILLEGAL_METHOD_CALL** exception.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * Occurs when a close frame is received on the [StreamWebSocket](streamwebsocket.md) object as part of the close handshake.
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
     * Occurs when a new [StreamWebSocket](streamwebsocket.md) connection to a secured server URI (**wss:** protocol) is being validated. Handle this event if you want to implement custom server validation for the connection.
     * @remarks
     * Note that this event is raised after the default OS validation has been performed successfully, and that the default OS validation includes taking the [IgnorableServerCertificateErrors](streamwebsocketcontrol_ignorableservercertificateerrors.md) control option into account.
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
     * @type {TypedEventHandler<StreamWebSocket, WebSocketServerCustomValidationRequestedEventArgs>}
    */
    OnServerCustomValidationRequested {
        get {
            if(!this.HasProp("__OnServerCustomValidationRequested")){
                this.__OnServerCustomValidationRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{18b143d3-897e-595e-acc1-ef35614b4cec}"),
                    StreamWebSocket,
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
     * Creates a new [StreamWebSocket](streamwebsocket.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.StreamWebSocket")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
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
     * @returns {StreamWebSocketControl} 
     */
    get_Control() {
        if (!this.HasProp("__IStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocket := IStreamWebSocket(outPtr)
        }

        return this.__IStreamWebSocket.get_Control()
    }

    /**
     * 
     * @returns {StreamWebSocketInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocket := IStreamWebSocket(outPtr)
        }

        return this.__IStreamWebSocket.get_Information()
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__IStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocket := IStreamWebSocket(outPtr)
        }

        return this.__IStreamWebSocket.get_InputStream()
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
     * Starts an asynchronous operation to connect to a remote network destination on a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The ConnectAsync method initiates the WebSocket handshake with a remote network destination, and then negotiates the subprotocol.
     * 
     * For WebSocket connections over TCP, use the **ws:///* scheme in the *uri*. For secure WebSocket connections over TLS/SSL, use the **wss:///* scheme.
     * @param {Uri} uri_ An absolute [Uri](../windows.foundation/uri.md) for the server to connect to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.connectasync
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
     * Adds an HTTP request header to the HTTP request message used in the WebSocket protocol handshake by the [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The SetRequestHeader method must be called prior to calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method. Calling the SetRequestHeader method after calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method will result in an error.
     * 
     * Using the SetRequestHeader method to add a **Sec-WebSocket-Extensions** header is not supported.
     * @param {HSTRING} headerName The name of the request header.
     * @param {HSTRING} headerValue The value of the request header.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.setrequestheader
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
     * Closes the [StreamWebSocket](streamwebsocket.md) and indicates a reason for the closure.
     * @param {Integer} code Status code indicating the reason for closure.
     * @param {HSTRING} reason Optional UTF-8-encoded data with additional information about the closure.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.close
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
     * Closes the [StreamWebSocket](streamwebsocket.md) and sends an empty close frame to the server.
     * @remarks
     * The Close method is used by Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the Close method is exposed as the  method on the [StreamWebSocket](streamwebsocket.md). For apps written in C++, the Close method will be called when using the delete keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocket.close
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
     * @param {TypedEventHandler<StreamWebSocket, WebSocketServerCustomValidationRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ServerCustomValidationRequested(eventHandler) {
        if (!this.HasProp("__IStreamWebSocket2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocket2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocket2 := IStreamWebSocket2(outPtr)
        }

        return this.__IStreamWebSocket2.add_ServerCustomValidationRequested(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ServerCustomValidationRequested(eventCookie) {
        if (!this.HasProp("__IStreamWebSocket2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocket2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocket2 := IStreamWebSocket2(outPtr)
        }

        return this.__IStreamWebSocket2.remove_ServerCustomValidationRequested(eventCookie)
    }

;@endregion Instance Methods
}
