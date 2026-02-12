#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServerMessageWebSocket.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ServerMessageWebSocket.ahk
#Include .\MessageWebSocketMessageReceivedEventArgs.ahk
#Include .\WebSocketClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports network communication that allows reading and writing whole messages using a WebSocket object owned by a web server. You can't register for an arbitrary WebSocket connection; instead, an instance of **ServerMessageWebSocket** is created by system code such as the [Windows Device Portal](/windows/uwp/debug-test-perf/device-portal) (WDP).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ServerMessageWebSocket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IServerMessageWebSocket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IServerMessageWebSocket.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets socket control data on a [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocket.control
     * @type {ServerMessageWebSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * Gets socket information on a [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocket.information
     * @type {ServerMessageWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Gets the output stream to write to the remote network destination on a [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * An event that indicates that a message was received on the [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * @type {TypedEventHandler<ServerMessageWebSocket, MessageWebSocketMessageReceivedEventArgs>}
    */
    OnMessageReceived {
        get {
            if(!this.HasProp("__OnMessageReceived")){
                this.__OnMessageReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6e66714b-94d1-5c08-b2b3-10b891d08747}"),
                    ServerMessageWebSocket,
                    MessageWebSocketMessageReceivedEventArgs
                )
                this.__OnMessageReceivedToken := this.add_MessageReceived(this.__OnMessageReceived.iface)
            }
            return this.__OnMessageReceived
        }
    }

    /**
     * Occurs when a close frame is received on the [ServerMessageWebSocket](servermessagewebsocket.md) object as part of the close handshake.
     * @type {TypedEventHandler<ServerMessageWebSocket, WebSocketClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cae65204-b986-5cf3-87ea-b67b00fba78d}"),
                    ServerMessageWebSocket,
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
        if(this.HasProp("__OnMessageReceivedToken")) {
            this.remove_MessageReceived(this.__OnMessageReceivedToken)
            this.__OnMessageReceived.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<ServerMessageWebSocket, MessageWebSocketMessageReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(value) {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.add_MessageReceived(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(token) {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.remove_MessageReceived(token)
    }

    /**
     * 
     * @returns {ServerMessageWebSocketControl} 
     */
    get_Control() {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.get_Control()
    }

    /**
     * 
     * @returns {ServerMessageWebSocketInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.get_Information()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.get_OutputStream()
    }

    /**
     * 
     * @param {TypedEventHandler<ServerMessageWebSocket, WebSocketClosedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(value) {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.add_Closed(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.remove_Closed(token)
    }

    /**
     * Closes the [ServerMessageWebSocket](servermessagewebsocket.md) object and indicates a reason for the closure.
     * @param {Integer} code Status code indicating the reason for closure. The list of appropriate codes is on the IANA (Internet Assigned Numbers Authority) WebSocket Protocol [Registry](https://www.iana.org/assignments/websocket/websocket.xml#close-code-number) and is also documented on [MDN](https://developer.mozilla.org/docs/Web/API/CloseEvent).
     * @param {HSTRING} reason Optional UTF-8-encoded data with additional information about the closure.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocket.close
     */
    CloseWithStatus(code, reason) {
        if (!this.HasProp("__IServerMessageWebSocket")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocket := IServerMessageWebSocket(outPtr)
        }

        return this.__IServerMessageWebSocket.CloseWithStatus(code, reason)
    }

    /**
     * Closes the [ServerMessageWebSocket](servermessagewebsocket.md) object and sends an empty close frame to the server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocket.close
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
