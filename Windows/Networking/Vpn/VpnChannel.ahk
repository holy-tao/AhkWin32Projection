#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnChannel.ahk
#Include .\IVpnChannel2.ahk
#Include .\IVpnChannel4.ahk
#Include .\IVpnChannel5.ahk
#Include .\IVpnChannel6.ahk
#Include .\IVpnChannelStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\VpnChannel.ahk
#Include .\VpnChannelActivityEventArgs.ahk
#Include .\VpnChannelActivityStateChangedArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods to create and destroy a VPN channel, and methods to perform buffer management. A VPN channel is the object in the system that links the network traffic data flow between the VPN plug-in's VPN server socket and the client machine network stack.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnChannel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnChannel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnChannel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Processes any pending VpnChannel events.
     * @param {IInspectable} thirdPartyPlugIn The plug-in to be processed.
     * @param {IInspectable} event The event object that was passed to the app from a background task **Run** method parameter. App code calling ProcessEventAsync treats this object as an opaque blob it is passing from the background task to the event processing code. (In the event processing code, the object will be understood and parsed appropriately.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.processeventasync
     */
    static ProcessEventAsync(thirdPartyPlugIn, event) {
        if (!VpnChannel.HasProp("__IVpnChannelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnChannelStatics.IID)
            VpnChannel.__IVpnChannelStatics := IVpnChannelStatics(factoryPtr)
        }

        return VpnChannel.__IVpnChannelStatics.ProcessEventAsync(thirdPartyPlugIn, event)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique instance ID of a VPN channel. This can be used to simplify demuxing operations between two VPN connection instances.
     * @remarks
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets a **VpnChannelConfiguration** object corresponding to the configuration of the [VpnChannel](vpnchannel.md) and which dictates how to establish the communication with the VPN server.
     * @remarks
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.configuration
     * @type {VpnChannelConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets or sets a context object that VPN plug-ins can use to associate their internal state with a [VpnChannel](vpnchannel.md) object for later use while the session is in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.plugincontext
     * @type {IInspectable} 
     */
    PlugInContext {
        get => this.get_PlugInContext()
        set => this.put_PlugInContext(value)
    }

    /**
     * Gets the statement of health of the client machine.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.systemhealth
     * @type {VpnSystemHealth} 
     */
    SystemHealth {
        get => this.get_SystemHealth()
    }

    /**
     * Gets the transport context object in use, for example the name of a host or server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.currentrequesttransportcontext
     * @type {IInspectable} 
     */
    CurrentRequestTransportContext {
        get => this.get_CurrentRequestTransportContext()
    }

    /**
     * Not supported.
     * @type {TypedEventHandler<VpnChannel, VpnChannelActivityEventArgs>}
    */
    OnActivityChange {
        get {
            if(!this.HasProp("__OnActivityChange")){
                this.__OnActivityChange := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{39907949-a8cc-5ce5-9e0a-06e3b2d31570}"),
                    VpnChannel,
                    VpnChannelActivityEventArgs
                )
                this.__OnActivityChangeToken := this.add_ActivityChange(this.__OnActivityChange.iface)
            }
            return this.__OnActivityChange
        }
    }

    /**
     * Event raised when the channel's activity state has changed. Used by VPN plug-ins to determine whether the channel is active with traffic or idle.
     * @type {TypedEventHandler<VpnChannel, VpnChannelActivityStateChangedArgs>}
    */
    OnActivityStateChange {
        get {
            if(!this.HasProp("__OnActivityStateChange")){
                this.__OnActivityStateChange := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2cfcf1ba-bffc-5746-b868-2e45a46d2958}"),
                    VpnChannel,
                    VpnChannelActivityStateChangedArgs
                )
                this.__OnActivityStateChangeToken := this.add_ActivityStateChange(this.__OnActivityStateChange.iface)
            }
            return this.__OnActivityStateChange
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnActivityChangeToken")) {
            this.remove_ActivityChange(this.__OnActivityChangeToken)
            this.__OnActivityChange.iface.Dispose()
        }

        if(this.HasProp("__OnActivityStateChangeToken")) {
            this.remove_ActivityStateChange(this.__OnActivityStateChangeToken)
            this.__OnActivityStateChange.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Prepares and marks the transport for use by the VPN framework as a transport link communicating the VPN plug-in to the VPN server. This call must be performed before any other operations related to the VPN framework APIs.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error hresult value describing the specific failure. If the plug-in is not connected, the error will be **E_ACCESSDENIED**.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. The call will fail if the VPN framework does not support the specified type of transport implemented by the *outerTunnelTransport* object. The socket must have not been connected at the time of this call, otherwise the call will fail with an invalid parameter error.
     * 
     * From this method, a plugin may choose between the following combinations of sockets: 
     * + One TCP socket ([StreamSocket](../windows.networking.sockets/streamsocket.md)),
     * + One UDP socket ([DatagramSocket](../windows.networking.sockets/datagramsocket.md)),
     * + Two TCP sockets, or
     * + Two sockets, one TCP and one UDP.
     * @param {IInspectable} mainOuterTunnelTransport An **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket) or a [Windows.Networking.DatagramSocket](../windows.networking.sockets/datagramsocket.md). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data. The socket must be unconnected at the point of the call.
     * @param {IInspectable} optionalOuterTunnelTransport An optional **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket) or a [Windows.Networking.DatagramSocket](../windows.networking.sockets/datagramsocket.md). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.associatetransport
     */
    AssociateTransport(mainOuterTunnelTransport, optionalOuterTunnelTransport) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.AssociateTransport(mainOuterTunnelTransport, optionalOuterTunnelTransport)
    }

    /**
     * Creates the VPN channel to be used by the VPN plug-in. It also creates an L3 network interface for applications in the client machine to be able to see the corporate network.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error hresult value describing the specific failure. If the plug-in is not connected, the error will be **E_ACCESSDENIED**.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * 
     * On success the ownership of *outertTunnelTransport* is transferred by the VPN framework. Calling this method multiple times with the same parameters will have no effect. Calling this method multiple times with variations in parameter values will make sure the channel is updated with the latest values without any disruptions to other properties.
     * 
     * There can only be one VPN channel per process and hence a VPN plug-in can only have one VPN channel assigned to it. The *mtuSize* must always be smaller than the *maxFrameSize.*
     * @param {IVectorView<HostName>} assignedClientIPv4list A pointer to an IVectorView&lt; Windows.Networking.HostName *&gt; vector specifying the IPv4 address assigned by the VPN server to the VPN client. The address should be set on the VPN L3 interface. If **null**, DHCPv4 is used.
     * @param {IVectorView<HostName>} assignedClientIPv6list A pointer to a [Windows.Networking.HostName](../windows.networking/hostname.md) structure specifying the IPv6 address assigned by the VPN server to the VPN client, and which should be set on the VPN L3 interface. If **null**, DHCPv6 or RD is used.
     * @param {VpnInterfaceId} vpnInterfaceId_ A pointer to a VpnInterfaceId.
     * @param {VpnRouteAssignment} routeScope A pointer to Windows.Networking.VpnRouteAssignment class that represents the routes which should be associated / not associated with the VPN interface
     * @param {VpnNamespaceAssignment} namespaceScope A pointer to Windows.Networking.DomainNameAssignment class that represents the list of name prefixes that are associated to the VPN channel, including its DNS and proxy servers.
     * @param {Integer} mtuSize A UINT16 value specifying the MTU size of the VPN L3 network interface. This is also the size of the IVpnPacketBuffers in the Receive pool. This value should be configured to be at most 1400.
     * @param {Integer} maxFrameSize A UINT16 value specifying the max size of the frame defined by the VPN protocol encapsulation without counting the *outerTunnelTransport*. This is also the size of the **IVpnPacketBuffers** in the Send pool. This value should be configured as mtuSize + [size of encapsulation headers], and should be <=1500. If it would be greater than 1500 either mtuSize or encapsulation header size should be reduced as the platform limits the framesize to 1500.
     * @param {Boolean} optimizeForLowCostNetwork A **Boolean** specifying whether the VPN framework should monitor and use low cost networks as they are available. If **TRUE** the VPN framework will invoke the connect() callback to the VPN plug-in to reconnect it whenever the old network was costed and a new low cost network becomes available.
     * @param {IInspectable} mainOuterTunnelTransport An *IInspectable* object for socket transport. This object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). This socket controls the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data.
     * @param {IInspectable} optionalOuterTunnelTransport An optional *IInspectable* object for socket transport. This object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). This socket controls the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.start
     */
    Start(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, routeScope, namespaceScope, mtuSize, maxFrameSize, optimizeForLowCostNetwork, mainOuterTunnelTransport, optionalOuterTunnelTransport) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.Start(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, routeScope, namespaceScope, mtuSize, maxFrameSize, optimizeForLowCostNetwork, mainOuterTunnelTransport, optionalOuterTunnelTransport)
    }

    /**
     * Destroys a previously established VPN channel object. Disassociates and closes the *outerTunnelTransport* connection to the VPN server.
     * @remarks
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.stop
     */
    Stop() {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.Stop()
    }

    /**
     * Request the VPN platform to collect credentials from the user. The plug-in can specify the type and form of credentials to collect. The result is an object containing the main credentials depending on the type and the secondary credentials for change and expiration cases.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error HRESULT value describing the specific failure. If the plug-in is not connected, the error is **E_ACCESSDENIED**. If there is no more memory available, the error is **E_OUTOFMEMORY**.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile.
     * @param {Integer} credType An enum value indicating type of credential to collect.
     * @param {Boolean} isRetry If the request is a retry from as previous failed attempt, it is TRUE; otherwise, it is FALSE.
     * @param {Boolean} isSingleSignOnCredential If the credential should be used by all applications operating over the VPN tunnel and authenticating to resources on the VPN, it is TRUE; otherwise, it is FALSE. This provides a single sign on experience over the VPN.
     * @param {Certificate} certificate_ The certificate that can be optionally passed to indicate the platform its intention of use and obtain consent and unlock its protection.
     * @returns {VpnPickedCredential} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestcredentials
     */
    RequestCredentials(credType, isRetry, isSingleSignOnCredential, certificate_) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.RequestCredentials(credType, isRetry, isSingleSignOnCredential, certificate_)
    }

    /**
     * Requests an **IVpnPacketBuffer** from the specified pool. There is one **IVpnPacketBuffer** pool for the send path and another **IVpnPacketBuffer** pool for the receive path.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error hresult value describing the specific failure. If the plug-in is not connected, the error will be **E_ACCESSDENIED**.If there is no more memory available the method will return **E_OUTOFMEMORY**.
     * 
     * Any **IVpnPacketBuffer** object requested by the plugin must eventually be returned to the VPN platform (i.e. via [IVpnPlugIn.Encapsulate](ivpnplugin_encapsulate_494498240.md) or [IVpnPlugin.Decapsulate](ivpnplugin_decapsulate_1667754039.md)). Otherwise the plugin may be unable to request new buffers until the outstanding buffers have been returned.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @param {Integer} type An enum value indicating which buffer pool to pick a buffer from. If the buffer requested for the packet to be sent to the VPN server, pick the Send enum type. If the buffer requested is for a received L3 decapsulated packet ready to be injected into the client network stack, pick the Receive enum type.
     * @param {Pointer<VpnPacketBuffer>} vpnPacketBuffer_ An **IVpnPacketBuffer** object returned from the specified buffer pool.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestvpnpacketbuffer
     */
    RequestVpnPacketBuffer(type, vpnPacketBuffer_) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.RequestVpnPacketBuffer(type, vpnPacketBuffer_)
    }

    /**
     * Writes a diagnostic message to the system log.
     * @remarks
     * The messages logged with LogDiagnosticMessage can be viewed using Event Viewer, under Application and Services Logs\Microsoft\Windows\Vpn Plugin Platform.
     * @param {HSTRING} message The text of the diagnostic message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.logdiagnosticmessage
     */
    LogDiagnosticMessage(message) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.LogDiagnosticMessage(message)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.get_Id()
    }

    /**
     * 
     * @returns {VpnChannelConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.get_Configuration()
    }

    /**
     * 
     * @param {TypedEventHandler<VpnChannel, VpnChannelActivityEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActivityChange(handler) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.add_ActivityChange(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActivityChange(token) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.remove_ActivityChange(token)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_PlugInContext(value) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.put_PlugInContext(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_PlugInContext() {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.get_PlugInContext()
    }

    /**
     * 
     * @returns {VpnSystemHealth} 
     */
    get_SystemHealth() {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.get_SystemHealth()
    }

    /**
     * Not supported.
     * @param {IVectorView<IVpnCustomPrompt>} customPrompt Not used.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestcustomprompt
     */
    RequestCustomPrompt(customPrompt) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.RequestCustomPrompt(customPrompt)
    }

    /**
     * Not supported.
     * @param {HSTRING} message The text of the error message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.seterrormessage
     */
    SetErrorMessage(message) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.SetErrorMessage(message)
    }

    /**
     * Not supported.
     * @param {IInspectable} tunnelTransport An optional **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). This socket controls the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data.
     * @param {Boolean} useTls12 If Transport Security Layer 1.2 should be used, it is TRUE; otherwise, it is FALSE.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.setallowedssltlsversions
     */
    SetAllowedSslTlsVersions(tunnelTransport, useTls12) {
        if (!this.HasProp("__IVpnChannel")) {
            if ((queryResult := this.QueryInterface(IVpnChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel := IVpnChannel(outPtr)
        }

        return this.__IVpnChannel.SetAllowedSslTlsVersions(tunnelTransport, useTls12)
    }

    /**
     * Creates the VPN channel to be used by the VPN plug-in. It also creates an L3 network interface for applications in the client machine to be able to see the corporate network.
     * @param {IVectorView<HostName>} assignedClientIPv4list A pointer to a **Windows.Networking.HostName** structure specifying the IPv4 address assigned by the VPN server to the VPN client. The address should be set on the VPN L3 interface. If null, DHCPv4 is used.
     * @param {IVectorView<HostName>} assignedClientIPv6list A pointer to a **Windows.Networking.HostName** structure specifying the IPv6 address assigned by the VPN server to the VPN client, and which should be set on the VPN L3 interface. If null, DHCPv6 or RD is used.
     * @param {VpnInterfaceId} vpnInterfaceId_ A pointer to a **VpnInterfaceId** object.
     * @param {VpnRouteAssignment} assignedRoutes A pointer to a **Windows.Networking.VpnRouteAssignment ** class that represents the routes which should be associated / not associated with the VPN interface.
     * @param {VpnDomainNameAssignment} assignedDomainName A pointer to a **Windows.Networking.DomainNameAssignment** class that represents the list of name prefixes that are associated to the VPN channel, including its DNS and proxy servers.
     * @param {Integer} mtuSize A UINT16 value specifying the MTU size of the VPN L3 network interface. This is also the size of the **IVpnPacketBuffers** in the Receive pool. This value should be configured to be at most 1400.
     * @param {Integer} maxFrameSize A UINT16 value specifying the max size of the frame defined by the VPN protocol encapsulation without counting the outerTunnelTransport. This is also the size of the **IVpnPacketBuffers** in the Send pool. This value should be configured as mtuSize + [size of encapsulation headers], and should be <=1500. If it would be greater than 1500 either mtuSize or encapsulation header size should be reduced as the platform limits the framesize to 1500.
     * @param {Boolean} Reserved Reserved
     * @param {IInspectable} mainOuterTunnelTransport An **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). This socket object controls the connection to the VPN server, and is used to send encapsulated IP packets and to receive encapsulated data. The socket must be unconnected at the time of the call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.startwithmaintransport
     */
    StartWithMainTransport(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, assignedRoutes, assignedDomainName, mtuSize, maxFrameSize, Reserved, mainOuterTunnelTransport) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.StartWithMainTransport(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, assignedRoutes, assignedDomainName, mtuSize, maxFrameSize, Reserved, mainOuterTunnelTransport)
    }

    /**
     * Creates the VPN channel to be used by the VPN plug-in. It also creates an L3 network interface for applications in the client machine to be able to see the corporate network.
     * @param {IVectorView<HostName>} assignedClientIPv4list A pointer to a**Windows.Networking.HostName** structure specifying the IPv4 address assigned by the VPN server to the VPN client. The address should be set on the VPN L3 interface. If null, DHCPv4 is used.
     * @param {IVectorView<HostName>} assignedClientIPv6list A pointer to a **Windows.Networking.HostName** structure specifying the IPv6 address assigned by the VPN server to the VPN client, and which should be set on the VPN L3 interface. If null, DHCPv6 or RD is used.
     * @param {VpnInterfaceId} vpnInterfaceId_ A pointer to a **VpnInterfaceId** object.
     * @param {VpnRouteAssignment} assignedRoutes A pointer to a **Windows.Networking.VpnRouteAssignment** class that represents the routes which should be associated / not associated with the VPN interface.
     * @param {VpnDomainNameAssignment} assignedDomainName A pointer to a **Windows.Networking.DomainNameAssignment** class that represents the list of name prefixes that are associated to the VPN channel, including its DNS and proxy servers.
     * @param {Integer} mtuSize A UINT16 value specifying the MTU size of the VPN L3 network interface. This is also the size of the **IVpnPacketBuffers** in the Receive pool. This value should be configured to be at most 1400.
     * @param {Integer} maxFrameSize A UINT16 value specifying the max size of the frame defined by the VPN protocol encapsulation without counting the outerTunnelTransport. This is also the size of the **IVpnPacketBuffers** in the Send pool. This value should be configured as mtuSize + [size of encapsulation headers], and should be <=1500. If it would be greater than 1500 either mtuSize or encapsulation header size should be reduced as the platform limits the framesize to 1500.
     * @param {Boolean} Reserved Reserved.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.startexistingtransports
     */
    StartExistingTransports(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, assignedRoutes, assignedDomainName, mtuSize, maxFrameSize, Reserved) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.StartExistingTransports(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, assignedRoutes, assignedDomainName, mtuSize, maxFrameSize, Reserved)
    }

    /**
     * 
     * @param {TypedEventHandler<VpnChannel, VpnChannelActivityStateChangedArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActivityStateChange(handler) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.add_ActivityStateChange(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActivityStateChange(token) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.remove_ActivityStateChange(token)
    }

    /**
     * Retrieves a [VpnPacketBuffer](vpnpacketbuffer.md) object from the send packet buffer pool to use in encapsulation and transmission of a data packet from the client network stack to the VPN server.
     * @remarks
     * Any **IVpnPacketBuffer** object requested by the plugin must eventually be returned to the VPN platform (i.e. via [IVpnPlugIn.Encapsulate](ivpnplugin_encapsulate_494498240.md) or [IVpnPlugin.Decapsulate](ivpnplugin_decapsulate_1667754039.md)). Otherwise the plugin may be unable to request new buffers until the outstanding buffers have been returned.
     * @returns {VpnPacketBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.getvpnsendpacketbuffer
     */
    GetVpnSendPacketBuffer() {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.GetVpnSendPacketBuffer()
    }

    /**
     * Requests a [VpnPacketBuffer](vpnpacketbuffer.md) object from the receive packet buffer pool to be used in the decapsulation or injection of a received packet from the VPN server into the local network stack
     * @remarks
     * Any **IVpnPacketBuffer** object requested by the plugin must eventually be returned to the VPN platform (i.e. via [IVpnPlugIn.Encapsulate](ivpnplugin_encapsulate_494498240.md) or [IVpnPlugin.Decapsulate](ivpnplugin_decapsulate_1667754039.md)). Otherwise the plugin may be unable to request new buffers until the outstanding buffers have been returned.
     * @returns {VpnPacketBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.getvpnreceivepacketbuffer
     */
    GetVpnReceivePacketBuffer() {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.GetVpnReceivePacketBuffer()
    }

    /**
     * Requests information from the user by presenting a prompt. Allows the use of prompt elements that can be mixed to construct a full prompt to the user. Input provided by the user is returned to the caller in the objects specified.
     * @param {IVectorView<IVpnCustomPromptElement>} customPromptElement A list custom prompt elements.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestcustompromptasync
     */
    RequestCustomPromptAsync(customPromptElement) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.RequestCustomPromptAsync(customPromptElement)
    }

    /**
     * Requests the VPN platform to collect credentials of a given credential type from the user.
     * @param {Integer} credType An enum value indicating the type of credential to collect.
     * @param {Integer} credOptions 
     * @param {Certificate} certificate_ 
     * @returns {IAsyncOperation<VpnCredential>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestcredentialsasync
     */
    RequestCredentialsWithCertificateAsync(credType, credOptions, certificate_) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.RequestCredentialsWithCertificateAsync(credType, credOptions, certificate_)
    }

    /**
     * VPN platform to collect credentials from the user. If user interaction is required to obtain a credential or consent, the platform provides the necessary user interaction. A VPN plug-in must request credentials before using any type of credential, even if the intent is not to invoke user interaction for it.
     * @param {Integer} credType An enum value indicating the type of credential to collect.
     * @param {Integer} credOptions Specifies the values defining whether a requested credential is a retry case, or should be used for single sign on.
     * 
     * See [VpnChannelRequestCredentialsOptions](vpnchannelrequestcredentialsoptions.md) for possible values.
     * @returns {IAsyncOperation<VpnCredential>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestcredentialsasync
     */
    RequestCredentialsWithOptionsAsync(credType, credOptions) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.RequestCredentialsWithOptionsAsync(credType, credOptions)
    }

    /**
     * Requests the VPN platform to collect credentials from the user. The plug-in can specify the type and form of credentials to collect. The result is an object containing the main credentials depending on the type, and the secondary credentials for change and expiration cases.
     * @param {Integer} credType An enum value indicating the type of credential to collect.
     * @returns {IAsyncOperation<VpnCredential>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.requestcredentialsasync
     */
    RequestCredentialsSimpleAsync(credType) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.RequestCredentialsSimpleAsync(credType)
    }

    /**
     * Allows a VPN plugin to indicate an error message and terminate the connection attempt performed inside the [IVpnPlugin.Connect](ivpnplugin_connect_7754505.md) method. Should not be called on reconnect cases.
     * @param {HSTRING} message The text of the error message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.terminateconnection
     */
    TerminateConnection(message) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.TerminateConnection(message)
    }

    /**
     * Creates the VPN channel to be used by the VPN plug-in. It also creates an L3 network interface for applications in the client machine to be able to see the corporate network. It allows the specification of traffic filters to use in per-app VPN scenarios.
     * @param {IVectorView<HostName>} assignedClientIpv4List A list of **Windows.Networking.HostName** objects specifying the IPv4 address(es) assigned by the VPN server to the VPN client, and which should be set on the VPN L3 interface. If null, DHCPv4 is used.
     * @param {IVectorView<HostName>} assignedClientIpv6List A list of **Windows.Networking.HostName** objects specifying the IPv6 address(es) assigned by the VPN server to the VPN client, and which should be set on the VPN L3 interface. If null, DHCPv6 or RD is used.
     * @param {VpnInterfaceId} vpnInterfaceId_ A **VpnInterfaceId** object.
     * @param {VpnRouteAssignment} assignedRoutes A **Windows.Networking.VpnRouteAssignment** object that represents the routes that should be associated / not associated with the VPN interface.
     * @param {VpnDomainNameAssignment} assignedNamespace A **Windows.Networking.DomainNameAssignment** object that represents the list of name prefixes that are associated with the VPN channel, including its DNS and proxy servers.
     * @param {Integer} mtuSize A UINT16 value specifying the MTU size of the VPN L3 network interface. This is also the size of the **IVpnPacketBuffers** in the Receive pool. This value should be configured to be at most 1400.
     * @param {Integer} maxFrameSize A UINT16 value specifying the max size of the frame defined by the VPN protocol encapsulation without counting the outerTunnelTransport. This is also the size of the **IVpnPacketBuffers** in the Send pool. This value should be configured as mtuSize + [size of encapsulation headers], and should be <=1500. If it would be greater than 1500 either mtuSize or encapsulation header size should be reduced as the platform limits the framesize to 1500.
     * @param {Boolean} reserved Reserved.
     * @param {IInspectable} mainOuterTunnelTransport An **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data. The socket must be unconnected at the point of the call.
     * @param {IInspectable} optionalOuterTunnelTransport An optional **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data.
     * @param {VpnTrafficFilterAssignment} assignedTrafficFilters A **VpnTrafficFilterAssignment** object, which allows the specification of traffic filters to a VPN channel.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.startwithtrafficfilter
     */
    StartWithTrafficFilter(assignedClientIpv4List, assignedClientIpv6List, vpnInterfaceId_, assignedRoutes, assignedNamespace, mtuSize, maxFrameSize, reserved, mainOuterTunnelTransport, optionalOuterTunnelTransport, assignedTrafficFilters) {
        if (!this.HasProp("__IVpnChannel2")) {
            if ((queryResult := this.QueryInterface(IVpnChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel2 := IVpnChannel2(outPtr)
        }

        return this.__IVpnChannel2.StartWithTrafficFilter(assignedClientIpv4List, assignedClientIpv6List, vpnInterfaceId_, assignedRoutes, assignedNamespace, mtuSize, maxFrameSize, reserved, mainOuterTunnelTransport, optionalOuterTunnelTransport, assignedTrafficFilters)
    }

    /**
     * Prepares, marks, and creates the transport for use by the VPN framework as a transport link communicating the VPN plug-in to the VPN server. This call must be performed before any other operations related to the VPN framework APIs.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error hresult value describing the specific failure. If the plug-in is not connected, the error will be **E_ACCESSDENIED**.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. The call will fail if the VPN framework does not support the specified type of transport implemented by the *transport* object. The socket must have not been connected at the time of this call, otherwise the call will fail with an invalid parameter error.
     * @param {IInspectable} transport An **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket) or a [Windows.Networking.DatagramSocket](../windows.networking.sockets/datagramsocket.md). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data. The socket must be unconnected at the point of the call.
     * @param {IInspectable} context_ The transport context object to use, for example the name of a host or server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.addandassociatetransport
     */
    AddAndAssociateTransport(transport, context_) {
        if (!this.HasProp("__IVpnChannel4")) {
            if ((queryResult := this.QueryInterface(IVpnChannel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel4 := IVpnChannel4(outPtr)
        }

        return this.__IVpnChannel4.AddAndAssociateTransport(transport, context_)
    }

    /**
     * Creates the VPN channel for an arbitrary numbers of transports to be used by the VPN plug-in. It also creates an L3 network interface for applications in the client machine to be able to see the corporate network. It allows the specification of traffic filters to use in per-app VPN scenarios.
     * @param {IIterable<HostName>} assignedClientIpv4Addresses A list of **Windows.Networking.HostName** objects specifying the IPv4 address(es) assigned by the VPN server to the VPN client. The address(es) should be set on the VPN L3 interface. If null, DHCPv4 is used.
     * @param {IIterable<HostName>} assignedClientIpv6Addresses A list of **Windows.Networking.HostName** objects specifying the IPv6 address(es) assigned by the VPN server to the VPN client, and which should be set on the VPN L3 interface. If null, DHCPv6 or RD is used.
     * @param {VpnInterfaceId} vpninterfaceId_ A **VpnInterfaceId** object.
     * @param {VpnRouteAssignment} assignedRoutes A **Windows.Networking.VpnRouteAssignment** object that represents the routes that should be associated / not associated with the VPN interface.
     * @param {VpnDomainNameAssignment} assignedNamespace A **Windows.Networking.DomainNameAssignment** object that represents the list of name prefixes that are associated with the VPN channel, including its DNS and proxy servers.
     * @param {Integer} mtuSize A UINT16 value specifying the MTU size of the VPN L3 network interface. This is also the size of the **IVpnPacketBuffers** in the Receive pool. This value should be configured to be at most 1400.
     * @param {Integer} maxFrameSize A UINT16 value specifying the max size of the frame defined by the VPN protocol encapsulation without counting the outerTunnelTransport. This is also the size of the **IVpnPacketBuffers** in the Send pool. This value should be configured as mtuSize + [size of encapsulation headers], and should be <=1500. If it would be greater than 1500 either mtuSize or encapsulation header size should be reduced as the platform limits the framesize to 1500.
     * @param {Boolean} reserved Reserved.
     * @param {IIterable<IInspectable>} transports A list of **IInspectable** objects for socket transport. Each object can be a [Windows.Networking.Sockets.DatagramSocket](/uwp/api/windows.networking.sockets.datagramsocket) or a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket). They will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data. The sockets must be unconnected at the point of the call.
     * @param {VpnTrafficFilterAssignment} assignedTrafficFilters A **VpnTrafficFilterAssignment** object, which allows the specification of traffic filters to a VPN channel.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.startwithtrafficfilter
     */
    StartWithMultipleTransports(assignedClientIpv4Addresses, assignedClientIpv6Addresses, vpninterfaceId_, assignedRoutes, assignedNamespace, mtuSize, maxFrameSize, reserved, transports, assignedTrafficFilters) {
        if (!this.HasProp("__IVpnChannel4")) {
            if ((queryResult := this.QueryInterface(IVpnChannel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel4 := IVpnChannel4(outPtr)
        }

        return this.__IVpnChannel4.StartWithMultipleTransports(assignedClientIpv4Addresses, assignedClientIpv6Addresses, vpninterfaceId_, assignedRoutes, assignedNamespace, mtuSize, maxFrameSize, reserved, transports, assignedTrafficFilters)
    }

    /**
     * Replaces an existing transport with a new one for use by the VPN framework as a transport link communicating the VPN plug-in to the VPN server.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error hresult value describing the specific failure. If the plug-in is not connected, the error will be **E_ACCESSDENIED**.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. The call will fail if the VPN framework does not support the specified type of transport implemented by the *transport* object. The socket must have not been connected at the time of this call, otherwise the call will fail with an invalid parameter error.
     * @param {IInspectable} transport An **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket) or a [Windows.Networking.DatagramSocket](../windows.networking.sockets/datagramsocket.md). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data. The socket must be unconnected at the point of the call.
     * @param {IInspectable} context_ The transport context object to use, for example the name of a host or server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.replaceandassociatetransport
     */
    ReplaceAndAssociateTransport(transport, context_) {
        if (!this.HasProp("__IVpnChannel4")) {
            if ((queryResult := this.QueryInterface(IVpnChannel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel4 := IVpnChannel4(outPtr)
        }

        return this.__IVpnChannel4.ReplaceAndAssociateTransport(transport, context_)
    }

    /**
     * Reconnect the socket transport. Transport and transport context are the only parameters that can be changed on a socket transport reconnection.
     * 
     * > [!IMPORTANT]
     * > This API is not implemented, and we recommend that you do not call it.
     * @remarks
     * If the function succeeds, the return value is **S_OK**, otherwise the function will return an error hresult value describing the specific failure. If the plug-in is not connected, the error will be **E_ACCESSDENIED**.
     * 
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. The call will fail if the VPN framework does not support the specified type of transport implemented by the *transport* object. The socket must have not been connected at the time of this call, otherwise the call will fail with an invalid parameter error.
     * 
     * A plugin may choose between the following combinations of sockets: 
     * + One TCP socket ([StreamSocket](../windows.networking.sockets/streamsocket.md)),
     * + One UDP socket ([DatagramSocket](../windows.networking.sockets/datagramsocket.md)),
     * + Two TCP sockets, or
     * + Two sockets, one TCP and one UDP.
     * @param {IInspectable} transport An **IInspectable** object for socket transport. This object can be a [Windows.Networking.Sockets.StreamSocket](/uwp/api/windows.networking.sockets.streamsocket) or a [Windows.Networking.DatagramSocket](../windows.networking.sockets/datagramsocket.md). This socket will control the connection to the VPN server and will be used to send encapsulated IP packets and receive encapsulated data. The socket must be unconnected at the point of the call.
     * @param {IInspectable} context_ The transport context object to use, for example the name of a host or server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.startreconnectingtransport
     */
    StartReconnectingTransport(transport, context_) {
        if (!this.HasProp("__IVpnChannel4")) {
            if ((queryResult := this.QueryInterface(IVpnChannel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel4 := IVpnChannel4(outPtr)
        }

        return this.__IVpnChannel4.StartReconnectingTransport(transport, context_)
    }

    /**
     * Retrieves the slot type (hardware or software) for the specified transport context object.
     * @param {IInspectable} context_ A transport context object, for example the name of a host or server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.getslottypefortransportcontext
     */
    GetSlotTypeForTransportContext(context_) {
        if (!this.HasProp("__IVpnChannel4")) {
            if ((queryResult := this.QueryInterface(IVpnChannel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel4 := IVpnChannel4(outPtr)
        }

        return this.__IVpnChannel4.GetSlotTypeForTransportContext(context_)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CurrentRequestTransportContext() {
        if (!this.HasProp("__IVpnChannel4")) {
            if ((queryResult := this.QueryInterface(IVpnChannel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel4 := IVpnChannel4(outPtr)
        }

        return this.__IVpnChannel4.get_CurrentRequestTransportContext()
    }

    /**
     * Appends a receive [VpnPacketBuffer](/uwp/api/windows.networking.vpn.vpnpacketbuffer) object to the channel.
     * @param {VpnPacketBuffer} decapsulatedPacketBuffer A [VpnPacketBuffer](/uwp/api/windows.networking.vpn.vpnpacketbuffer) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.appendvpnreceivepacketbuffer
     */
    AppendVpnReceivePacketBuffer(decapsulatedPacketBuffer) {
        if (!this.HasProp("__IVpnChannel5")) {
            if ((queryResult := this.QueryInterface(IVpnChannel5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel5 := IVpnChannel5(outPtr)
        }

        return this.__IVpnChannel5.AppendVpnReceivePacketBuffer(decapsulatedPacketBuffer)
    }

    /**
     * Appends a send [VpnPacketBuffer](/uwp/api/windows.networking.vpn.vpnpacketbuffer) object to the channel.
     * @param {VpnPacketBuffer} encapsulatedPacketBuffer A [VpnPacketBuffer](/uwp/api/windows.networking.vpn.vpnpacketbuffer) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.appendvpnsendpacketbuffer
     */
    AppendVpnSendPacketBuffer(encapsulatedPacketBuffer) {
        if (!this.HasProp("__IVpnChannel5")) {
            if ((queryResult := this.QueryInterface(IVpnChannel5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel5 := IVpnChannel5(outPtr)
        }

        return this.__IVpnChannel5.AppendVpnSendPacketBuffer(encapsulatedPacketBuffer)
    }

    /**
     * Flushes any appended receive packet buffers. See [AppendVpnReceivePacketBuffer](./vpnchannel_appendvpnreceivepacketbuffer_556440284.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.flushvpnreceivepacketbuffers
     */
    FlushVpnReceivePacketBuffers() {
        if (!this.HasProp("__IVpnChannel5")) {
            if ((queryResult := this.QueryInterface(IVpnChannel5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel5 := IVpnChannel5(outPtr)
        }

        return this.__IVpnChannel5.FlushVpnReceivePacketBuffers()
    }

    /**
     * Flushes any appended send packet buffers. See [AppendVpnSendPacketBuffer](./vpnchannel_appendvpnsendpacketbuffer_2101827054.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.flushvpnsendpacketbuffers
     */
    FlushVpnSendPacketBuffers() {
        if (!this.HasProp("__IVpnChannel5")) {
            if ((queryResult := this.QueryInterface(IVpnChannel5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel5 := IVpnChannel5(outPtr)
        }

        return this.__IVpnChannel5.FlushVpnSendPacketBuffers()
    }

    /**
     * Activates the VPN app in the foreground. This is often used to let the user enter credentials. You can call **ActivateForeground** only from your implementation of [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect). While the app is in the foreground, the regular **Connect** timeout is paused.
     * 
     * The **ActivateForeground** call will be cancelled if there's a long pause (about 10 minutes). If unable to launch, then the plugin should ideally support an authentication method that doesn't need user interface (UI).
     * 
     * Intended to support web-based authentication schemes such as Security Assertion Markup Language (SAML) and Azure Active Directory (AAD) authentication.
     * @remarks
     * > [!NOTE]
     * > Calling this API outside of the [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect) method implementation in a VPN plug-in will fail.
     * 
     * Using the foreground activation mechanism requires handling the activation in several places.
     * 
     * In your [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect) method, you'll call **ActivateForeground** with the correct package-relative application identifier (PRAID), and a **ValueSet** that contains all of the values that you want to send to your foreground app.
     * 
     * In the foreground app, you need to catch the activation. The foreground app will be activated with a [Windows.ApplicationModel.ActivationKind](/uwp/api/windows.applicationmodel.activation.activationkind) value of **VpnForeground**. The activation arguments will be of type [Windows.Networking.Vpn.VpnForegroundActivatedEventArgs](vpnforegroundactivatedeventargs.md), and will include three fields.
     * 
     * 1. *[ProfileName](vpnforegroundactivatedeventargs_profilename.md)* (**String**).
     * 2. *[SharedContext](vpnforegroundactivatedeventargs_sharedcontext.md)* ([ValueSet](/uwp/api/windows.foundation.collections.valueset)).
     * 3. *[ActivationOperation](vpnforegroundactivatedeventargs_activationoperation.md)* ([Windows.Networking.Vpn.VpnForegroundActivationOperation](vpnforegroundactivationoperation.md).
     * 
     * The foreground app can then set up your app's user interface (UI) to handle the needed authorization (or whatever data is needed). When done, you must call the [Complete](vpnforegroundactivationoperation_complete_1656373823.md) method of the **ActivationOperation**, passing in a [ValueSet](/uwp/api/windows.foundation.collections.valueset) of values that you want to be returned to the [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect) call.
     * 
     * Back in the [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect) call, use the **ValueSet** returned from **ActivateForeground** to decide whether the authentication was successful, and handle any errors.
     * @param {HSTRING} packageRelativeAppId A string containing the package-relative application identifier (PRAID) of the foreground app to launch.
     * @param {ValueSet} sharedContext A **ValueSet** object used to pass information to the foreground app. The foreground app can access these from the activation event arguments.
     * @returns {ValueSet} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannel.activateforeground
     */
    ActivateForeground(packageRelativeAppId, sharedContext) {
        if (!this.HasProp("__IVpnChannel6")) {
            if ((queryResult := this.QueryInterface(IVpnChannel6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannel6 := IVpnChannel6(outPtr)
        }

        return this.__IVpnChannel6.ActivateForeground(packageRelativeAppId, sharedContext)
    }

;@endregion Instance Methods
}
