#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocketListenerControl.ahk
#Include .\IStreamSocketListenerControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket control data on a [StreamSocketListener](streamsocketlistener.md) object.
 * @remarks
 * The StreamSocketListenerControl class provides access to advanced socket control data on a [StreamSocketListener](streamsocketlistener.md) object.
 * 
 * A StreamSocketListenerControl object is automatically created with the parent [StreamSocketListener](streamsocketlistener.md) object. The [StreamSocketListener.Control](streamsocketlistener_control.md) property provides access to the associated StreamSocketListenerControl object.
 * 
 * Any changes to the StreamSocketListenerControl property values must be set before the [StreamSocketListener](streamsocketlistener.md) is bound. So changes to the [QualityOfService](streamsocketlistenercontrol_qualityofservice.md) property must be set before the [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) or [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method is called on the [StreamSocketListener](streamsocketlistener.md).
 * 
 * The following example creates a [StreamSocketListener](streamsocketlistener.md), and then demonstrates how to set the [QualityOfService](datagramsocketcontrol_qualityofservice.md) property to **LowLatency**. After this is done, the app can bind and listen on the [StreamSocketListener](streamsocketlistener.md).
 * 
 * ```csharp
 * using Windows.Networking.Sockets;
 * 
 * StreamSocketListener listenerSocket = new StreamSocketListener();
 * 
 * // Get the current setting for this option.
 * // This isn't required, but it shows how to get the current setting.
 * var currentSetting = listenerSocket.Control.QualityOfService;
 * 
 * // Set QualityOfService to LowLatency.
 * listenerSocket.Control.QualityOfService = SocketQualityOfService.LowLatency;
 * 
 * // Now you can call the BindServiceNameAsync or BindEndpointAsync method to listen for connections.
 * ```
 * 
 * ```cppwinrt
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenercontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocketListenerControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocketListenerControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocketListenerControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The quality of service to be set on a [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenercontrol.qualityofservice
     * @type {Integer} 
     */
    QualityOfService {
        get => this.get_QualityOfService()
        set => this.put_QualityOfService(value)
    }

    /**
     * A value that indicates whether the Nagle algorithm is used on a [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * The NoDelay property controls whether Nagle's algorithm is enabled or disabled on a [StreamSocket](streamsocket.md) object created. The default value for the [NoDelay](streamsocketcontrol_nodelay.md) property on a [StreamSocket](streamsocket.md) is **true**.
     * 
     * Nagle's algorithm is a technique to improving the efficiency of TCP/IP networks by reducing the number of packets that are needed to be sent over the network. The algorithm tries to deal with problems caused by an application that repeatedly emits data in small chunks. A TCP packet has a 40-byte header (20 bytes for IP and 20 bytes for TCP). So if an app sends only 4 bytes in a packet, the overhead on the packet data is very large. This can occur for a remote access protocol (telnet or secure shell, for example) where most key presses may generate only a single byte or two of data that is transmitted immediately. Over a slow link, many of these packets may be in transit over the network at the same time. Nagle's algorithm works by combining a number of small outgoing messages, and sending them all at once. When there is a sent packet for which the sender has received no acknowledgment, the sender keeps buffering output until it has a full packet's worth of output. This allows the output to be sent all at once. The impact of applying Nagle's algorithm is to increase the bandwidth at the expense of latency. A well-written app that buffers sends internally should not need to use Nagle's algorithm.
     * 
     * When this property is **true**, the [StreamSocket](streamsocket.md) will disable Nagle's algorithm on the TCP connection. This setting reduces the potential delays when sending small messages. When a [StreamSocket](streamsocket.md) is created, the default value for this property is **true**.
     * 
     * When this property is **false**, the [StreamSocket](streamsocket.md) will enable Nagle's algorithm on the TCP connection. This setting can increase the bandwidth at the expense of latency, but should only be used with caution. There are some adverse side effects possible when Nagle's algorithm is enabled and certain other TCP optimizations are also used.
     * 
     * This property may be set before the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections. After the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections, setting the property will result in an error.
     * 
     * This property sets the value of the **TCP_NODELAY** socket option on the TCP socket used by the [StreamSocket](streamsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenercontrol.nodelay
     * @type {Boolean} 
     */
    NoDelay {
        get => this.get_NoDelay()
        set => this.put_NoDelay(value)
    }

    /**
     * A value that indicates whether keep-alive packets should be sent on a [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * When this property is **true**, the [StreamSocket](streamsocket.md) object created sends keep-alive packets when no data or acknowledgment packets have been received for the TCP connection within an interval. When a [StreamSocket](streamsocket.md) is created, the default value for this property is **false**.
     * 
     * This property may be set before the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections. After the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections, setting the property will result in an error.
     * 
     * For more detailed information, see the [SO_KEEPALIVE](/windows/desktop/WinSock/so-keepalive) socket option in the Windows Sockets documentation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenercontrol.keepalive
     * @type {Boolean} 
     */
    KeepAlive {
        get => this.get_KeepAlive()
        set => this.put_KeepAlive(value)
    }

    /**
     * The size, in bytes, of the send buffer to be used for sending data on a [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * The OutboundBufferSizeInBytes property sets the value of the **SO_SNDBUF** socket option on the TCP socket used by the [StreamSocket](streamsocket.md) created. The default value is the local computer's default send buffer size. This value varies based on the system memory size. For more detailed information, see [SOL_SOCKET Socket Options](/windows/desktop/WinSock/sol-socket-socket-options) in the Windows Sockets documentation.
     * 
     * For most apps, this property should not be set since this disables TCP send auto-tuning by the system on this [StreamSocket](streamsocket.md) object. With TCP send auto-tuning disabled, network throughput is often worse especially on a connections with high latency. So this property should only be used in very specific situations.
     * 
     * This property may be set before the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections. After the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections, setting the property will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenercontrol.outboundbuffersizeinbytes
     * @type {Integer} 
     */
    OutboundBufferSizeInBytes {
        get => this.get_OutboundBufferSizeInBytes()
        set => this.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * The hop limit on an outbound packet sent to a unicast IP address by the [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * This value indicates the hop limit that is set on an outbound TCP packet sent to a unicast IP address using the [StreamSocket](streamsocket.md) object created. This property is used to set the Time to Live (TTL) field in an IPv4 packet header. This property is used to set the Hop Limit field in an IPv6 header. The default value for this property is 128.
     * 
     * This property may be set before the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections. After the [StreamSocketListener](streamsocketlistener.md) starts listening for incoming connections, setting the property will result in an error.
     * 
     * Setting this property may throw an exception if the system doesn't support setting the TTL.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenercontrol.outboundunicasthoplimit
     * @type {Integer} 
     */
    OutboundUnicastHopLimit {
        get => this.get_OutboundUnicastHopLimit()
        set => this.put_OutboundUnicastHopLimit(value)
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
    get_QualityOfService() {
        if (!this.HasProp("__IStreamSocketListenerControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl := IStreamSocketListenerControl(outPtr)
        }

        return this.__IStreamSocketListenerControl.get_QualityOfService()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_QualityOfService(value) {
        if (!this.HasProp("__IStreamSocketListenerControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl := IStreamSocketListenerControl(outPtr)
        }

        return this.__IStreamSocketListenerControl.put_QualityOfService(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NoDelay() {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.get_NoDelay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NoDelay(value) {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.put_NoDelay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeepAlive() {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.get_KeepAlive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeepAlive(value) {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.put_KeepAlive(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundBufferSizeInBytes() {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.get_OutboundBufferSizeInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundBufferSizeInBytes(value) {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundUnicastHopLimit() {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.get_OutboundUnicastHopLimit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundUnicastHopLimit(value) {
        if (!this.HasProp("__IStreamSocketListenerControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerControl2 := IStreamSocketListenerControl2(outPtr)
        }

        return this.__IStreamSocketListenerControl2.put_OutboundUnicastHopLimit(value)
    }

;@endregion Instance Methods
}
