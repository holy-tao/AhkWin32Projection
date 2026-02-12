#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDatagramSocket.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IDatagramSocket2.ahk
#Include .\IDatagramSocket3.ahk
#Include .\IDatagramSocketStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DatagramSocket.ahk
#Include .\DatagramSocketMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports network communication using a UDP datagram socket.
  * 
  * For a code example, see [Sockets](/windows/uwp/networking/sockets).
 * @remarks
 * The DatagramSocket class supports network communication using a UDP datagram socket. The DatagramSocket object can be used for client apps that send UDP packets or for server apps that listen for incoming UDP data.
 * 
 * Several steps are needed to send or receive data using a DatagramSocket object. Your app first assigns the [MessageReceived](datagramsocket_messagereceived.md) event to an event handler. To listen for incoming packets from a remote endpoint (a server scenario, for example), your app calls either the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind the DatagramSocket to a local service name or UDP port. However when your app needs to communicate with a single remote endpoint (client scenario, for example), your app calls the [ConnectAsync](datagramsocket_connectasync_1841953676.md) method. The [MessageReceived](datagramsocket_messagereceived.md) event handler must be set before any bind or connect operation, otherwise an error will occur.
 * 
 * The typical order of operations is as follows:
 * 
 * 1. Create the DatagramSocket.
 * 1. Use the [Control](datagramsocket_control.md) property to retrieve a [DatagramSocketControl](datagramsocketcontrol.md) object and set any advanced controls. This step is not normally needed by most apps.
 * 1. Assign the [MessageReceived](datagramsocket_messagereceived.md) event to an event handler.
 * 1. To listen for incoming packets from any remote endpoint (server scenario, for example), call the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind the DatagramSocket to a local service name or UDP port.
 * 1. To communicate with a single remote endpoint (client scenario, for example), call the [ConnectAsync](datagramsocket_connectasync_1841953676.md) method to bind the DatagramSocket to a specific remote endpoint.
 * 1. The [MessageReceived](datagramsocket_messagereceived.md) event handler will be invoked whenever a message from the remote endpoint arrives.
 * This class can also be used to join a multicast group and send UDP packets to the multicast group. For more information, see the [JoinMulticastGroup](datagramsocket_joinmulticastgroup_1508568147.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class DatagramSocket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatagramSocket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatagramSocket.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a list of [EndpointPair](../windows.networking/endpointpair.md) objects based on a remote hostname and remote service name and the sort order to be used.
     * @remarks
     * The GetEndpointPairsAsync method gets a list of possible [EndpointPair](../windows.networking/endpointpair.md) objects that can be used by a [DatagramSocket](datagramsocket.md) to connect to a remote network destination. The returned list is sorted based on the *sortOptions* parameter.
     * 
     * A [DatagramSocket](datagramsocket.md) can use the list returned by the GetEndpointPairsAsync method to try and bind or connect to each [EndpointPair](../windows.networking/endpointpair.md) object until a remote destination can be reached. An [EndpointPair](../windows.networking/endpointpair.md) object from the list would be used with the [ConnectAsync(EndpointPair)](datagramsocket_connectasync_13692504.md) method.
     * @param {HostName} remoteHostName The remote hostname or IP address.
     * @param {HSTRING} remoteServiceName The remote service name or UDP port.
     * @returns {IAsyncOperation<IVectorView<EndpointPair>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.getendpointpairsasync
     */
    static GetEndpointPairsAsync(remoteHostName, remoteServiceName) {
        if (!DatagramSocket.HasProp("__IDatagramSocketStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.DatagramSocket")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatagramSocketStatics.IID)
            DatagramSocket.__IDatagramSocketStatics := IDatagramSocketStatics(factoryPtr)
        }

        return DatagramSocket.__IDatagramSocketStatics.GetEndpointPairsAsync(remoteHostName, remoteServiceName)
    }

    /**
     * Gets a list of [EndpointPair](../windows.networking/endpointpair.md) objects based on a remote hostname and remote service name that can be used to send datagrams to a remote network destination.
     * @remarks
     * The GetEndpointPairsAsync method gets a list of possible [EndpointPair](../windows.networking/endpointpair.md) objects that can be used by a [DatagramSocket](datagramsocket.md) to send datagrams to a remote network destination. The returned list is sorted so that the address pairs that are best suited for communication between two peers occur earlier in the list.
     * 
     * A [DatagramSocket](datagramsocket.md) can use the list returned by the GetEndpointPairsAsync method to try and bind or connect to each [EndpointPair](../windows.networking/endpointpair.md) object until a connection can be made. An [EndpointPair](../windows.networking/endpointpair.md) object from the list would be used with the [ConnectAsync(EndpointPair)](datagramsocket_connectasync_13692504.md) methods
     * @param {HostName} remoteHostName The remote hostname or IP address.
     * @param {HSTRING} remoteServiceName The remote service name or UDP port.
     * @param {Integer} sortOptions 
     * @returns {IAsyncOperation<IVectorView<EndpointPair>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.getendpointpairsasync
     */
    static GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions) {
        if (!DatagramSocket.HasProp("__IDatagramSocketStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.DatagramSocket")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatagramSocketStatics.IID)
            DatagramSocket.__IDatagramSocketStatics := IDatagramSocketStatics(factoryPtr)
        }

        return DatagramSocket.__IDatagramSocketStatics.GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets socket control data on a [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * The [Control](datagramsocket_bindendpointasync_1396029045.md) property gets the [DatagramSocketControl](datagramsocketcontrol.md) instance associated with a [DatagramSocket](datagramsocket.md) object. A [DatagramSocketControl](datagramsocketcontrol.md) object is automatically created with the parent [DatagramSocket](datagramsocket.md) object. The [DatagramSocketControl](datagramsocketcontrol.md) instance can then be used to get or set control data used by the [DatagramSocket](datagramsocket.md). These properties on the [DatagramSocketControl](datagramsocketcontrol.md) instance include the following:
     * 
     * 
     * + [DontFragment](datagramsocketcontrol_dontfragment.md) - Gets or sets a **Boolean** value that specifies whether the [DatagramSocket](datagramsocket.md) allows IP datagrams for UDP to be fragmented.
     * + [InboundBufferSizeInBytes](datagramsocketcontrol_inboundbuffersizeinbytes.md) - Gets or sets the size, in bytes, of the buffer used for receiving data on the [DatagramSocket](datagramsocket.md) object.
     * + [OutboundUnicastHopLimit](datagramsocketcontrol_outboundunicasthoplimit.md) - Gets or sets the hop limit on an outbound packet sent to a unicast IP address by the [DatagramSocket](datagramsocket.md) object.
     * + [QualityOfService](datagramsocketcontrol_qualityofservice.md) - Gets or sets the quality of service on a [DatagramSocket](datagramsocket.md) object.
     * 
     * 
     * The [OutboundUnicastHopLimit](datagramsocketcontrol_outboundunicasthoplimit.md) property can be set before or after the [DatagramSocket](datagramsocket.md) is bound or connected. Before changing this value on a bound or connected [DatagramSocket](datagramsocket.md), any outgoing packets should first be flushed to ensure that all previously-written data is sent out with the previous hop limit.
     * 
     * Any changes to the other property values on the [DatagramSocketControl](datagramsocketcontrol.md) must be set before the [DatagramSocket](datagramsocket.md) is bound or connected. As a result if you need to make changes to the [DontFragment](datagramsocketcontrol_dontfragment.md), [InboundBufferSizeInBytes](datagramsocketcontrol_inboundbuffersizeinbytes.md), or [QualityOfService](datagramsocketcontrol_qualityofservice.md) properties, then these changes must occur before a successful call to the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md), [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md), or one of the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods on the [DatagramSocket](datagramsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.control
     * @type {DatagramSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * Gets socket information on the local and remote hostnames and local and remote service names for the [DatagramSocket](datagramsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.information
     * @type {DatagramSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Gets the output stream to write to the remote host.
     * @remarks
     * This property is often used with the [DataWriter](../windows.storage.streams/datawriter.md) object to write outgoing data to be sent to the remote network destination on a socket object.
     * 
     * Every write to the OutputStream results in a network packet being sent.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * An event that indicates that a message was received on the [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * To receive data on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived  event to an event handler and then call either the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind the [DatagramSocket](datagramsocket.md) to a local service name or UDP port. The [ConnectAsync](datagramsocket_connectasync_13692504.md) methods will also result in a bind operation. Writing to a stream returned by one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods will also result in a bind operation. The MessageReceived event handler will be invoked whenever a message from a remote endpoint arrives.
     * 
     * To receive multicast packets on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived  event to an event handler and then call the [JoinMulticastGroup](datagramsocket_joinmulticastgroup_1508568147.md) method to join the multicast group.
     * 
     * To unregister the [MessageReceived  event, the [DatagramSocket](datagramsocket.md) object must be closed. The [Close](datagramsocket_close_811482585.md) method is used by Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the [Close](datagramsocket_close_811482585.md) method is exposed as the  method on the [DatagramSocket](datagramsocket.md). For apps written in C++, the [Close](datagramsocket_close_811482585.md) method will be called when using the delete keyword on the object.
     * @type {TypedEventHandler<DatagramSocket, DatagramSocketMessageReceivedEventArgs>}
    */
    OnMessageReceived {
        get {
            if(!this.HasProp("__OnMessageReceived")){
                this.__OnMessageReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4482e19b-2389-5767-9b0b-8d7a8ef55743}"),
                    DatagramSocket,
                    DatagramSocketMessageReceivedEventArgs
                )
                this.__OnMessageReceivedToken := this.add_MessageReceived(this.__OnMessageReceived.iface)
            }
            return this.__OnMessageReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [DatagramSocket](datagramsocket.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.DatagramSocket")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageReceivedToken")) {
            this.remove_MessageReceived(this.__OnMessageReceivedToken)
            this.__OnMessageReceived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {DatagramSocketControl} 
     */
    get_Control() {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.get_Control()
    }

    /**
     * 
     * @returns {DatagramSocketInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.get_Information()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.get_OutputStream()
    }

    /**
     * Starts a connect operation on a [DatagramSocket](datagramsocket.md) to a remote network destination specified as an [EndpointPair](../windows.networking/endpointpair.md) object.
     * @remarks
     * This ConnectAsync(EndPointPair) method on a [DatagramSocket](datagramsocket.md) is used to define the local and remote endpoint where datagrams will be sent when using the [OutputStream](datagramsocket_outputstream.md) property. This method also restricts remote IP addresses of packets that will be accepted to the remote hostname in the *endpointPair* parameter. Only incoming packets that match the remote endpoint in the *endpointPair* parameter will trigger the [MessageReceived](datagramsocket_messagereceived.md) event on the [DatagramSocket](datagramsocket.md).
     * 
     * The app can later send network data to the remote network destination by calling the [WriteAsync](../windows.storage.streams/ioutputstream_writeasync_897036872.md) method on the [OutputStream](datagramsocket_outputstream.md) property of the [DatagramSocket](datagramsocket.md) or by passing the [OutputStream](datagramsocket_outputstream.md) to a [DataWriter](../windows.storage.streams/datawriter.md) object and calling methods of the [DataWriter](../windows.storage.streams/datawriter.md) object.
     * 
     * The [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) property of the [EndpointPair](../windows.networking/endpointpair.md) passed in the *endpointPair* parameter can contain either the hostname or IP address of the remote destination. The [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) property of the [EndpointPair](../windows.networking/endpointpair.md) passed in the *endpointPair* parameter can contain either the service name or a UDP port of the remote destination. If the [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) property contains a hostname, then the ConnectAsync(EndPointPair) method will resolve the remote hostname to an IP address. If the [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) property of the [EndpointPair](../windows.networking/endpointpair.md) contains a service name, then the ConnectAsync(EndPointPair) method will resolve the remote service name to a UDP port number.
     * 
     * The service name strings that are recognized by default are those service names listed in the *%windir%\System32\drivers\etc\services* file on the local computer. Any other service name value results in a name service query to domain name system (DNS) servers for DNS SRV records.
     * 
     * The [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) and [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) properties must be provided. If the [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) is null or if the [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) is null or an empty string, an error will occur.
     * 
     * If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains a null [LocalHostName](../windows.networking/endpointpair_localhostname.md) property, then the system will supply the local IP address that will be used. If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains an empty [LocalServiceName](../windows.networking/endpointpair_localservicename.md) property, then the system will supply the local UDP port that will be used.
     * 
     * There are two ways of using a [DatagramSocket](datagramsocket.md) to send UDP datagrams to a remote network destination:
     * + Using one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods.
     * + After a successful call to the **ConnectAsync** method using the [OutputStream](datagramsocket_outputstream.md) property.
     * 
     * 
     * The [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods allow an app to send UDP datagrams using a [DatagramSocket](datagramsocket.md) object to multiple network destinations. Each time the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) method is called, the app can set different values for the *remoteHostName* and *remoteServiceName* parameters.
     * 
     * To receive data from a single remote endpoint on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler and then call the ConnectAsync(EndPointPair) method with the *endpointPair* parameter set to the remote endpoint information. The [MessageReceived](datagramsocket_messagereceived.md) event handler must be set before any bind or connect operation, otherwise an error will occur.
     * 
     * The typical order of operations is as follows:
     * 
     * 
     * + Create the [DatagramSocket](datagramsocket.md).
     * + Use the [Control](datagramsocket_control.md) property on the [DatagramSocket](datagramsocket.md) to retrieve a [DatagramSocketControl](datagramsocketcontrol.md) object and set any advanced controls. This step is not normally needed by most apps.
     * + Assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler.
     * + Call the [ConnectAsync](datagramsocket_connectasync_1841953676.md) method to connect to the remote endpoint.
     * + Use the [OutputStream](datagramsocket_outputstream.md) property on the [DatagramSocket](datagramsocket.md) with a [DataWriter](../windows.storage.streams/datawriter.md) object to send messages to the remote endpoint.
     * + The [MessageReceived](datagramsocket_messagereceived.md) event handler will be invoked whenever a message from the remote endpoint arrives.
     * The [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods also differ from the ConnectAsync method when an app uses the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind to a local service name or UDP port. With the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods, the app will receive packets from any remote destination sent to the local service name or UDP port. With the ConnectAsync methods, the app will only receive packets from the remote destination passed as parameters to the ConnectAsync methods.
     * 
     * The [BindServiceNameAsync(String, NetworkAdapter)](datagramsocket_bindservicenameasync_440542334.md) method can be used to specify a network adapter before calling the ConnectAsync(EndPointPair) method. The specified adapter is used for the bind operation. If after calling [BindServiceNameAsync(String, NetworkAdapter)](datagramsocket_bindservicenameasync_440542334.md) method and the *endpointPair* parameter passed to ConnectAsync(EndPointPair) specifies a [LocalHostName](../windows.networking/endpointpair_localhostname.md), the ConnectAsync(EndPointPair) method will fail.
     * 
     * The **ConnectAsync** method only works for unicast IP addresses. When trying to call the **ConnectAsync** method with a multicast IP address in the remote IP address set in the *endpointPair* parameter, the asynchronous operation will complete with an error. When passing the error to the [SocketError.GetStatus](socketerror_getstatus_1856274933.md) method, the value returned will be [SocketErrorStatus.HostNotFound](socketerrorstatus.md).
     * 
     * Using **ConnectAsync** with a broadcast IP address such as 255.255.255.255 will connect, but will broadcast only through the first network adapter found. To broadcast on all available adapters, use [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md).
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.connectasync
     */
    ConnectAsync(remoteHostName, remoteServiceName) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.ConnectAsync(remoteHostName, remoteServiceName)
    }

    /**
     * Starts a connect operation on a [DatagramSocket](datagramsocket.md) to a remote destination specified by a remote hostname and a remote service name.
     * @remarks
     * The **ConnectAsync** method on a [DatagramSocket](datagramsocket.md) is used to define the remote hostname or remote IP address and the remote service name or UDP port number where datagrams will be sent when using the [OutputStream](datagramsocket_outputstream.md) property. This method also restricts the remote IP addresses of packets that will be accepted to the *remoteHostName* parameter. Only incoming packets that match the *remoteHostName* parameter will trigger the [MessageReceived](datagramsocket_messagereceived.md) event on the [DatagramSocket](datagramsocket.md).
     * 
     * The app can later send network data to the remote network destination by calling the [WriteAsync](../windows.storage.streams/ioutputstream_writeasync_897036872.md) method on the [OutputStream](datagramsocket_outputstream.md) property of the [DatagramSocket](datagramsocket.md) or by passing the [OutputStream](datagramsocket_outputstream.md) to a [DataWriter](../windows.storage.streams/datawriter.md) object and calling methods of the [DataWriter](../windows.storage.streams/datawriter.md) object.
     * 
     * The *remoteHostName* parameter can contain either the hostname or IP address of the remote destination. The *remoteServiceName* parameter can contain either the service name or an UDP port of the remote destination. If the *remoteHostName* parameter contains a hostname, then the **ConnectAsync** method will resolve the remote hostname to an IP address. If the *remoteServiceName* parameter contains a service name, then the **ConnectAsync** method will resolve the remote service name to a UDP port number.
     * 
     * The service name strings that are recognized by default by the *remoteServiceName* parameter are those service names listed in the *%windir%\System32\drivers\etc\services* file on the local computer. Any other service name value results in a name service query to domain name system (DNS) servers for DNS SRV records.
     * 
     * The *remoteHostName* and *remoteServiceName* parameters must be provided. If the *remoteHostName* is null or the *remoteServiceName* is null or an empty string, an error will occur.
     * 
     * There are two ways of using a [DatagramSocket](datagramsocket.md) to send UDP datagrams to a remote network destination:
     * + Use one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods.
     * + After a successful call to the **ConnectAsync** method use the [OutputStream](datagramsocket_outputstream.md) property.
     * 
     * 
     * The [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods allow an app to send UDP datagrams using a [DatagramSocket](datagramsocket.md) object to multiple network destinations. Each time the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) method is called, the app can set different values for the *remoteHostName* and *remoteServiceName* parameters.
     * 
     * To receive data from a single endpoint on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler and then call the **ConnectAsync** method with the *remoteHostName* and *remoteServiceName* parameters set to the remote endpoint information. The [MessageReceived](datagramsocket_messagereceived.md) event handler must be set before any bind or connect operation, otherwise an error will occur.
     * 
     * The typical order of operations is as follows:
     * 
     * 
     * 1. Create the [DatagramSocket](datagramsocket.md).
     * 1. Use the [Control](datagramsocket_control.md) property on the [DatagramSocket](datagramsocket.md) to retrieve a [DatagramSocketControl](datagramsocketcontrol.md) object and set any advanced controls. This step is not normally needed by most apps.
     * 1. Assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler.
     * 1. Call the **ConnectAsync** method to connect to the remote endpoint.
     * 1. Use the [OutputStream](datagramsocket_outputstream.md) property on the [DatagramSocket](datagramsocket.md) with a [DataWriter](../windows.storage.streams/datawriter.md) object to send messages to the remote endpoint.
     * 1. The [MessageReceived](datagramsocket_messagereceived.md) event handler will be invoked whenever a message from the remote endpoint arrives.
     * The [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods also differ from the [ConnectAsync](datagramsocket_connectasync_13692504.md) method when an app uses the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind to a local service name or UDP port. With the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods, the app will receive packets from any remote destination sent to the local service name or UDP port. With the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods, the app will only receive packets from the remote destination passed as parameters to the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods.
     * 
     * The **ConnectAsync** method only works for unicast IP addresses. When trying to call the **ConnectAsync** method with a multicast IP address for the *remoteHostName* parameter, the asynchronous operation will complete with an error. When passing the error to the [SocketError.GetStatus](socketerror_getstatus_1856274933.md) method, the value returned will be [SocketErrorStatus.HostNotFound](socketerrorstatus.md).
     * 
     * Using **ConnectAsync** with a broadcast IP address such as 255.255.255.255 will connect, but will broadcast only through the first network adapter found. To broadcast on all available adapters, use [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md).
     * @param {EndpointPair} endpointPair_ 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.connectasync
     */
    ConnectWithEndpointPairAsync(endpointPair_) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.ConnectWithEndpointPairAsync(endpointPair_)
    }

    /**
     * Starts a bind operation on a [DatagramSocket](datagramsocket.md) to a local service name and specific network interface.
     * @remarks
     * The [BindServiceNameAsync(String, NetworkAdapter) method binds to a network interface specified in the *adapter* parameter and the local service name or UDP port specified in the *localServiceName* parameter on the local computer. If the *localServiceName* parameter is an empty string, the system will select the local UDP port on which to bind. If the *adapter* parameter is null, an error will occur.
     * 
     * The name resolution mechanism used by the [BindServiceNameAsync(String, NetworkAdapter) method is limited to the specified interface for the domain name system (DNS) namespace.
     * 
     * Unless you've used the [DatagramSocketControl.MulticastOnly](/uwp/api/windows.networking.sockets.datagramsocketcontrol.multicastonly) property, the BindServiceNameAsync method will fail if another app using UDP (another [DatagramSocket](datagramsocket.md), for example) has already been bound to the local UDP port specified in the *localServiceName* parameter on the same network interface.
     * 
     * Binding is essential for receiving data from any remote endpoint on a [DatagramSocket](datagramsocket.md), and is commonly done after a socket is created and the [MessageReceived](datagramsocket_messagereceived.md) event has been set. The BindServiceNameAsync or [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) method is used to bind a [DatagramSocket](datagramsocket.md) to a local service name or UDP port. The [ConnectAsync](datagramsocket_connectasync_13692504.md) methods will also result in a bind operation, but can't be limited to a specific network adapter. Writing to a stream returned by one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods will also result in a bind operation if the socket isn't already bound, but can't be limited to a specific network adapter.
     * 
     * The BindServiceNameAsync and [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) methods are not needed in the following cases:
     * + The [DatagramSocket](datagramsocket.md) is used only to send data.
     * + The [DatagramSocket](datagramsocket.md) is used to send data to and receive data from a single endpoint.
     * 
     * 
     * If the [BindServiceNameAsync(String, NetworkAdapter) method is used, the bind operation will limit incoming and outgoing multicast and unicast packets to the specified adapter.
     * 
     * Using the specified network adapter is on a best-effort basis. Among other configuration, systems with adapters configured in weak-host or forwarding modes may use an adapter other than the specified adapter.
     * @param {HSTRING} localServiceName The local service name or UDP port on which to bind the [DatagramSocket](datagramsocket.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.bindservicenameasync
     */
    BindServiceNameAsync(localServiceName) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.BindServiceNameAsync(localServiceName)
    }

    /**
     * Starts a bind operation on a [DatagramSocket](datagramsocket.md) to a local hostname and a local service name.
     * @remarks
     * The BindEndpointAsync method binds the [DatagramSocket](datagramsocket.md) to the local hostname or IP address specified in the *localHostName* parameter and the local service name or UDP port number address specified in the *localServiceName* parameter. If the *localHostName* parameter is null, the system will select the local IP address on which to bind. If the *localServiceName* parameter is an empty string, the system will select the local UDP port on which to bind.
     * 
     * Unless you've used the [DatagramSocketControl.MulticastOnly](/uwp/api/windows.networking.sockets.datagramsocketcontrol.multicastonly) property, the **BindEndpointAsync** method will fail if another app using UDP (for example, another [DatagramSocket](datagramsocket.md)) has already been bound to the local IP address and UDP port specified in the *localHostName* and *localServiceName* parameters.
     * 
     * Binding is essential for receiving data from any remote endpoint on a [DatagramSocket](datagramsocket.md), and is commonly done after a socket is created and the [MessageReceived](datagramsocket_messagereceived.md) event has been set. The [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) or BindEndpointAsync method is used to bind a [DatagramSocket](datagramsocket.md) to a local service name or UDP port. The [ConnectAsync](datagramsocket_connectasync_13692504.md) methods will also result in a bind operation if the socket isn't already bound. Writing to a stream returned by one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods will also result in a bind operation.
     * 
     * The [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) and BindEndpointAsync methods are not needed in the following cases:
     * + The [DatagramSocket](datagramsocket.md) is used only to send data.
     * + The [DatagramSocket](datagramsocket.md) is used to send data to and receive data from a single endpoint.
     * @param {HostName} localHostName The local hostname or IP address on which to bind the [DatagramSocket](datagramsocket.md) object.
     * @param {HSTRING} localServiceName The local service name or UDP port on which to bind the [DatagramSocket](datagramsocket.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.bindendpointasync
     */
    BindEndpointAsync(localHostName, localServiceName) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.BindEndpointAsync(localHostName, localServiceName)
    }

    /**
     * Joins a [DatagramSocket](datagramsocket.md) object to a multicast group.
     * @remarks
     * To receive multicast packets on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler, bind to a local service name or UDP port and a local hostname or IP address using the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method, and then call the JoinMulticastGroup method to join the multicast group.
     * 
     * If a network adapter was specified to the [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method, only groups on networks present on the specified adapter will be joined.
     * 
     * An app receiving multicast packets may also need to deal with network adapter changes. If network connectivity changes and the local computer or device is assigned a different IP address, the app needs to rejoin the multicast group.
     * @param {HostName} host The hostname or IP address for the multicast group.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.joinmulticastgroup
     */
    JoinMulticastGroup(host) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.JoinMulticastGroup(host)
    }

    /**
     * Starts an operation to get an [IOutputStream](../windows.storage.streams/ioutputstream.md) to a remote network destination specified by an [EndpointPair](../windows.networking/endpointpair.md) object that can then be used to send network data.
     * @remarks
     * The GetOutputStreamAsync(EndpointPair) method on a [DatagramSocket](datagramsocket.md) is used to start an operation to get an [IOutputStream](../windows.storage.streams/ioutputstream.md) to a remote network destination specified by an [EndpointPair](../windows.networking/endpointpair.md) object. The [IOutputStream](../windows.storage.streams/ioutputstream.md) can then be used to send data to the remote destination.
     * 
     * The GetOutputStreamAsync(EndpointPair) method will return an [IOutputStream](../windows.storage.streams/ioutputstream.md) when it completes successfully. Writing to that stream will send datagrams to the remote host and service name specified. The [IOutputStream](../windows.storage.streams/ioutputstream.md) will always send to the remote hostname and remote service name specified in the [ConnectAsync](datagramsocket_connectasync_1841953676.md) method.
     * 
     * The [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) property of the [EndpointPair](../windows.networking/endpointpair.md) passed in the *endpointPair* parameter can contain either the hostname or IP address of the remote destination. The [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) property of the [EndpointPair](../windows.networking/endpointpair.md) passed in the *endpointPair* parameter can contain either the service name or a UDP port of the remote destination. If the [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) property contains a hostname, then the GetOutputStreamAsync(EndpointPair) method results in name resolution of the remote hostname. If the [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) property contains a service name, then the GetOutputStreamAsync method results in resolution of the remote service name to a UDP port.
     * 
     * The [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) and [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) properties must be provided on the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter. If the [RemoteHostName](../windows.networking/endpointpair_remotehostname.md) is **null** or the [RemoteServiceName](../windows.networking/endpointpair_remoteservicename.md) is **null** or an empty string, an error will occur.
     * 
     * If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains a null [LocalHostName](../windows.networking/endpointpair_localhostname.md) property, then the system will supply the local IP address that will be used. If the [EndpointPair](../windows.networking/endpointpair.md) object passed in the *endpointPair* parameter contains an empty string for the [LocalServiceName](../windows.networking/endpointpair_localservicename.md) property, then the system will supply the local UDP port that will be used.
     * 
     * There are two ways of using a [DatagramSocket](datagramsocket.md) to send UDP datagrams to a remote network destination:
     * + Use one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods.
     * + After a successful call to one of the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods, pass the [OutputStream](datagramsocket_outputstream.md) property to a [DataWriter](../windows.storage.streams/datawriter.md) object and use methods on the [DataWriter](../windows.storage.streams/datawriter.md) object to send data.
     * 
     * 
     * The [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods allow an app to send UDP datagrams using a [DatagramSocket](datagramsocket.md) object to multiple network destinations. Each time the GetOutputStreamAsync(EndpointPair) method is called, the app can set different values for the **RemoteHostName** and **RemoteServiceName** members in the *endpointPair* parameter.
     * 
     * To receive data from any remote endpoint on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler and then call either [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind the [DatagramSocket](datagramsocket.md) to a local service name or UDP port before calling the GetOutputStreamAsync method. The [MessageReceived](datagramsocket_messagereceived.md) event handler must be set before any bind or connect operation, otherwise an error will occur.
     * 
     * The typical order of operations is as follows:
     * 
     * 
     * 1. Create the [DatagramSocket](datagramsocket.md).
     * 1. Use the [Control](datagramsocket_control.md) property to retrieve a [DatagramSocketControl](datagramsocketcontrol.md) object and set any advanced controls. This step is not normally needed by most apps.
     * 1. Assign the [MessageReceived](datagramsocket_messagereceived.md) event to an event handler.
     * 1. Call the GetOutputStreamAsync(EndpointPair) method to get the [OutputStream](datagramsocket_outputstream.md) to send data to the remote endpoint. The GetOutputStreamAsync(EndpointPair) method will also bind the [DatagramSocket](datagramsocket.md) to a local service name or UDP port and a local hostname or IP address using the *endpointPair* parameter.
     * 1. The [MessageReceived](datagramsocket_messagereceived.md) event handler will be invoked whenever a message from the remote endpoint arrives.
     * The [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods also differ from the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods when an app uses the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind a local service name or UDP port. With the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods, the app will receive packets from any remote destination sent to the local service name or UDP port. With the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods, the app will only receive packets from the remote destination passed as parameters to the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods.
     * 
     * The [BindServiceNameAsync(String, NetworkAdapter)](datagramsocket_bindservicenameasync_440542334.md) method can be used to specify a network adapter before calling the GetOutputStreamAsync(EndpointPair) method. The specified adapter is used for the bind operation. If after calling [BindServiceNameAsync(String, NetworkAdapter)](datagramsocket_bindservicenameasync_440542334.md) and the *endpointPair* parameter passed to GetOutputStreamAsync(EndpointPair) specifies a [LocalHostName](../windows.networking/endpointpair_localhostname.md), the GetOutputStreamAsync(EndpointPair) method will fail.
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {IAsyncOperation<IOutputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.getoutputstreamasync
     */
    GetOutputStreamAsync(remoteHostName, remoteServiceName) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.GetOutputStreamAsync(remoteHostName, remoteServiceName)
    }

    /**
     * Starts an operation to get an [IOutputStream](../windows.storage.streams/ioutputstream.md) to a remote destination specified by a remote hostname and a remote service name that can then be used to send network data.
     * @remarks
     * The [GetOutputStreamAsync(HostName, String) method on a [DatagramSocket](datagramsocket.md) is used to start an operation to get an [IOutputStream](../windows.storage.streams/ioutputstream.md) to a remote network destination specified by a remote hostname and a remote service name. The [IOutputStream](../windows.storage.streams/ioutputstream.md) can then be used to send data to the remote destination.
     * 
     * The [GetOutputStreamAsync(HostName, String) method will return an [IOutputStream](../windows.storage.streams/ioutputstream.md) when it completes successfully. Writing to that stream will send datagrams to the remote host and service name specified. The [IOutputStream](../windows.storage.streams/ioutputstream.md) will always send to the remote hostname and remote service name specified in the [ConnectAsync](datagramsocket_connectasync_1841953676.md) method.
     * 
     * The *remoteHostName* parameter can contain either the hostname or IP address of the remote destination. The *remoteServiceName* parameter can contain either the service name or a UDP port of the remote destination. If the *remoteHostName* parameter contains a hostname, then the [GetOutputStreamAsync(HostName, String) method results in name resolution of the remote hostname. If the *remoteServiceName* parameter contains a service name, then the [GetOutputStreamAsync(HostName, String) method results in resolution of the remote service name to a UDP port.
     * 
     * The *remoteHostName* and *remoteServiceName* parameters must be provided. If the *remoteHostName* parameter is null or the *remoteServiceName* parameter is null or an empty string, an error will occur.
     * 
     * There are two ways of using a [DatagramSocket](datagramsocket.md) to send UDP datagrams to a remote network destination:
     * + Use one of the GetOutputStreamAsync methods.
     * + After a successful call to one of the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods, pass the [OutputStream](datagramsocket_outputstream.md) property to a [DataWriter](../windows.storage.streams/datawriter.md) object and use methods on the [DataWriter](../windows.storage.streams/datawriter.md) object to send data.
     * 
     * 
     * The GetOutputStreamAsync methods allow an app to send UDP datagrams using a [DatagramSocket](datagramsocket.md) object to multiple network destinations. Each time the [GetOutputStreamAsync(HostName, String) method is called, the app can set different values for the *remoteHostName* and *remoteServiceName* parameters.
     * 
     * The [ConnectAsync](datagramsocket_connectasync_13692504.md) methods allow an app to send UDP datagrams using a [DatagramSocket](datagramsocket.md) object to a single network destination.
     * 
     * To receive data from any remote endpoint on the [DatagramSocket](datagramsocket.md) object, an app must assign the [MessageReceived ](datagramsocket_messagereceived.md) event to an event handler and then call either [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind the [DatagramSocket](datagramsocket.md) to a local service name or UDP port before calling the GetOutputStreamAsync method. The [MessageReceived](datagramsocket_messagereceived.md) event handler must be set before any bind or connect operation, otherwise an error will occur.
     * 
     * The typical order of operations is as follows:
     * 
     * 
     * 1. Create the [DatagramSocket](datagramsocket.md).
     * 1. Use the [Control](datagramsocket_control.md) property to retrieve a [DatagramSocketControl](datagramsocketcontrol.md) object and set any advanced controls. This step is not normally needed by most apps.
     * 1. Assign the [MessageReceived](datagramsocket_messagereceived.md) event to an event handler.
     * 1. Bind the [DatagramSocket](datagramsocket.md) to a local service name or UDP port.
     * 1. The [MessageReceived](datagramsocket_messagereceived.md) event handler will be invoked whenever a message from the remote endpoint arrives.
     * 1. Call the GetOutputStreamAsync method to get the [OutputStream](datagramsocket_outputstream.md) to send data to the remote endpoint. You can use the information contained in the [DatagramSocketMessageReceivedEventArgs](datagramsocketmessagereceivedeventargs.md) from the [MessageReceived](datagramsocket_messagereceived.md) event handler to establish an [OutputStream](datagramsocket_outputstream.md) with the remote endpoint that authored a specific incoming message.
     * The GetOutputStreamAsync methods also differ from the [ConnectAsync](datagramsocket_connectasync_13692504.md) method when an app uses the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) or [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method to bind to a local service name or UDP port. With the GetOutputStreamAsync methods, the app will receive packets from any remote destination sent to the local service name or UDP port. With the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods, the app will only receive packets from the remote destination passed as parameters to the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods.
     * @param {EndpointPair} endpointPair_ 
     * @returns {IAsyncOperation<IOutputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.getoutputstreamasync
     */
    GetOutputStreamWithEndpointPairAsync(endpointPair_) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.GetOutputStreamWithEndpointPairAsync(endpointPair_)
    }

    /**
     * 
     * @param {TypedEventHandler<DatagramSocket, DatagramSocketMessageReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(eventHandler) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.add_MessageReceived(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(eventCookie) {
        if (!this.HasProp("__IDatagramSocket")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket := IDatagramSocket(outPtr)
        }

        return this.__IDatagramSocket.remove_MessageReceived(eventCookie)
    }

    /**
     * Closes the [DatagramSocket](datagramsocket.md) object and aborts any pending operation on the **DatagramSocket**.
     * @remarks
     * The **Close** method aborts any pending operations and releases all unmanaged resources associated with the [DatagramSocket](datagramsocket.md) object.
     * 
     * Calling the **Close** method on the **DatagramSocket** also unregisters the [MessageReceived](datagramsocket_messagereceived.md) event.
     * 
     * The **Close** method is used by Windows apps using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the [Dispose](/uwp/api/windows.networking.sockets.datagramsocket.dispose) method on the [DatagramSocket](datagramsocket.md). For apps written in C++, the **Close** method is called when the object's destructor runs.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.close
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
     * Starts a bind operation on a [DatagramSocket](datagramsocket.md) to a local service name.
     * @remarks
     * The [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method binds to the local IP addresses of all network interfaces on the local computer on the local service name or UDP port specified in the *localServiceName* parameter. If the *localServiceName* parameter is an empty string, the system will select the local UDP port on which to bind.
     * 
     * Unless you've used the [DatagramSocketControl.MulticastOnly](/uwp/api/windows.networking.sockets.datagramsocketcontrol.multicastonly) property, the [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) method will fail if another app using UDP (another [DatagramSocket](datagramsocket.md), for example) has already been bound to the local UDP port specified in the *localServiceName* parameter.
     * 
     * Binding is essential for receiving data from any remote endpoint on a [DatagramSocket](datagramsocket.md), and is commonly done after a socket is created and the [MessageReceived](datagramsocket_messagereceived.md) event has been set. The [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) or [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) method is used to bind a [DatagramSocket](datagramsocket.md) to a local service name or UDP port. The [ConnectAsync](datagramsocket_connectasync_13692504.md) methods will also result in a bind operation. Writing to a stream returned by one of the [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) methods will also result in a bind operation if the socket isn't already bound.
     * 
     * The [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) and [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) methods are not needed in the following cases:
     * + The [DatagramSocket](datagramsocket.md) is used only to send data.
     * + The [DatagramSocket](datagramsocket.md) is used to send data to and receive data from a single endpoint.
     * @param {HSTRING} localServiceName The local service name or UDP port on which to bind the [DatagramSocket](datagramsocket.md) object.
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.bindservicenameasync
     */
    BindServiceNameAndAdapterAsync(localServiceName, adapter_) {
        if (!this.HasProp("__IDatagramSocket2")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket2 := IDatagramSocket2(outPtr)
        }

        return this.__IDatagramSocket2.BindServiceNameAndAdapterAsync(localServiceName, adapter_)
    }

    /**
     * Cancels pending reads and writes over a [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * Call CancelIOAsync to cancel any pending reads or writes on this socket before you call [TransferOwnership](datagramsocket_transferownership_1291619316.md) when your app is about to be suspended.
     * 
     * CancelIOAsync does not guarantee that all read/write completion handlers have finished executing before it signals completion. It does, however, guarantee that all I/O operations will have reached a terminal state (either Completed or Error) by the time it signals completion. If your app needs to wait for all pending I/O operation handlers to finish executing, you must implement your own app-level sychronization logic. The [Socket Activity Stream Socket](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/SocketActivityStreamSocket) sample demonstrates one way to do this for [StreamSocket](streamsocket.md). The technique is similar for [DatagramSocket](datagramsocket.md).
     * 
     * 
     * 
     * > [!NOTE]
     * > CancelIOAsync cancels pending writes and reads in the Windows Runtime, but if there is a write buffer pending in networking drivers, it flushes the write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.cancelioasync
     */
    CancelIOAsync() {
        if (!this.HasProp("__IDatagramSocket3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket3 := IDatagramSocket3(outPtr)
        }

        return this.__IDatagramSocket3.CancelIOAsync()
    }

    /**
     * Enables your app's background task to be triggered by the socket broker when traffic for this [DatagramSocket](datagramsocket.md) arrives while the app is not active.
     * @param {Guid} taskId The [IBackgroundTaskRegistration.TaskId](../windows.applicationmodel.background/ibackgroundtaskregistration_taskid.md) of the background task that will be triggered by the socket broker when traffic arrives for this [DatagramSocket](datagramsocket.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.enabletransferownership
     */
    EnableTransferOwnership(taskId) {
        if (!this.HasProp("__IDatagramSocket3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket3 := IDatagramSocket3(outPtr)
        }

        return this.__IDatagramSocket3.EnableTransferOwnership(taskId)
    }

    /**
     * Enables your app's background task to be triggered by the socket broker when traffic for this [DatagramSocket](datagramsocket.md) arrives while the system is in connected standby.
     * @param {Guid} taskId The [IBackgroundTaskRegistration.TaskId](../windows.applicationmodel.background/ibackgroundtaskregistration_taskid.md) of the background task that will be triggered by the socket broker when traffic arrives for this [DatagramSocket](datagramsocket.md).
     * @param {Integer} connectedStandbyAction Specifies whether to enable or disable the activation of the background task when traffic arrives.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.enabletransferownership
     */
    EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction) {
        if (!this.HasProp("__IDatagramSocket3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket3 := IDatagramSocket3(outPtr)
        }

        return this.__IDatagramSocket3.EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction)
    }

    /**
     * Transfers ownership of the [DatagramSocket](datagramsocket.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity.
     * @remarks
     * Your app should call this method to transfer ownership of the [DatagramSocket](datagramsocket.md) to the socket brokering service when the app is about to be suspended, or at the end of a background task. Your app should not access the [DatagramSocket](datagramsocket.md) object after calling this method, except when responding to notifications from the socket brokering service.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.transferownership
     */
    TransferOwnership(socketId) {
        if (!this.HasProp("__IDatagramSocket3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket3 := IDatagramSocket3(outPtr)
        }

        return this.__IDatagramSocket3.TransferOwnership(socketId)
    }

    /**
     * Transfers ownership of the [DatagramSocket](datagramsocket.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity.
     * @remarks
     * Your app should call this method to transfer ownership of the [DatagramSocket](datagramsocket.md) to the socket brokering service when the app is about to be suspended, or at the end of a background task. Your app should not access the [DatagramSocket](datagramsocket.md) object after calling this method, except when responding to notifications from the socket brokering service.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @param {SocketActivityContext} data Use the [SocketActivityContext](socketactivitycontext.md) to pass context information through the socket broker. When your app is notified by the broker of activity, this [SocketActivityContext](socketactivitycontext.md) will be provided to your app to help establish the context in which you should handle the notification.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.transferownership
     */
    TransferOwnershipWithContext(socketId, data) {
        if (!this.HasProp("__IDatagramSocket3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket3 := IDatagramSocket3(outPtr)
        }

        return this.__IDatagramSocket3.TransferOwnershipWithContext(socketId, data)
    }

    /**
     * Transfers ownership of the [DatagramSocket](datagramsocket.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity.
     * @remarks
     * Your app should call this method to transfer ownership of the [DatagramSocket](datagramsocket.md) to the socket brokering service when the app is about to be suspended, or at the end of a background task. Your app should not access the [DatagramSocket](datagramsocket.md) object after calling this method, except when responding to notifications from the socket brokering service.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @param {SocketActivityContext} data Use the [SocketActivityContext](socketactivitycontext.md) to pass context information through the socket broker. When your app is notified by the broker of activity, this [SocketActivityContext](socketactivitycontext.md) will be provided to your app to help establish the context in which you should handle the notification.
     * @param {TimeSpan} keepAliveTime How long the socket brokering service should monitor the socket for activity.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocket.transferownership
     */
    TransferOwnershipWithContextAndKeepAliveTime(socketId, data, keepAliveTime) {
        if (!this.HasProp("__IDatagramSocket3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocket3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocket3 := IDatagramSocket3(outPtr)
        }

        return this.__IDatagramSocket3.TransferOwnershipWithContextAndKeepAliveTime(socketId, data, keepAliveTime)
    }

;@endregion Instance Methods
}
