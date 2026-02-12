#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveEndpointPair.ahk
#Include .\IXboxLiveEndpointPairStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\XboxLiveEndpointPair.ahk
#Include .\XboxLiveEndpointPairStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An **XboxLiveEndpointPair** is a security and network quality relationship established between two devices for socket-based communication.
  * 
  * The **Windows.Networking.XboxLive** API enables peer-to-peer (P2P) connectivity in varied environments, leveraging IPv4, IPv6, and Microsoft's Network Address Translation (NAT) traversal technologies and services (such as Teredo) to determine and configure the best available network path between endpoints. It also establishes encryption of traffic and protection against tampering, as a measure to reduce cheating. Additionally, it authenticates users and applications through the Xbox Live ecosystem&dmash;integrating connectivity information with other Xbox Live services. This information can then be used in matchmaking, to attempt to match players with similar connectivity stats against each other.
  * 
  * The **Windows.Networking.XboxLive** API complements and extends traditional networking transports such as TCP and UDP, and the available sockets APIs, WinSock and **Windows.Networking.Sockets**. You create an **XboxLiveEndpointPair** using this API, and then use your preferred transport API for actual data transmission. The **XboxLiveEndpointPair** concept itself is related to **Windows.Networking.EndpointPair** in that it can be interpreted as a set of local and remote IP addresses and ports; but with an **XboxLiveEndpointPair**, those properties are read-only (because the system negotiates them) and have an associated validity lifetime (because an **XboxLiveEndpointPair** represents an active security relationship that can be terminated for various reasons).
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * You don't create instances of this class using a constructor. Instead, you do so using one of the **CreateEndpointPairAsync** or **CreateEndpointPairForPorts** methods in the **XboxLiveEndpointPairTemplate** class, in order to create an endpoint pair that follows a particular communication template.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPair extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveEndpointPair

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveEndpointPair.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Finds an existing **XboxLiveEndpointPair** instance, if one exists, associated with traffic between two given socket addresses, where the socket addresses are provided as arrays of Byte containing Winsock **SOCKADDR_STORAGE** or related structures.
     * 
     * Use this method to work backwards from incoming traffic to the **XboxLiveEndpointPair** associated with that traffic.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {Integer} localSocketAddress_length 
     * @param {Pointer<Integer>} localSocketAddress Address of the local socket, as an array of Byte containing a Winsock **SOCKADDR_STORAGE** or related structure, for example, the array returned when you call **GetLocalSocketAddressBytes**.
     * @param {Integer} remoteSocketAddress_length 
     * @param {Pointer<Integer>} remoteSocketAddress Address of the remote socket, as an array of Byte containing a Winsock **SOCKADDR_STORAGE** or related structure, for example, the array returned when you call **GetRemoteSocketAddressBytes**.
     * @returns {XboxLiveEndpointPair} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.findendpointpairbysocketaddressbytes
     */
    static FindEndpointPairBySocketAddressBytes(localSocketAddress_length, localSocketAddress, remoteSocketAddress_length, remoteSocketAddress) {
        if (!XboxLiveEndpointPair.HasProp("__IXboxLiveEndpointPairStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveEndpointPair")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveEndpointPairStatics.IID)
            XboxLiveEndpointPair.__IXboxLiveEndpointPairStatics := IXboxLiveEndpointPairStatics(factoryPtr)
        }

        return XboxLiveEndpointPair.__IXboxLiveEndpointPairStatics.FindEndpointPairBySocketAddressBytes(localSocketAddress_length, localSocketAddress, remoteSocketAddress_length, remoteSocketAddress)
    }

    /**
     * Finds an existing **XboxLiveEndpointPair** instance, if one exists, associated with traffic from a first host and port to a second host and port.
     * 
     * Use this method to work backwards from incoming traffic to the **XboxLiveEndpointPair** that's associated with that traffic.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {HostName} localHostName The **HostName** of the local end of the endpoint pair.
     * @param {HSTRING} localPort The port number of the local end of the endpoint pair.
     * @param {HostName} remoteHostName The **HostName** of the remote end of the endpoint pair.
     * @param {HSTRING} remotePort The port number of the remote end of the endpoint pair.
     * @returns {XboxLiveEndpointPair} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.findendpointpairbyhostnamesandports
     */
    static FindEndpointPairByHostNamesAndPorts(localHostName, localPort, remoteHostName, remotePort) {
        if (!XboxLiveEndpointPair.HasProp("__IXboxLiveEndpointPairStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveEndpointPair")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveEndpointPairStatics.IID)
            XboxLiveEndpointPair.__IXboxLiveEndpointPairStatics := IXboxLiveEndpointPairStatics(factoryPtr)
        }

        return XboxLiveEndpointPair.__IXboxLiveEndpointPairStatics.FindEndpointPairByHostNamesAndPorts(localHostName, localPort, remoteHostName, remotePort)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value representing the state of this **XboxLiveEndpointPair**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The state of an **XboxLiveEndpointPair** can change at any time. You should not cache this value, unless you also use the **StateChanged** event to update that cached state when it changes.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the **XboxLiveEndpointPairTemplate** used to instantiate this endpoint pair.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.template
     * @type {XboxLiveEndpointPairTemplate} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * Gets the **XboxLiveDeviceAddress** for the remote endpoint.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * There's no **XboxLiveEndpointPair** method for retrieving the local **XboxLiveDeviceAddress**. Use the **XboxLiveDeviceAddress.GetLocal** static method to get the local **XboxLiveDeviceAddress**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.remotedeviceaddress
     * @type {XboxLiveDeviceAddress} 
     */
    RemoteDeviceAddress {
        get => this.get_RemoteDeviceAddress()
    }

    /**
     * Gets a **HostName** for the remote endpoint.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.remotehostname
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
    }

    /**
     * Gets the port for the remote endpoint.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * This value will be zero if the **XboxLiveEndpointPairTemplate** allowed dynamically-assigned port numbers. In that case, your app will have to determine the remote port number through other means.
     * 
     * The remote port number returned by this property is valid only on the calling device. To retrieve the remote network identity for use by other peers, use the corresponding **XboxLiveDeviceAddress** object, and send a snapshot of that object to the other peers.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.remoteport
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

    /**
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.localhostname
     * @type {HostName} 
     */
    LocalHostName {
        get => this.get_LocalHostName()
    }

    /**
     * Gets the port for the local endpoint.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * This value will be zero if the **XboxLiveEndpointPairTemplate** allowed dynamically-assigned port numbers. In that case, your app will have to determine the remote port number through external means. 
     * 
     * The local port number returned by this property is valid only on the calling device. To retrieve the local network identity for use by remote peers, use the corresponding **XboxLiveDeviceAddress** object, and send a snapshot of that object to the remote peer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.localport
     * @type {HSTRING} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

    /**
     * Event raised when the state of the **XboxLiveEndpointPair** changes.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @type {TypedEventHandler<XboxLiveEndpointPair, XboxLiveEndpointPairStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{51037260-4609-58c1-adb3-0618b89b9975}"),
                    XboxLiveEndpointPair,
                    XboxLiveEndpointPairStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<XboxLiveEndpointPair, XboxLiveEndpointPairStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.remove_StateChanged(token)
    }

    /**
     * Begins gracefully terminating the **XboxLiveEndpointPair** security relationship between the two endpoints. A best-effort attempt to notify the remote device is performed, though there's no guarantee that this notification will be received if the remote device is no longer available or reachable. The remote device might instead time out the **XboxLiveEndpointPair**. The action will complete successfully regardless of the remote device or the prior status of the **XboxLiveEndpointPair**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.DeleteAsync()
    }

    /**
     * Gets the remote endpoint's socket address information, as an array of Byte. This method fills the specified byte buffer with the **SOCKADDR_STORAGE** address of the remote device for use in subsequent Winsock operations leveraging the Xbox Live Multiplayer Networking API.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The port number value will be zero if the **XboxLiveEndpointPairTemplate** allowed dynamically-assigned port numbers. In that case, your app will have to determine the remote port number through external means. 
     * 
     * The peer address returned by this property is valid only on the calling device. To retrieve a network identity that can be shared with other peers, use the corresponding **XboxLiveDeviceAddress** object, and send a snapshot of that object to peers.
     * @param {Pointer<Integer>} socketAddress_length 
     * @param {Pointer<Pointer<Integer>>} socketAddress The remote socket address, as an array of Byte.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.getremotesocketaddressbytes
     */
    GetRemoteSocketAddressBytes(socketAddress_length, socketAddress) {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.GetRemoteSocketAddressBytes(socketAddress_length, socketAddress)
    }

    /**
     * Gets the local endpoint's socket address information as an array of Byte. This method fills the specified byte buffer with the **SOCKADDR_STORAGE** address of the local device for use in subsequent Winsock operations leveraging the Xbox Live Multiplayer Networking API.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The port number value is zero if the **XboxLiveEndpointPairTemplate** allowed dynamically-assigned port numbers. In that case, your app must determine the local port number through other means.
     * 
     * The local address returned by this method is valid only on the calling device; to retrieve the local network identity for use by remote peers, create an **XboxLiveDeviceAddress** object for the local device, and send the remote peer a snapshot of that object.
     * @param {Pointer<Integer>} socketAddress_length 
     * @param {Pointer<Pointer<Integer>>} socketAddress The local socket address, as an array of Byte.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpair.getlocalsocketaddressbytes
     */
    GetLocalSocketAddressBytes(socketAddress_length, socketAddress) {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.GetLocalSocketAddressBytes(socketAddress_length, socketAddress)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_State()
    }

    /**
     * 
     * @returns {XboxLiveEndpointPairTemplate} 
     */
    get_Template() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_Template()
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_RemoteDeviceAddress() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_RemoteDeviceAddress()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_RemoteHostName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_RemotePort()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalHostName() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_LocalHostName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPort() {
        if (!this.HasProp("__IXboxLiveEndpointPair")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPair.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPair := IXboxLiveEndpointPair(outPtr)
        }

        return this.__IXboxLiveEndpointPair.get_LocalPort()
    }

;@endregion Instance Methods
}
