#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocket.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IStreamSocket2.ahk
#Include .\IStreamSocket3.ahk
#Include .\IStreamSocketStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports network communication using a stream socket over TCP or Bluetooth RFCOMM in UWP apps.
 * @remarks
 * The StreamSocket class supports network communications that use a stream socket over TCP or Bluetooth RFCOMM in UWP apps.
 * 
 * For a client app, the most common sequence of operations using a StreamSocket are the following:
 * 
 * + Create the StreamSocket.
 * + Get a [StreamSocketControl](streamsocketcontrol.md) object using the [Control](streamsocket_control.md) property and set any properties on the [StreamSocketControl](streamsocketcontrol.md) object before calling one of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods.
 * + Call one of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods to establish a connection with the remote endpoint. For Bluetooth, the remote service name is a Bluetooth Service ID. If an SSL/TLS connection for TCP or a level of encryption for Bluetooth is required immediately, this can be specified using some of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods. If an SSL/TLS connection is desired after sending and receiving some initial data for a TCP socket, then the [UpgradeToSslAsync](streamsocket_upgradetosslasync_746090393.md) method can be called later to upgrade the connection to use SSL.
 * + Get the [OutputStream](streamsocket_outputstream.md) property to write data to the remote host.
 * + Get the [InputStream](streamsocket_inputstream.md) property to read data from the remote host.
 * + Read and write data as needed.
 * + Call the [Close](streamsocket_close_811482585.md) method to disconnect the socket, abort any pending operations, and release all unmanaged resources associated with the StreamSocket object.
 * > [!NOTE]
 * > The [Close](streamsocket_close_811482585.md) method is used by UWP apps written in JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the [Close](streamsocket_close_811482585.md) method is exposed as the  method on the StreamSocket. For apps written in C++, the [Close](streamsocket_close_811482585.md) method will be called when using the delete keyword on the object.
 * 
 * Explicitly closing a StreamSocket object (calling the [Close](streamsocket_close_811482585.md) method) will ensure a graceful disconnect if no pending read or write operations exist on the socket. All pending reads are automatically aborted and the StreamSocket waits for any ongoing I/O to complete before tearing down the connection. If no unread data remains on the socket after the ongoing I/O is finished, a graceful disconnect (FIN) is guaranteed to occur. Otherwise, an ungraceful disconnect (RST) occurs.
 * 
 * When an active (still connected) StreamSocket object goes out of scope, an abortive (non-graceful) disconnect may result, which can lead to previously-sent data being discarded before it is read by the remote peer. It is strongly recommended that [Close](streamsocket_close_811482585.md) (the [Close](streamsocket_close_811482585.md) method in JavaScript, the  method in C# and VB.NET, or the delete operator in C++) be called on a StreamSocket object before it goes out of scope.
 * 
 * Whenever a read or write operation is cancelled, the I/O operation completes with Error state and the associated StreamSocket object immediately tears down the connection, which leads to an ungraceful disconnect (RST) if any unread or unsent data remains on the socket.
 * 
 * Ungraceful disconnects (RST) will always occur if: An abnormal termination occurs (for example, the app crashes); or an abnormal connection failure is detected by the networking stack (for example, TCP retransmit timeout).
 * 
 * The StreamSocket object is also used in conjunction with the [StreamSocketListener](streamsocketlistener.md) object to listen for incoming connections over TCP or Bluetooth RFCOMM in server apps or peer-to-peer apps. A StreamSocket object is returned by the [Socket](streamsocketlistenerconnectionreceivedeventargs_socket.md) property on the [ConnectionReceived](streamsocketlistener_connectionreceived.md) event when a [StreamSocketListener](streamsocketlistener.md) object receives a TCP or Bluetooth RFCOMM connection request. For more information, see [StreamSocketListener](streamsocketlistener.md).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocket.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a list of [EndpointPair](../windows.networking/endpointpair.md) objects based on a remote hostname and remote service name and the sort order to be used.
     * @remarks
     * The [GetEndpointPairsAsync](datagramsocket_getendpointpairsasync_903639760.md) method gets a list of possible [EndpointPair](../windows.networking/endpointpair.md) objects that can be used by a [StreamSocket](streamsocket.md) to connect to a remote network destination. The returned list is sorted based on the *sortOptions* parameter.
     * 
     * A [StreamSocket](streamsocket.md) can use the list returned by this method to try and bind or connect to each [EndpointPair](../windows.networking/endpointpair.md) object until a remote destination can be reached. An [EndpointPair](../windows.networking/endpointpair.md) object from the list would be used with the [ConnectAsync(EndpointPair)](streamsocket_connectasync_13692504.md) method.
     * @param {HostName} remoteHostName The remote hostname or IP address.
     * @param {HSTRING} remoteServiceName The remote service name or UDP port.
     * @returns {IAsyncOperation<IVectorView<EndpointPair>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.getendpointpairsasync
     */
    static GetEndpointPairsAsync(remoteHostName, remoteServiceName) {
        if (!StreamSocket.HasProp("__IStreamSocketStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.StreamSocket")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStreamSocketStatics.IID)
            StreamSocket.__IStreamSocketStatics := IStreamSocketStatics(factoryPtr)
        }

        return StreamSocket.__IStreamSocketStatics.GetEndpointPairsAsync(remoteHostName, remoteServiceName)
    }

    /**
     * Gets a list of [EndpointPair](../windows.networking/endpointpair.md) objects based on a remote hostname and remote service name that can be used to send TCP packets to a remote network destination.
     * @remarks
     * This method gets a list of possible [EndpointPair](../windows.networking/endpointpair.md) objects that can be used by a [StreamSocket](streamsocket.md) to send data to a remote network destination using TCP. The returned list is sorted so that the address pairs that are best suited for communication between two peers occur earlier in the list.
     * 
     * A [StreamSocket](streamsocket.md) can use the list returned by this method to try and bind or connect to each [EndpointPair](../windows.networking/endpointpair.md) object until a connection can be made. An [EndpointPair](../windows.networking/endpointpair.md) object from the list would be used with the [ConnectAsync(EndpointPair)](streamsocket_connectasync_13692504.md) methods
     * @param {HostName} remoteHostName The hostname of a service. The service might actually be hosted on multiple services, so that a DNS lookup returns multiple IP addresses for the various servers. This method returns one endpoint pair for each of the servers found by a DNS lookup.
     * @param {HSTRING} remoteServiceName The name or port number of a remote service. Note that different servers might support the named service on different physical ports, so not all of the returned endpoints will use the same service port number.
     * @param {Integer} sortOptions 
     * @returns {IAsyncOperation<IVectorView<EndpointPair>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.getendpointpairsasync
     */
    static GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions) {
        if (!StreamSocket.HasProp("__IStreamSocketStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.StreamSocket")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStreamSocketStatics.IID)
            StreamSocket.__IStreamSocketStatics := IStreamSocketStatics(factoryPtr)
        }

        return StreamSocket.__IStreamSocketStatics.GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets socket control data on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The Control property gets the [StreamSocketControl](streamsocketcontrol.md) instance associated with a [StreamSocket](streamsocket.md) object.
     * 
     * A [StreamSocketControl](streamsocketcontrol.md) object is automatically created with the parent [StreamSocket](streamsocket.md) object. The [StreamSocketControl](streamsocketcontrol.md) instance can then be used to get or set control data used by the [StreamSocket](streamsocket.md) object. These properties on the [StreamSocketControl](streamsocketcontrol.md) instance include the following:
     * 
     * 
     * + [IgnorableServerCertificateErrors](streamsocketcontrol_ignorableservercertificateerrors.md) - Get a vector of SSL server errors to ignore when making an SSL connection with a [StreamSocket](streamsocket.md) object.
     * + [KeepAlive](streamsocketcontrol_keepalive.md) - A value that indicates whether keep-alive packets are sent to the remote destination on a [StreamSocket](streamsocket.md) object.
     * + [NoDelay](streamsocketcontrol_nodelay.md) - A value that indicates whether the Nagle algorithm is used on a [StreamSocket](streamsocket.md) object.
     * + [OutboundUnicastHopLimit](streamsocketcontrol_outboundunicasthoplimit.md) - The hop limit on an outbound packet sent to a unicast IP address by the [StreamSocket](streamsocket.md) object.
     * + [OutboundBufferSizeInBytes](streamsocketcontrol_outboundbuffersizeinbytes.md) - - The size, in bytes, of the send buffer to be used for sending data on a [StreamSocket](streamsocket.md) object.
     * + [QualityOfService](streamsocketcontrol_qualityofservice.md) - The quality of service on a [StreamSocket](streamsocket.md) object.
     * 
     * 
     * Any changes to the property values on the [StreamSocketControl](streamsocketcontrol.md) must be set before the [StreamSocket](streamsocket.md) is connected. As a result if you need to make changes to the [IgnorableServerCertificateErrors](streamsocketcontrol_ignorableservercertificateerrors.md), [KeepAlive](streamsocketcontrol_keepalive.md), [NoDelay](streamsocketcontrol_nodelay.md), [OutboundBufferSizeInBytes](streamsocketcontrol_outboundbuffersizeinbytes.md) , [OutboundUnicastHopLimit](streamsocketcontrol_outboundunicasthoplimit.md), or [QualityOfService](streamsocketcontrol_qualityofservice.md) properties, then these changes must occur before a successful call to one of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods on the [StreamSocket](streamsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.control
     * @type {StreamSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * Gets socket information on a [StreamSocket](streamsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.information
     * @type {StreamSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Gets the input stream to read from the remote destination on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * This property can be used to read incoming data received from the remote network destination on a socket object. Incoming data can be read using the [IInputStream.ReadAsync](../windows.storage.streams/iinputstream_readasync_1012630619.md) method directly or by passing the [IInputStream](../windows.storage.streams/iinputstream.md) object to other objects ([DataReader](../windows.storage.streams/datareader.md), for example) that accept an [IInputStream](../windows.storage.streams/iinputstream.md) as a parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * Gets the output stream to write to the remote host on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * This property can be used to write outgoing data to be sent to the remote network destination on a socket object. Outgoing data can be written using the [IOutputStream.WriteAsync](../windows.storage.streams/ioutputstream_writeasync_897036872.md) method directly or by passing the [IOutputStream](../windows.storage.streams/ioutputstream.md) object to other objects ([DataWriter](../windows.storage.streams/datawriter.md), for example) that accept an [IOutputStream](../windows.storage.streams/ioutputstream.md) as a parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [StreamSocket](streamsocket.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.StreamSocket")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {StreamSocketControl} 
     */
    get_Control() {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.get_Control()
    }

    /**
     * 
     * @returns {StreamSocketInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.get_Information()
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.get_InputStream()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.get_OutputStream()
    }

    /**
     * Starts an asynchronous operation on a [StreamSocket](streamsocket.md) object to connect to a remote network destination specified as an [EndpointPair](../windows.networking/endpointpair.md) object and a [SocketProtectionLevel](socketprotectionlevel.md) enumeration. This method is not callable from JavaScript.
     * @remarks
     * If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains null for the [LocalHostName](../windows.networking/endpointpair_localhostname.md) property, then the system will supply the local IP address that will be used. If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains an empty string for the [LocalServiceName](../windows.networking/endpointpair_localservicename.md) property, then the system will supply the local TCP port that will be used.
     * 
     * If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains null for the [LocalServiceName](../windows.networking/endpointpair_localservicename.md) property, then an error will occur.
     * 
     * The [ConnectAsync(EndpointPair, SocketProtectionLevel) method is not exposed in JavaScript. This method can't be called from JavaScript since it has the same number of arguments as the [ConnectAsync(HostName, String)](streamsocket_connectasync_1841953676.md) method.
     * 
     * Apps written in JavaScript can't connect a [StreamSocket](streamsocket.md) using an [EndpointPair](../windows.networking/endpointpair.md) using SSL directly. In order to connect an [EndpointPair](../windows.networking/endpointpair.md) using SSL, JavaScript apps can use the following code instead.
     * 
     * 
     * 
     * ```javascript
     * 
     * var clientSocket = new Windows.Networking.Sockets.StreamSocket();
     * var remoteName = new Windows.Networking.HostName("www.contoso.com");
     * var myEndpointPair = EndpointPair();
     * 
     * // Set properties needed on the EndpointPair
     * // We only set remote properties and the localServiceName,
     * // But the localHostName could also be set
     * 
     * myEndpointPair.localServiceName = "12345";
     * myEndpointPair.remoteHostName = remoteName;
     * myEndpointPair.remoteServiceName = "http";
     * 
     * // First connect the socket without SSL
     * clientSocket.connectAsync(myEendpointPair>).then(function () {
     *     // Now upgrade the connection to SSL
     *     clientSocket.upgradeToSslAsync(SocketProtectionLevel.Ssl).then(function () {
     *         // now connected using SSL
     *     }
     * }   
     * 
     * ```
     * 
     * When the *protectionLevel* parameter is set to a value that requires SSL or TLS, the socket connect operation may not timeout if the remote endpoint does not support SSL or TLS. This can occur if initial connect operation succeeds but the remote endpoint does not terminate the connection during the SSL handshake. To protect against this situation, an app should set a timeout on the connect operation when requesting SSL/TLS and abort the operation if the timeout expires. For more information on setting a timeout using JavaScript on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710177(v=win.10)). For more information on setting a timeout using VB, C#, or C++ on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710176(v=win.10)).
     * 
     * In a UWP app, the [StreamSocket](streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. Connecting through proxies is not supported when a local host address is specified, so the [LocalHostName](../windows.networking/endpointpair_localhostname.md) property passed in the *endpointPair* parameter must be null. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](streamsocket.md) class reference.
     * @param {EndpointPair} endpointPair_ An [EndpointPair](../windows.networking/endpointpair.md) object that specifies local hostname or IP address, local service name or TCP port, the remote hostname or remote IP address, and the remote service name or remote TCP port for the remote network destination.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.connectasync
     */
    ConnectWithEndpointPairAsync(endpointPair_) {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.ConnectWithEndpointPairAsync(endpointPair_)
    }

    /**
     * Starts an asynchronous operation on a [StreamSocket](streamsocket.md) object to connect to a remote destination specified by a remote hostname, a remote service name, and a [SocketProtectionLevel](socketprotectionlevel.md).
     * @remarks
     * The *remoteHostName* and *remoteServiceName* parameters must be provided. If the *remoteHostName* is null or the *remoteServiceName* is null or an empty string, an error will occur.
     * 
     * When the *protectionLevel* parameter is set to a value that requires SSL or TLS, the socket connect operation may not timeout if the remote network destination does not support SSL or TLS. This can occur if initial connect operation succeeds but the remote host does not terminate the connection during the SSL handshake. To protect against this situation, an app should set a timeout on the connect operation when requesting SSL/TLS and abort the operation if the timeout expires. For more information on setting a timeout using JavaScript on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710177(v=win.10)). For more information on setting a timeout using VB, C#, or C++ on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710176(v=win.10)).
     * 
     * In a UWP app, the [StreamSocket](streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](streamsocket.md) class reference.
     * @param {HostName} remoteHostName The hostname or IP address of the remote network destination. For Bluetooth RFCOMM, this is a MAC address.
     * @param {HSTRING} remoteServiceName The service name or TCP port number of the remote network destination. For Bluetooth RFCOMM, this is the Bluetooth address.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.connectasync
     */
    ConnectAsync(remoteHostName, remoteServiceName) {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.ConnectAsync1(remoteHostName, remoteServiceName)
    }

    /**
     * Starts an asynchronous operation on a [StreamSocket](streamsocket.md) object to connect to a remote destination specified by a remote hostname, a remote service name, and a [SocketProtectionLevel](socketprotectionlevel.md).
     * @remarks
     * The *remoteHostName* and *remoteServiceName* parameters must be provided. If the *remoteHostName* is null or the *remoteServiceName* is null or an empty string, an error will occur.
     * 
     * When the *protectionLevel* parameter is set to a value that requires SSL or TLS, the socket connect operation may not timeout if the remote network destination does not support SSL or TLS. This can occur if initial connect operation succeeds but the remote host does not terminate the connection during the SSL handshake. To protect against this situation, an app should set a timeout on the connect operation when requesting SSL/TLS and abort the operation if the timeout expires. For more information on setting a timeout using JavaScript on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710177(v=win.10)). For more information on setting a timeout using VB, C#, or C++ on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710176(v=win.10)).
     * 
     * In a UWP app, the [StreamSocket](streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](streamsocket.md) class reference.
     * @param {EndpointPair} endpointPair_ 
     * @param {Integer} protectionLevel The protection level that represents the integrity and encryption for the [StreamSocket](streamsocket.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.connectasync
     */
    ConnectWithEndpointPairAndProtectionLevelAsync(endpointPair_, protectionLevel) {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.ConnectWithEndpointPairAndProtectionLevelAsync(endpointPair_, protectionLevel)
    }

    /**
     * Starts an asynchronous operation on a [StreamSocket](streamsocket.md) object on a specified local network adapter to connect to a remote destination specified by a remote hostname, a remote service name, and a [SocketProtectionLevel](socketprotectionlevel.md).
     * @remarks
     * The [ConnectAsync(Hostname, String, SocketProtectionLevel, NetworkAdapter) method binds to a network interface specified in the *adapter* parameter on the local computer and the remote hostname and service name specified in the *remoteHostName* and *remoteServiceName* parameters with the protection level specified in the *protectionLevel* parameter.
     * 
     * The *remoteHostName* and *remoteServiceName* parameters must be provided. If the *remoteHostName* is **null** or the *remoteServiceName* is **null** or an empty string, an error will occur. If the *adapter* parameter is **null**, an error will occur.
     * 
     * The name resolution mechanism used by the [ConnectAsync(Hostname, String, SocketProtectionLevel, NetworkAdapter) method is limited to the specified interface for the domain name system (DNS) namespace.
     * 
     * Using the specified network adapter is on a best-effort basis. Systems with adapters configured in weak-host or forwarding modes may use an adapter other than the specified adapter.
     * 
     * When the *protectionLevel* parameter is set to a value that requires SSL or TLS, the socket connect operation may not timeout if the remote network destination does not support SSL or TLS. This can occur if initial connect operation succeeds but the remote host does not terminate the connection during the SSL handshake. To protect against this situation, an app should set a timeout on the connect operation when requesting SSL/TLS and abort the operation if the timeout expires. For more information on setting a timeout using JavaScript on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710177(v=win.10)). For more information on setting a timeout using VB, C#, or C++ on socket operations, see [How to set timeouts on socket operations ](/previous-versions/windows/apps/jj710176(v=win.10)).
     * 
     * An app can retrieve a valid [NetworkAdapter](../windows.networking.connectivity/networkadapter.md) by inspecting a [HostName](../windows.networking/hostname.md) instance (using the [NetworkInformation.GetHostNames](../windows.networking.connectivity/networkinformation_gethostnames_136280557.md) method, for example) and retrieving the [IPInformation](../windows.networking.connectivity/ipinformation.md) object from the [Hostname.IPInformation](../windows.networking/hostname_ipinformation.md) property. The [IPInformation.NetworkAdapter](../windows.networking.connectivity/ipinformation_networkadapter.md) property can be used to retrieve the associated [NetworkAdapter](../windows.networking.connectivity/networkadapter.md).
     * 
     * In a UWP app, the [StreamSocket](streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. However, connecting through proxies is not supported when a specific network adapter is selected. So proxy support is disabled when the [ConnectAsync(HostName, String, SocketProtectionLevel, NetworkAdapter) method is used. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](streamsocket.md) class reference.
     * @param {HostName} remoteHostName The hostname or IP address of the remote network destination. For Bluetooth RFCOMM, this is a MAC address.
     * @param {HSTRING} remoteServiceName The service name or TCP port number of the remote network destination. For Bluetooth RFCOMM, this is the Bluetooth address.
     * @param {Integer} protectionLevel The protection level that represents the integrity and encryption for the [StreamSocket](streamsocket.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.connectasync
     */
    ConnectWithProtectionLevelAsync(remoteHostName, remoteServiceName, protectionLevel) {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.ConnectWithProtectionLevelAsync(remoteHostName, remoteServiceName, protectionLevel)
    }

    /**
     * Starts an asynchronous operation to upgrade a connected socket to use SSL on a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The UpgradeToSslAsync method can only be used to upgrade an already established connection made with a [SocketProtectionLevel](socketprotectionlevel.md) of **PlainSocket**.
     * 
     * The typical order of operations to establish an SSL connection is as follows:
     * 
     * 
     * + Create the [StreamSocket](streamsocket.md).
     * + Get socket control data on a [StreamSocketControl](streamsocketcontrol.md) object using the [Control](streamsocket_control.md) property and set any properties before calling one of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods.
     * + Call one of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods to establish a connection with the remote endpoint. If an SSL/TLS connection is required immediately, this can be specified using some of the [ConnectAsync](streamsocket_connectasync_13692504.md) methods. If an SSL/TLS connection is desired after sending and receiving some initial data, then the UpgradeToSslAsync method can be called later to upgrade the connection to use SSL.
     * + Get the [OutputStream](streamsocket_outputstream.md) property to write data to the remote host.
     * + Get the [InputStream](streamsocket_inputstream.md) property to read data from the remote host.
     * + Read and write data as needed.
     * + Call the [Close](streamsocket_close_811482585.md) method to abort any pending operations and release all unmanaged resources associated with the [StreamSocket](streamsocket.md) object.
     * The UpgradeToSslAsync method requires that the remote server to which the connection was established is able to upgrade a TCP connection to an SSL connection.
     * 
     * The UpgradeToSslAsync method can only be used for client connections. This method can't be used to upgrade a connection accepted by the [StreamSocketListener](streamsocketlistener.md) to an SSL connection. The UpgradeToSslAsync method only implements the client parts of the SSL protocol negotiation, not the server parts that would be needed to listen for and accept SSL connections.
     * @param {Integer} protectionLevel The protection level that represents the integrity and encryption on the [StreamSocket](streamsocket.md) object.
     * @param {HostName} validationHostName The hostname of the remote network destination that is used for validation when upgrading to SSL.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.upgradetosslasync
     */
    UpgradeToSslAsync(protectionLevel, validationHostName) {
        if (!this.HasProp("__IStreamSocket")) {
            if ((queryResult := this.QueryInterface(IStreamSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket := IStreamSocket(outPtr)
        }

        return this.__IStreamSocket.UpgradeToSslAsync(protectionLevel, validationHostName)
    }

    /**
     * Closes the [StreamSocket](streamsocket.md) object.
     * @remarks
     * The Close method aborts any pending operations and releases all unmanaged resources associated with the [StreamSocket](streamsocket.md) object. Aborting pending read operations on an [InputStream](streamsocket_inputstream.md) or aborting pending write operations on an [OutputStream](streamsocket_outputstream.md) will also result in the [StreamSocket](streamsocket.md) object being closed.
     * 
     * The Close is used by UWP apps written in JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the Close method is exposed as the [Dispose()](/uwp/api/Windows.Networking.Sockets.StreamSocket.Dispose) method on the [StreamSocket](streamsocket.md). For apps written in C++, the Close method will be called when using the delete keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.close
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
     * Starts an asynchronous operation on a [StreamSocket](streamsocket.md) object to connect to a remote network destination specified as an [EndpointPair](../windows.networking/endpointpair.md) object.
     * @remarks
     * If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains null for the [LocalHostName](../windows.networking/endpointpair_localhostname.md) property, then the system will supply the local IP address that will be used. If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains an empty string for the [LocalServiceName](../windows.networking/endpointpair_localservicename.md) property, then the system will supply the local TCP port that will be used.
     * 
     * In a UWP app, the [StreamSocket](streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. Connecting through proxies is not supported when a local host address is specified, so the [LocalHostName](../windows.networking/endpointpair_localhostname.md) property passed in the *endpointPair* parameter must be null. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](streamsocket.md) class reference.
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @param {Integer} protectionLevel 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.connectasync
     */
    ConnectWithProtectionLevelAndAdapterAsync(remoteHostName, remoteServiceName, protectionLevel, adapter_) {
        if (!this.HasProp("__IStreamSocket2")) {
            if ((queryResult := this.QueryInterface(IStreamSocket2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket2 := IStreamSocket2(outPtr)
        }

        return this.__IStreamSocket2.ConnectWithProtectionLevelAndAdapterAsync(remoteHostName, remoteServiceName, protectionLevel, adapter_)
    }

    /**
     * Cancels pending reads and writes over a [StreamSocket](streamsocket.md) object.
     * @remarks
     * Call CancelIOAsync to cancel any pending reads or writes on this socket before you call [TransferOwnership](streamsocket_transferownership_1291619316.md) when your app is about to be suspended.
     * 
     * CancelIOAsync does not guarantee that all read/write completion handlers have finished executing before it signals completion. It does, however, guarantee that all I/O operations will have reached a terminal state (either Completed or Error) by the time it signals completion. If your app needs to wait for all pending I/O operation handlers to finish executing, you must implement your own app-level sychronization logic. The [Socket Activity Stream Socket](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/SocketActivityStreamSocket) sample demonstrates one way to do this.
     * 
     * 
     * 
     * > [!NOTE]
     * > CancelIOAsync cancels pending writes and reads in the Windows Runtime, but if there is a write buffer pending in networking drivers, it flushes the write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.cancelioasync
     */
    CancelIOAsync() {
        if (!this.HasProp("__IStreamSocket3")) {
            if ((queryResult := this.QueryInterface(IStreamSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket3 := IStreamSocket3(outPtr)
        }

        return this.__IStreamSocket3.CancelIOAsync()
    }

    /**
     * Enables your app's background task to be triggered by the socket broker when traffic for this [StreamSocket](streamsocket.md) arrives while the app is not active.
     * @remarks
     * For info about error conditions, see the **Remarks** section for [EnableTransferOwnership(Guid, SocketActivityConnectedStandbyAction)](streamsocket_enabletransferownership_452874301.md).
     * @param {Guid} taskId The [IBackgroundTaskRegistration.TaskId](../windows.applicationmodel.background/ibackgroundtaskregistration_taskid.md) of the background task that will be triggered by the socket broker when traffic arrives for this [StreamSocket](streamsocket.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.enabletransferownership
     */
    EnableTransferOwnership(taskId) {
        if (!this.HasProp("__IStreamSocket3")) {
            if ((queryResult := this.QueryInterface(IStreamSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket3 := IStreamSocket3(outPtr)
        }

        return this.__IStreamSocket3.EnableTransferOwnership(taskId)
    }

    /**
     * Enables or disables the ability of your app's background task to be triggered by the socket broker when traffic for this [StreamSocket](streamsocket.md) arrives while the system is in connected standby.
     * @remarks
     * The most common cause of an exception with a code of 0x80070490 and a message of "Element not found" is that your system doesn't support connected standby. You can verify that by calling `EnableTransferOwnership(taskId, SocketActivityConnectedStandbyAction.DoNotWake)`. If that alternate call succeeds without throwing an exception, then that confirms that the original exception is caused by the system not being set up for connected standby. And that's a condition that your code will need to handle.
     * 
     * The API calling pattern that we recommend is to call `EnableTransferOwnership(taskId, SocketActivityConnectedStandbyAction.Wake)`. If you experience the exception described above, then re-try the call with **SocketActivityConnectedStandbyAction.DoNotWake**.
     * @param {Guid} taskId The [IBackgroundTaskRegistration.TaskId](../windows.applicationmodel.background/ibackgroundtaskregistration_taskid.md) of the background task being enabled or disabled.
     * @param {Integer} connectedStandbyAction Specifies whether to enable or disable the activation of the background task when traffic arrives.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.enabletransferownership
     */
    EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction) {
        if (!this.HasProp("__IStreamSocket3")) {
            if ((queryResult := this.QueryInterface(IStreamSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket3 := IStreamSocket3(outPtr)
        }

        return this.__IStreamSocket3.EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction)
    }

    /**
     * Transfers ownership of the [StreamSocket](streamsocket.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity.
     * @remarks
     * Your app should call this method to transfer ownership of the [StreamSocket](streamsocket.md) to the socket brokering service when the app is about to be suspended, or at the end of a background task. Your app should not access the [StreamSocket](streamsocket.md) object after calling this method, except when responding to notifications from the socket brokering service.
     * 
     * > [!NOTE]
     * > This call fails if there is any pending I/O on the [StreamSocket](streamsocket.md). Your code should call [StreamSocket.CancelIOAsync](streamsocket_cancelioasync_169683529.md) to cancel any further new traffic, then handle all pending traffic, and then update the [SocketActivityContext](socketactivitycontext.md), before calling StreamSocket.TransferOwnership.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.transferownership
     */
    TransferOwnership(socketId) {
        if (!this.HasProp("__IStreamSocket3")) {
            if ((queryResult := this.QueryInterface(IStreamSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket3 := IStreamSocket3(outPtr)
        }

        return this.__IStreamSocket3.TransferOwnership(socketId)
    }

    /**
     * Transfers ownership of the [StreamSocket](streamsocket.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity. Specifies a new [SocketActivityContext](socketactivitycontext.md) for the socket.
     * @remarks
     * Your app should call this method to transfer ownership of the [StreamSocket](streamsocket.md) to the socket brokering service when the app is about to be suspended, or at the end of a background task. Your app should not access the [StreamSocket](streamsocket.md) object after calling this method, except when responding to notifications from the socket brokering service.
     * 
     * > [!NOTE]
     * > This call fails if there is any pending I/O on the [StreamSocket](streamsocket.md). Your code should call [StreamSocket.CancelIOAsync](streamsocket_cancelioasync_169683529.md) to cancel any further new traffic, then handle all pending traffic, and then update the [SocketActivityContext](socketactivitycontext.md), before calling StreamSocket.TransferOwnership.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @param {SocketActivityContext} data Use the [SocketActivityContext](socketactivitycontext.md) to pass context information through the socket broker. When your app is notified by the broker of activity, this [SocketActivityContext](socketactivitycontext.md) will be provided to your app to help establish the context in which you should handle the notification.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.transferownership
     */
    TransferOwnershipWithContext(socketId, data) {
        if (!this.HasProp("__IStreamSocket3")) {
            if ((queryResult := this.QueryInterface(IStreamSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket3 := IStreamSocket3(outPtr)
        }

        return this.__IStreamSocket3.TransferOwnershipWithContext(socketId, data)
    }

    /**
     * Transfers ownership of the [StreamSocket](streamsocket.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity. Specifies a new [SocketActivityContext](socketactivitycontext.md) and a keep alive time for the socket.
     * @remarks
     * Your app should call this method to transfer ownership of the [StreamSocket](streamsocket.md) to the socket brokering service when the app is about to be suspended, or at the end of a background task. Your app should not access the [StreamSocket](streamsocket.md) object after calling this method, except when responding to notifications from the socket brokering service.
     * 
     * > [!NOTE]
     * > This call fails if there is any pending I/O on the [StreamSocket](streamsocket.md). Your code should call [StreamSocket.CancelIOAsync](streamsocket_cancelioasync_169683529.md) to cancel any further new traffic, then handle all pending traffic, and then update the [SocketActivityContext](socketactivitycontext.md), before calling StreamSocket.TransferOwnership.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @param {SocketActivityContext} data Use the [SocketActivityContext](socketactivitycontext.md) to pass context information through the socket broker. When your app is notified by the broker of activity, this [SocketActivityContext](socketactivitycontext.md) will be provided to your app to help establish the context in which you should handle the notification.
     * @param {TimeSpan} keepAliveTime How long the socket brokering service should monitor the socket for activity.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocket.transferownership
     */
    TransferOwnershipWithContextAndKeepAliveTime(socketId, data, keepAliveTime) {
        if (!this.HasProp("__IStreamSocket3")) {
            if ((queryResult := this.QueryInterface(IStreamSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocket3 := IStreamSocket3(outPtr)
        }

        return this.__IStreamSocket3.TransferOwnershipWithContextAndKeepAliveTime(socketId, data, keepAliveTime)
    }

;@endregion Instance Methods
}
