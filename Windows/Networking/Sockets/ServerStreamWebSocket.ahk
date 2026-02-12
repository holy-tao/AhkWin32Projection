#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServerStreamWebSocket.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ServerStreamWebSocket.ahk
#Include .\WebSocketClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports network communication that allows reading and writing streams using a WebSocket object owned by a web server. You can't register for an arbitrary WebSocket connection; instead, an instance of **ServerStreamWebSocket** is created by system code such as the [Windows Device Portal](/windows/uwp/debug-test-perf/device-portal) (WDP).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ServerStreamWebSocket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IServerStreamWebSocket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IServerStreamWebSocket.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets socket information on a [ServerStreamWebSocket](serverstreamwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocket.information
     * @type {ServerStreamWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Gets the input stream to read from the remote destination on a [ServerStreamWebSocket](serverstreamwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocket.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * Gets the output stream to write to the remote network destination on a [ServerStreamWebSocket](serverstreamwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * Occurs when a close frame is received on the [ServerStreamWebSocket](serverstreamwebsocket.md) object as part of the close handshake.
     * @type {TypedEventHandler<ServerStreamWebSocket, WebSocketClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b51c5b3b-161b-559e-a553-0059336329cc}"),
                    ServerStreamWebSocket,
                    WebSocketClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {ServerStreamWebSocketInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IServerStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocket := IServerStreamWebSocket(outPtr)
        }

        return this.__IServerStreamWebSocket.get_Information()
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__IServerStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocket := IServerStreamWebSocket(outPtr)
        }

        return this.__IServerStreamWebSocket.get_InputStream()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IServerStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocket := IServerStreamWebSocket(outPtr)
        }

        return this.__IServerStreamWebSocket.get_OutputStream()
    }

    /**
     * 
     * @param {TypedEventHandler<ServerStreamWebSocket, WebSocketClosedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(value) {
        if (!this.HasProp("__IServerStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocket := IServerStreamWebSocket(outPtr)
        }

        return this.__IServerStreamWebSocket.add_Closed(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IServerStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocket := IServerStreamWebSocket(outPtr)
        }

        return this.__IServerStreamWebSocket.remove_Closed(token)
    }

    /**
     * Closes the [ServerStreamWebSocket](serverstreamwebsocket.md) object and indicates a reason for the closure.
     * @param {Integer} code Status code indicating the reason for closure. The list of appropriate codes is on the IANA (Internet Assigned Numbers Authority) WebSocket Protocol [Registry](https://www.iana.org/assignments/websocket/websocket.xml#close-code-number) and is also documented on [MDN](https://developer.mozilla.org/docs/Web/API/CloseEvent).
     * @param {HSTRING} reason Optional UTF-8-encoded data with additional information about the closure.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocket.close
     */
    CloseWithStatus(code, reason) {
        if (!this.HasProp("__IServerStreamWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocket := IServerStreamWebSocket(outPtr)
        }

        return this.__IServerStreamWebSocket.CloseWithStatus(code, reason)
    }

    /**
     * Closes the [ServerStreamWebSocket](serverstreamwebsocket.md) and sends an empty close frame to the server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocket.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
