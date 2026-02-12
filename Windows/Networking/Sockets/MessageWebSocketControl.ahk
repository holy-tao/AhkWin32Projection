#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMessageWebSocketControl.ahk
#Include .\IWebSocketControl.ahk
#Include .\IWebSocketControl2.ahk
#Include .\IMessageWebSocketControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket control data on a [MessageWebSocket](messagewebsocket.md).
 * @remarks
 * The MessageWebSocketControl class provides access to advanced socket control data on a [MessageWebSocket](messagewebsocket.md) object.
 * 
 * A MessageWebSocketControl object is automatically created with the parent [MessageWebSocket](messagewebsocket.md) object. The [MessageWebSocket.Control](messagewebsocket_control.md) property provides access to the associated [MessageWebSocket](messagewebsocket.md) object.
 * 
 * The [SupportedProtocols](messagewebsocketcontrol_supportedprotocols.md) property gets the value of this property and can be called at any time.
 * 
 * The [MessageType](messagewebsocketcontrol_messagetype.md) property can be changed at any time before or after the [MessageWebSocket](messagewebsocket.md) is connected. This allows an app to switch between binary and UTF-8 messages when needed.
 * 
 * The [OutboundBufferSizeInBytes](messagewebsocketcontrol_outboundbuffersizeinbytes.md) property must be set before the [MessageWebSocket](messagewebsocket.md) is connected. Setting this property after the [MessageWebSocket](messagewebsocket.md) is connected has no effect.
 * 
 * Any changes to the other property values on the MessageWebSocketControl must be set before the [DatagramSocket](datagramsocket.md) is bound or connected. As a result if you need to make changes to the [MaxMessageSize](messagewebsocketcontrol_maxmessagesize.md), [ProxyCredential](messagewebsocketcontrol_proxycredential.md), [OutboundBufferSizeInBytes](messagewebsocketcontrol_outboundbuffersizeinbytes.md), or [ServerCredential](messagewebsocketcontrol_servercredential.md) properties, then these changes must occur before a successful call to the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method on the [MessageWebSocket](messagewebsocket.md).
 * 
 * The following example creates a [MessageWebSocket](messagewebsocket.md), and then demonstrates how to set the [MessageWebSocketControl.MessageType](messagewebsocketcontrol_messagetype.md) property to **binary**. (Other properties may be set in a similar manner.) After this is done, the app can connect the [MessageWebSocket](messagewebsocket.md).
 * 
 * ```csharp
 * using Windows.Networking.Sockets;
 * 
 * MessageWebSocket clientWebSocket = new MessageWebSocket();
 * 
 * // Get the current setting for this option.
 * // This isn't required, but it shows how to get the current setting.
 * SocketMessageType currentSetting = clientWebSocket.Control.MessageType;
 * 
 * // Set messageType to Binary.
 * clientWebSocket.Control.MessageType = SocketMessageType.Binary;
 * 
 * // Now you can call the ConnectAsync method to connect the MessageWebSocket.
 * ```
 * 
 * ```cppwinrt
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class MessageWebSocketControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMessageWebSocketControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMessageWebSocketControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The maximum message size, in bytes, for a WebSocket message to be configured on the [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The MaxMessageSize property is used to configure the maximum size of a WebSocket message on a [MessageWebSocket](messagewebsocket.md) object. If a message exceeds this size, [MessageReceived](messagewebsocket_messagereceived.md) event will be raised on the [MessageWebSocket](messagewebsocket.md) object, and the [GetDataReader](messagewebsocketmessagereceivedeventargs_getdatareader_509392724.md) or [GetDataStream](messagewebsocketmessagereceivedeventargs_getdatastream_1357691687.md) method on the [MessageWebSocketMessageReceivedEventArgs](messagewebsocketmessagereceivedeventargs.md) callback parameter will fail (with an error code indicating that the maximum message size has been exceeded).
     * 
     * The default value for the MaxMessageSize property is INFINITE.
     * 
     * The MaxMessageSize property can only be set before calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method on the [MessageWebSocket](messagewebsocket.md) object. If the [MessageWebSocket](messagewebsocket.md) is already connected, an attempt to set this property will return an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.maxmessagesize
     * @type {Integer} 
     */
    MaxMessageSize {
        get => this.get_MaxMessageSize()
        set => this.put_MaxMessageSize(value)
    }

    /**
     * The WebSocket message type to be configured on a [MessageWebSocket](messagewebsocket.md) object for write operations.
     * @remarks
     * A WebSocket message on the [MessageWebSocket](messagewebsocket.md) object can be either a binary message or a UTF-8 message. The default value is [SocketMessageType.Binary](socketmessagetype.md).
     * 
     * This property only affects write operations on [OutputStream](messagewebsocket_outputstream.md). It does not affect the format of received messages.
     * 
     * The MessageType property can be changed at any time. This allows an app to switch between binary and UTF-8 messages when needed.
     * 
     * Before changing the MessageType on a bound or connected [MessageWebSocket](messagewebsocket.md), any outgoing packets should first be flushed to ensure that all previously-written data is sent out with the previous message type
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
        set => this.put_MessageType(value)
    }

    /**
     * The size, in bytes, of the send buffer to be used for sending data on a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The OutboundBufferSizeInBytes property sets the value of the **SO_SNDBUF** socket option on the TCP socket used by the [MessageWebSocket](messagewebsocket.md). The default value is the local computer's default send buffer size. This value varies based on the system memory size. For more detailed information, see [SOL_SOCKET Socket Options](/windows/desktop/WinSock/sol-socket-socket-options) in the Windows Sockets documentation.
     * 
     * For most apps, this property should not be set since this disables TCP send auto-tuning by the system on this [MessageWebSocket](messagewebsocket.md) object. With TCP send auto-tuning disabled, network throughput is often worse especially on a connections with high latency. So this property should only be used in very specific situations.
     * 
     * The OutboundBufferSizeInBytes property must be set before the [MessageWebSocket](messagewebsocket.md) is connected. Setting this property after the [MessageWebSocket](messagewebsocket.md) is connected has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.outboundbuffersizeinbytes
     * @type {Integer} 
     */
    OutboundBufferSizeInBytes {
        get => this.get_OutboundBufferSizeInBytes()
        set => this.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * The credential to use to authenticate to the WebSocket server through HTTP header authentication using a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The ServerCredential property must be set before calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method on the [MessageWebSocket](messagewebsocket.md) object. An attempt to set the ServerCredential property after calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * The credential to use to authenticate to the proxy server through HTTP header authentication using a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * The ProxyCredential property must be set before calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method on the [MessageWebSocket](messagewebsocket.md) object. An attempt to set the ProxyCredential property after calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets a collection that can be used to add a list of supported sub-protocols that will be advertised to the server during the connect handshake.
     * @remarks
     * The SupportedProtocols property contains a collection of WebSocket sub-protocols supported by the [MessageWebSocket](messagewebsocket.md) object. Before calling the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method, additional supported sub-protocol strings can be added to this collection, which will be sent to the server in the "Sec-WebSocket-Protocol" header during the WebSocket handshake. The mutually supported sub-protocol chosen by the WebSocket server will then be exposed on the [Protocol](messagewebsocketinformation_protocol.md) property.
     * 
     * An attempt to add a sub-protocol to this collection after a successful call to [ConnectAsync](messagewebsocket_connectasync_682685111.md) method will not result in an error but the new value is ignored. However, if the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method call or the connect operation completes with an error, an app can update the collection stored in the SupportedProtocols property and retry the [ConnectAsync](messagewebsocket_connectasync_682685111.md) method call and the new value will be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.supportedprotocols
     * @type {IVector<HSTRING>} 
     */
    SupportedProtocols {
        get => this.get_SupportedProtocols()
    }

    /**
     * Gets a list of ignorable server certificate errors. Get this list and add [ChainValidationResult](../windows.security.cryptography.certificates/chainvalidationresult.md) values for server certificate errors that you wish to ignore during the secure WebSocket (**wss:///* protocol) server certificate validation process.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.ignorableservercertificateerrors
     * @type {IVector<Integer>} 
     */
    IgnorableServerCertificateErrors {
        get => this.get_IgnorableServerCertificateErrors()
    }

    /**
     * Allows an app to get and set the desired unsolicited WebSocket PONG interval.
     * @remarks
     * This terminology is defined in WebSocket RFC 6455, which is the time between unsolicited Pong control frames sent by the client to the server. The PONG serves as a unidirectional heartbeat and can be used for the client to determine network connection issues.  
     * 
     * > [!NOTE]
     * > Setting the DesiredUnsolicitedPongInterval on a MessageWebSocket associated with a [ControlChannelTrigger](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger) is not supported. Setting the property does not change the actual interval.
     * 
     * > Even though a custom unsolicited PONG interval is not supported with a [ControlChannelTrigger](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger) WebSocket, the [ControlChannelTrigger](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger) is impacted by two types of keep-alive intervals  (1) network keep-alive interval and (2) server keep-alive interval. See [ControlChannelTrigger Remarks](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger#Remarks) for details. The server keep-alive interval can be configured through ControlChannelTrigger’s [ServerKeepAliveIntervalInMinutes](/uwp/api/windows.networking.sockets.controlchanneltrigger.ServerKeepAliveIntervalInMinutes) property while implementing application level PONGs.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.desiredunsolicitedponginterval
     * @type {TimeSpan} 
     */
    DesiredUnsolicitedPongInterval {
        get => this.get_DesiredUnsolicitedPongInterval()
        set => this.put_DesiredUnsolicitedPongInterval(value)
    }

    /**
     * Allows an app to get the actual unsolicited WebSocket PONG interval.
     * @remarks
     * This terminology is defined in WebSocket RFC 6455, which is the time between unsolicited Pong control frames sent by the client to the server. The PONG serves as a unidirectional heartbeat and can be used for the client to determine network connection issues.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.actualunsolicitedponginterval
     * @type {TimeSpan} 
     */
    ActualUnsolicitedPongInterval {
        get => this.get_ActualUnsolicitedPongInterval()
    }

    /**
     * Allows clients to control receiving either complete or partial messages.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.receivemode
     * @type {Integer} 
     */
    ReceiveMode {
        get => this.get_ReceiveMode()
        set => this.put_ReceiveMode(value)
    }

    /**
     * Gets the certificate provided by the client when a secure WebSocket connection has been established.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketcontrol.clientcertificate
     * @type {Certificate} 
     */
    ClientCertificate {
        get => this.get_ClientCertificate()
        set => this.put_ClientCertificate(value)
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
    get_MaxMessageSize() {
        if (!this.HasProp("__IMessageWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl := IMessageWebSocketControl(outPtr)
        }

        return this.__IMessageWebSocketControl.get_MaxMessageSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxMessageSize(value) {
        if (!this.HasProp("__IMessageWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl := IMessageWebSocketControl(outPtr)
        }

        return this.__IMessageWebSocketControl.put_MaxMessageSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        if (!this.HasProp("__IMessageWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl := IMessageWebSocketControl(outPtr)
        }

        return this.__IMessageWebSocketControl.get_MessageType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageType(value) {
        if (!this.HasProp("__IMessageWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl := IMessageWebSocketControl(outPtr)
        }

        return this.__IMessageWebSocketControl.put_MessageType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundBufferSizeInBytes() {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.get_OutboundBufferSizeInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundBufferSizeInBytes(value) {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.get_ServerCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ServerCredential(value) {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.put_ServerCredential(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.get_ProxyCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(value) {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.put_ProxyCredential(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedProtocols() {
        if (!this.HasProp("__IWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl := IWebSocketControl(outPtr)
        }

        return this.__IWebSocketControl.get_SupportedProtocols()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_IgnorableServerCertificateErrors() {
        if (!this.HasProp("__IWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketControl2 := IWebSocketControl2(outPtr)
        }

        return this.__IWebSocketControl2.get_IgnorableServerCertificateErrors()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredUnsolicitedPongInterval() {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.get_DesiredUnsolicitedPongInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredUnsolicitedPongInterval(value) {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.put_DesiredUnsolicitedPongInterval(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ActualUnsolicitedPongInterval() {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.get_ActualUnsolicitedPongInterval()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReceiveMode() {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.get_ReceiveMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReceiveMode(value) {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.put_ReceiveMode(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.get_ClientCertificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        if (!this.HasProp("__IMessageWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IMessageWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageWebSocketControl2 := IMessageWebSocketControl2(outPtr)
        }

        return this.__IMessageWebSocketControl2.put_ClientCertificate(value)
    }

;@endregion Instance Methods
}
