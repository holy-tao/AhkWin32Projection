#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamWebSocketControl.ahk
#Include .\IWebSocketControl.ahk
#Include .\IWebSocketControl2.ahk
#Include .\IStreamWebSocketControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket control data on a [StreamWebSocket](streamwebsocket.md) object.
 * @remarks
 * The StreamWebSocketControl class provides access to advanced socket control data on a [StreamWebSocket](streamwebsocket.md) object.
 * 
 * A StreamWebSocketControl object is automatically created with the parent [StreamWebSocket](streamwebsocket.md) object. The [StreamWebSocket.Control](streamwebsocket_control.md) property provides access to the associated StreamWebSocketControl object.
 * 
 * Any changes to the StreamWebSocketControl property values must be set before the [StreamWebSocket](streamwebsocket.md) is connected. As a result if you need to make changes to the [NoDelay](streamwebsocketcontrol_nodelay.md), [OutboundBufferSizeInBytes](streamwebsocketcontrol_outboundbuffersizeinbytes.md), [ProxyCredential](streamwebsocketcontrol_proxycredential.md), [ServerCredential](streamwebsocketcontrol_servercredential.md), or [SupportedProtocols](streamwebsocketcontrol_supportedprotocols.md) properties, then these changes must occur before a successful call to the [ConnectAsync](streamsocket_connectasync_13692504.md) method on the [StreamWebSocket](streamwebsocket.md).
 * 
 * The following example creates a [StreamWebSocket](streamwebsocket.md), and then demonstrates how to set the [StreamWebSocketControl.NoDelay](streamwebsocketcontrol_nodelay.md) property to **false**. (Other properties may be set in a similar manner.) After this is done, the app can connect the [StreamWebSocket](streamwebsocket.md).
 * 
 * ```csharp
 * using Windows.Networking.Sockets;
 * 
 * StreamWebSocket clientWebSocket = new StreamWebSocket();
 * 
 * // Get the current setting for this option.
 * // This isn't required, but it shows how to get the current setting.
 * bool currentSetting = clientWebSocket.Control.NoDelay;
 * 
 * // Set NoDelay to false so that the Nagle algorithm is not disabled.
 * clientWebSocket.Control.NoDelay = false;
 * 
 * // Now you can call the ConnectAsync method to connect the StreamWebSocket.
 * ```
 * 
 * ```cppwinrt
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamWebSocketControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamWebSocketControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamWebSocketControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A value that indicates whether the Nagle algorithm is used on a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The NoDelay property controls whether Nagle's algorithm is enabled or disabled on a [StreamWebSocket](streamwebsocket.md) object. The default value for the NoDelay property is **true**.
     * 
     * Nagle's algorithm is a technique to improving the efficiency of TCP/IP networks by reducing the number of packets that are needed to be sent over the network. The algorithm tries to deal with problems caused by an application that repeatedly emits data in small chunks. A TCP packet has a 40-byte header (20 bytes for IP and 20 bytes for TCP). So if an app sends only 4 bytes in a packet, the overhead on the packet data is very large. This can occur for a remote access protocol (telnet or secure shell, for example) where most key presses may generate only a single byte or two of data that is transmitted immediately. Over a slow link, many of these packets may be in transit over the network at the same time. Nagle's algorithm works by combining a number of small outgoing messages, and sending them all at once. When there is a sent packet for which the sender has received no acknowledgment, the sender keeps buffering output until it has a full packet's worth of output. This allows the output to be sent all at once. The impact of applying Nagle's algorithm is to increase the bandwidth at the expense of latency. A well-written app that buffers sends internally should not need to use Nagle's algorithm.
     * 
     * When this property is **true**, the [StreamWebSocket](streamwebsocket.md) will disable Nagle's algorithm on the TCP connection. This setting reduces the potential delays when sending small messages. When a [StreamWebSocket](streamwebsocket.md) is created, the default value for this property is **true**.
     * 
     * When this property is **false**, the [StreamWebSocket](streamwebsocket.md) will enable Nagle's algorithm on the TCP connection. This setting can increase the bandwidth at the expense of latency, but should only be used with caution. There are some adverse side effects possible when Nagle's algorithm is enabled and certain other TCP optimizations are also used.
     * 
     * This property may be set before the [StreamWebSocket](streamwebsocket.md) is connected. After the [StreamWebSocket](streamwebsocket.md) is connected, setting the property will result in an error.
     * 
     * This property sets the value of the **TCP_NODELAY** socket option on the TCP socket used by the [StreamWebSocket](streamwebsocket.md) .
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.nodelay
     * @type {Boolean} 
     */
    NoDelay {
        get => this.get_NoDelay()
        set => this.put_NoDelay(value)
    }

    /**
     * The size, in bytes, of the send buffer to be used for sending data on a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The OutboundBufferSizeInBytes property sets the value of the **SO_SNDBUF** socket option on the TCP socket used by the [StreamWebSocket](streamwebsocket.md). The default value is the local computer's default send buffer size. This value varies based on the system memory size. For more detailed information, see [SOL_SOCKET Socket Options](/windows/desktop/WinSock/sol-socket-socket-options) in the Windows Sockets documentation.
     * 
     * For most apps, this property should not be set since this disables TCP send auto-tuning by the system on this [StreamWebSocket](streamwebsocket.md) object. With TCP send auto-tuning disabled, network throughput is often worse especially on a connections with high latency. So this property should only be used in very specific situations.
     * 
     * The OutboundBufferSizeInBytes property must be set before the [StreamWebSocket](streamwebsocket.md) is connected. Setting this property after the [MessageWebSocket](messagewebsocket.md) is connected has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.outboundbuffersizeinbytes
     * @type {Integer} 
     */
    OutboundBufferSizeInBytes {
        get => this.get_OutboundBufferSizeInBytes()
        set => this.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * The credential to use to authenticate to the WebSocket server through HTTP header authentication using a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The ServerCredential property must be set before calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method on the [StreamWebSocket](streamwebsocket.md) object. An attempt to set the ServerCredential property after calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * The credential to use to authenticate to the proxy server through HTTP header authentication using a [StreamWebSocket](streamwebsocket.md) object.
     * @remarks
     * The ProxyCredential property must be set before calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method on the [StreamWebSocket](streamwebsocket.md) object. An attempt to set the ProxyCredential property after calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets a collection that can be used to add a list of supported sub-protocols that will be advertised to the server during the connect handshake.
     * @remarks
     * The SupportedProtocols property contains a collection of WebSocket sub-protocols supported by the [StreamWebSocket](streamwebsocket.md) object. Before calling the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method, additional supported sub-protocol strings can be added to this collection, which will be sent to the server in the "Sec-WebSocket-Protocol" header during the WebSocket handshake. The protocol chosen by the WebSocket server will then be exposed on the [Protocol](streamwebsocketinformation_protocol.md) property.
     * 
     * An attempt to add a sub-protocol to this collection after a successful call to [ConnectAsync](streamwebsocket_connectasync_682685111.md) method will not result in an error but the new value is ignored. However, if the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method call or the connect operation completes with an error, an app can update the collection stored in the SupportedProtocols property and retry the [ConnectAsync](streamwebsocket_connectasync_682685111.md) method call and the new value will be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.supportedprotocols
     * @type {IVector<HSTRING>} 
     */
    SupportedProtocols {
        get => this.get_SupportedProtocols()
    }

    /**
     * Gets a list of ignorable server certificate errors. Get this list and add [ChainValidationResult](../windows.security.cryptography.certificates/chainvalidationresult.md) values for server certificate errors that you wish to ignore during the secure WebSocket (**wss:///* protocol) server certificate validation process.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.ignorableservercertificateerrors
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
     * > Setting the DesiredUnsolicitedPongInterval on a StreamWebSocket associated with a [ControlChannelTrigger](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger) is not supported. Setting the property does not change the actual interval.
     * 
     * > Even though a custom unsolicited PONG interval is not supported with a [ControlChannelTrigger](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger) WebSocket, the [ControlChannelTrigger](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger) is impacted by two types of keep-alive intervals  (1) network keep-alive interval and (2) server keep-alive interval. See [ControlChannelTrigger Remarks](/uwp/api/Windows.Networking.Sockets.ControlChannelTrigger#Remarks) for details. The server keep-alive interval can be configured through ControlChannelTrigger’s [ServerKeepAliveIntervalInMinutes](/uwp/api/windows.networking.sockets.controlchanneltrigger.ServerKeepAliveIntervalInMinutes) property while implementing application level PONGs.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.desiredunsolicitedponginterval
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.actualunsolicitedponginterval
     * @type {TimeSpan} 
     */
    ActualUnsolicitedPongInterval {
        get => this.get_ActualUnsolicitedPongInterval()
    }

    /**
     * Gets the certificate provided by the client when a secure WebSocket connection has been established.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamwebsocketcontrol.clientcertificate
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
     * @returns {Boolean} 
     */
    get_NoDelay() {
        if (!this.HasProp("__IStreamWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl := IStreamWebSocketControl(outPtr)
        }

        return this.__IStreamWebSocketControl.get_NoDelay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NoDelay(value) {
        if (!this.HasProp("__IStreamWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl := IStreamWebSocketControl(outPtr)
        }

        return this.__IStreamWebSocketControl.put_NoDelay(value)
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
        if (!this.HasProp("__IStreamWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl2 := IStreamWebSocketControl2(outPtr)
        }

        return this.__IStreamWebSocketControl2.get_DesiredUnsolicitedPongInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredUnsolicitedPongInterval(value) {
        if (!this.HasProp("__IStreamWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl2 := IStreamWebSocketControl2(outPtr)
        }

        return this.__IStreamWebSocketControl2.put_DesiredUnsolicitedPongInterval(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ActualUnsolicitedPongInterval() {
        if (!this.HasProp("__IStreamWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl2 := IStreamWebSocketControl2(outPtr)
        }

        return this.__IStreamWebSocketControl2.get_ActualUnsolicitedPongInterval()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        if (!this.HasProp("__IStreamWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl2 := IStreamWebSocketControl2(outPtr)
        }

        return this.__IStreamWebSocketControl2.get_ClientCertificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        if (!this.HasProp("__IStreamWebSocketControl2")) {
            if ((queryResult := this.QueryInterface(IStreamWebSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamWebSocketControl2 := IStreamWebSocketControl2(outPtr)
        }

        return this.__IStreamWebSocketControl2.put_ClientCertificate(value)
    }

;@endregion Instance Methods
}
