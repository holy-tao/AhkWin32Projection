#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocketControl.ahk
#Include .\IStreamSocketControl2.ahk
#Include .\IStreamSocketControl3.ahk
#Include .\IStreamSocketControl4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket control data on a [StreamSocket](streamsocket.md) object.
 * @remarks
 * The StreamSocketControl class provides access to advanced socket control data on a [StreamSocket](streamsocket.md) object.
 * 
 * A StreamSocketControl object is automatically created with the parent [StreamSocket](streamsocket.md) object. The [StreamSocket.Control](streamsocket_control.md) property provides access to the associated StreamSocketControl object.
 * 
 * Any changes to the property values on the StreamSocketControl must be set before the [StreamSocket](streamsocket.md) is connected. As a result if you need to make changes to the [ClientCertificate](streamsocketcontrol_clientcertificate.md), [IgnorableServerCertificateErrors](streamsocketcontrol_ignorableservercertificateerrors.md), [KeepAlive](streamsocketcontrol_keepalive.md), [NoDelay](streamsocketcontrol_nodelay.md), [OutboundBufferSizeInBytes](streamsocketcontrol_outboundbuffersizeinbytes.md) , [OutboundUnicastHopLimit](streamsocketcontrol_outboundunicasthoplimit.md), or [QualityOfService](streamsocketcontrol_qualityofservice.md) properties, then these changes must occur before a successful call to one of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods on the [StreamSocket](streamsocket.md).
 * 
 * Use the [ClientCertificate](streamsocketcontrol_clientcertificate.md) to set a client certificate to be used to make secure connections over the associated [StreamSocket](streamsocket.md) object.
 * 
 * The following example creates a [StreamSocket](streamsocket.md), and then demonstrates how to set the [NoDelay](streamsocketcontrol_nodelay.md) property to **false**. Other properties may be set in a similar manner. After this is done, the app can connect the [StreamSocket](streamsocket.md).
 * 
 * ```csharp
 * using Windows.Networking.Sockets;
 * 
 * StreamSocket clientSocket = new StreamSocket();
 * 
 * // Get the current setting for this option.
 * // This isn't required, but it shows how to get the current setting.
 * bool currentSetting = clientSocket.Control.NoDelay;
 * 
 * // Set NoDelay to false so that the Nagle algorithm is not disabled.
 * clientSocket.Control.NoDelay = false;
 * 
 * // Now you can call the ConnectAsync method to connect the StreamSocket.
 * ```
 * 
 * ```cppwinrt
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocketControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocketControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocketControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A value that indicates whether the Nagle algorithm is used on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The NoDelay property controls whether Nagle's algorithm is enabled or disabled on a [StreamSocket](streamsocket.md) object. The default value for the NoDelay property is **true**.
     * 
     * Nagle's algorithm is a technique to improving the efficiency of TCP/IP networks by reducing the number of packets that are needed to be sent over the network. The algorithm tries to deal with problems caused by an application that repeatedly emits data in small chunks. A TCP packet has a 40-byte header (20 bytes for IP and 20 bytes for TCP). So if an app sends only 4 bytes in a packet, the overhead on the packet data is very large. This can occur for a remote access protocol (telnet or secure shell, for example) where most key presses may generate only a single byte or two of data that is transmitted immediately. Over a slow link, many of these packets may be in transit over the network at the same time. Nagle's algorithm works by combining a number of small outgoing messages, and sending them all at once. When there is a sent packet for which the sender has received no acknowledgment, the sender keeps buffering output until it has a full packet's worth of output. This allows the output to be sent all at once. The impact of applying Nagle's algorithm is to increase the bandwidth at the expense of latency. A well-written app that buffers sends internally should not need to use Nagle's algorithm.
     * 
     * When this property is **true**, the [StreamSocket](streamsocket.md) will disable Nagle's algorithm on the TCP connection. This setting reduces the potential delays when sending small messages. When a [StreamSocket](streamsocket.md) is created, the default value for this property is **true**.
     * 
     * When this property is **false**, the [StreamSocket](streamsocket.md) will enable Nagle's algorithm on the TCP connection. This setting can increase the bandwidth at the expense of latency, but should only be used with caution. There are some adverse side effects possible when Nagle's algorithm is enabled and certain other TCP optimizations are also used.
     * 
     * This property may be set before the [StreamSocket](streamsocket.md) is connected. After the [StreamSocket](streamsocket.md) is connected, setting the property will result in an error.
     * 
     * This property sets the value of the **TCP_NODELAY** socket option on the TCP socket used by the [StreamSocket](streamsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.nodelay
     * @type {Boolean} 
     */
    NoDelay {
        get => this.get_NoDelay()
        set => this.put_NoDelay(value)
    }

    /**
     * A value that indicates whether keep-alive packets are sent to the remote destination on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * When this property is **true**, the [StreamSocket](streamsocket.md) sends keep-alive packets when no data or acknowledgment packets have been received for the TCP connection within an interval. When a [StreamSocket](streamsocket.md) is created, the default value for this property is **false**.
     * 
     * This property may be set before the [StreamSocket](streamsocket.md) is connected. After the [StreamSocket](streamsocket.md) is connected, setting the property will result in an error.
     * 
     * For more detailed information, see the [SO_KEEPALIVE](/windows/desktop/WinSock/so-keepalive) socket option in the Windows Sockets documentation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.keepalive
     * @type {Boolean} 
     */
    KeepAlive {
        get => this.get_KeepAlive()
        set => this.put_KeepAlive(value)
    }

    /**
     * The size, in bytes, of the send buffer to be used for sending data on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The OutboundBufferSizeInBytes property sets the value of the **SO_SNDBUF** socket option on the TCP socket used by the [StreamSocket](streamsocket.md). The default value is the local computer's default send buffer size. This value varies based on the system memory size. For more detailed information, see [SOL_SOCKET Socket Options](/windows/desktop/WinSock/sol-socket-socket-options) in the Windows Sockets documentation.
     * 
     * For most apps, this property should not be set since this disables TCP send auto-tuning by the system on this [StreamSocket](streamsocket.md) object. With TCP send auto-tuning disabled, network throughput is often worse especially on a connections with high latency. So this property should only be used in very specific situations.
     * 
     * The OutboundBufferSizeInBytes property must be set before the [StreamSocket](streamsocket.md) is connected. Setting this property after the [StreamSocket](streamsocket.md) is connected has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.outboundbuffersizeinbytes
     * @type {Integer} 
     */
    OutboundBufferSizeInBytes {
        get => this.get_OutboundBufferSizeInBytes()
        set => this.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * The quality of service on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * This property indicates the quality of service that [StreamSocket](streamsocket.md) object should provide. The default value is **normal**.
     * 
     * When the property is set to a value other than **normal**, the socket will follow a policy to provide the specified quality of service. When the property is set to **lowLatency**, the priority of the thread that handles read completions is increased. The **lowLatency** value would commonly be used for audio or similar apps that are timing sensitive. This property is not normally set for other apps.
     * 
     * This property may be set before the [StreamSocket](streamsocket.md) is connected. After the [StreamSocket](streamsocket.md) is connected, setting this property will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.qualityofservice
     * @type {Integer} 
     */
    QualityOfService {
        get => this.get_QualityOfService()
        set => this.put_QualityOfService(value)
    }

    /**
     * The hop limit on an outbound packet sent to a unicast IP address by the [StreamSocket](streamsocket.md) object.
     * @remarks
     * This value indicates the hop limit that is set on an outbound TCP packet sent to a unicast IP address using the [StreamSocket](streamsocket.md) object. This property is used to set the Time to Live (TTL) field in an IPv4 packet header. This property is used to set the Hop Limit field in an IPv6 header. The default value for this property is 128.
     * 
     * This property may be set before the [StreamSocket](streamsocket.md) is connected. After the [StreamSocket](streamsocket.md) is connected, setting this property will result in an error.
     * 
     * Setting the OutboundUnicastHopLimit may not have an effect if the system doesn't support setting the TTL.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.outboundunicasthoplimit
     * @type {Integer} 
     */
    OutboundUnicastHopLimit {
        get => this.get_OutboundUnicastHopLimit()
        set => this.put_OutboundUnicastHopLimit(value)
    }

    /**
     * Get a vector of SSL server errors to ignore when making an SSL connection with a [StreamSocket](streamsocket.md).
     * @remarks
     * The IgnorableServerCertificateErrors property gets a vector of [ChainValidationResult](../windows.security.cryptography.certificates/chainvalidationresult.md) enumeration values for the SSL server errors to ignore.
     * 
     * SSL server errors should only be ignored in advanced scenarios. Disregarding server certificate errors may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.ignorableservercertificateerrors
     * @type {IVector<Integer>} 
     */
    IgnorableServerCertificateErrors {
        get => this.get_IgnorableServerCertificateErrors()
    }

    /**
     * A value that indicates whether, when multiple connection attempts are being made, the attempts are made in parallel or serially.
     * @remarks
     * In certain circumstances, the Windows runtime might attempt to establish a connection using multiple methods in parallel. For example, when [StreamSocket](streamsocket.md) attempts a connection and a proxy is detected on the network, it attempts both a direct connection to the specified IP address, and an HTTP CONNECT request (which will connect via the proxy) in parallel. The first connection to succeed is the one that is used by the [StreamSocket](streamsocket.md) object. While this works well in most cases, it causes problems with some servers in the case where both connection attempts succeed. If your app is using [StreamSocket](streamsocket.md) to connect to a server where the parallel connection method causes problems on the server, you should set SerializeConnectionAttempts to true before connecting. This will ensure that at most one TCP connection attempt is ongoing at any given time, and that only a single connection is used.
     * 
     * Your code must set this property before you call [ConnectAsync](/uwp/api/windows.networking.sockets.streamsocket.connectasync) to attempt to connect. Changing this property value after [ConnectAsync](/uwp/api/windows.networking.sockets.streamsocket.connectasync) has been called results in an exception being thrown.
     * 
     * Note that serializing the connection logic can make establishing the connection take longer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.serializeconnectionattempts
     * @type {Boolean} 
     */
    SerializeConnectionAttempts {
        get => this.get_SerializeConnectionAttempts()
        set => this.put_SerializeConnectionAttempts(value)
    }

    /**
     * Gets or sets the client SSL/TLS certificate that will be sent to the server if the server requests a client certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.clientcertificate
     * @type {Certificate} 
     */
    ClientCertificate {
        get => this.get_ClientCertificate()
        set => this.put_ClientCertificate(value)
    }

    /**
     * Constrains the TLS protocol version that will be negotiated when the developer uses the ConnectAsync() or UpgradeToSslAsync() methods that require TLS.
     * @remarks
     * When the server does not meet the TLS version specified by MinProtectionLevel, the corresponding ConnectAsync() and/or UpgradeToSslAsnc() execution will behave just as if the server does not support SSL or TLS.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketcontrol.minprotectionlevel
     * @type {Integer} 
     */
    MinProtectionLevel {
        get => this.get_MinProtectionLevel()
        set => this.put_MinProtectionLevel(value)
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
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.get_NoDelay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NoDelay(value) {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.put_NoDelay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeepAlive() {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.get_KeepAlive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeepAlive(value) {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.put_KeepAlive(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundBufferSizeInBytes() {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.get_OutboundBufferSizeInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundBufferSizeInBytes(value) {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QualityOfService() {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.get_QualityOfService()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_QualityOfService(value) {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.put_QualityOfService(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundUnicastHopLimit() {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.get_OutboundUnicastHopLimit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundUnicastHopLimit(value) {
        if (!this.HasProp("__IStreamSocketControl")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl := IStreamSocketControl(outPtr)
        }

        return this.__IStreamSocketControl.put_OutboundUnicastHopLimit(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_IgnorableServerCertificateErrors() {
        if (!this.HasProp("__IStreamSocketControl2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl2 := IStreamSocketControl2(outPtr)
        }

        return this.__IStreamSocketControl2.get_IgnorableServerCertificateErrors()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SerializeConnectionAttempts() {
        if (!this.HasProp("__IStreamSocketControl3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl3 := IStreamSocketControl3(outPtr)
        }

        return this.__IStreamSocketControl3.get_SerializeConnectionAttempts()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SerializeConnectionAttempts(value) {
        if (!this.HasProp("__IStreamSocketControl3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl3 := IStreamSocketControl3(outPtr)
        }

        return this.__IStreamSocketControl3.put_SerializeConnectionAttempts(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        if (!this.HasProp("__IStreamSocketControl3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl3 := IStreamSocketControl3(outPtr)
        }

        return this.__IStreamSocketControl3.get_ClientCertificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        if (!this.HasProp("__IStreamSocketControl3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl3 := IStreamSocketControl3(outPtr)
        }

        return this.__IStreamSocketControl3.put_ClientCertificate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinProtectionLevel() {
        if (!this.HasProp("__IStreamSocketControl4")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl4 := IStreamSocketControl4(outPtr)
        }

        return this.__IStreamSocketControl4.get_MinProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinProtectionLevel(value) {
        if (!this.HasProp("__IStreamSocketControl4")) {
            if ((queryResult := this.QueryInterface(IStreamSocketControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketControl4 := IStreamSocketControl4(outPtr)
        }

        return this.__IStreamSocketControl4.put_MinProtectionLevel(value)
    }

;@endregion Instance Methods
}
