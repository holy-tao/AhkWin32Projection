#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceSession.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiDirectServiceSession.ahk
#Include .\WiFiDirectServiceRemotePortAddedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Wi-Fi Direct Services (WFDS) session.
 * @remarks
 * Your code does not instantiate this class directly. An instance is created and passed to your code in event handlers when a new session is created or session state changes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the service name of the advertiser service involved in the session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.servicename
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
    }

    /**
     * Gets the session status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error status of the session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.errorstatus
     * @type {Integer} 
     */
    ErrorStatus {
        get => this.get_ErrorStatus()
    }

    /**
     * Gets the session ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.sessionid
     * @type {Integer} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Gets the advertisement ID for the session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.advertisementid
     * @type {Integer} 
     */
    AdvertisementId {
        get => this.get_AdvertisementId()
    }

    /**
     * Gets the service address for this session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.serviceaddress
     * @type {HSTRING} 
     */
    ServiceAddress {
        get => this.get_ServiceAddress()
    }

    /**
     * Gets the session address for the session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.sessionaddress
     * @type {HSTRING} 
     */
    SessionAddress {
        get => this.get_SessionAddress()
    }

    /**
     * Event raised when the session status changes.
     * @type {TypedEventHandler<WiFiDirectServiceSession, IInspectable>}
    */
    OnSessionStatusChanged {
        get {
            if(!this.HasProp("__OnSessionStatusChanged")){
                this.__OnSessionStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{10c33301-e31c-5cce-b2a0-c1dc2d8d0e13}"),
                    WiFiDirectServiceSession,
                    IInspectable
                )
                this.__OnSessionStatusChangedToken := this.add_SessionStatusChanged(this.__OnSessionStatusChanged.iface)
            }
            return this.__OnSessionStatusChanged
        }
    }

    /**
     * Event raised when a new remote port is added to the session. Your event handler should respond by establishing the appropriate socket connection to the new remote port.
     * @type {TypedEventHandler<WiFiDirectServiceSession, WiFiDirectServiceRemotePortAddedEventArgs>}
    */
    OnRemotePortAdded {
        get {
            if(!this.HasProp("__OnRemotePortAdded")){
                this.__OnRemotePortAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8326a337-3c19-57a7-80ec-cca2ea62ef12}"),
                    WiFiDirectServiceSession,
                    WiFiDirectServiceRemotePortAddedEventArgs
                )
                this.__OnRemotePortAddedToken := this.add_RemotePortAdded(this.__OnRemotePortAdded.iface)
            }
            return this.__OnRemotePortAdded
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSessionStatusChangedToken")) {
            this.remove_SessionStatusChanged(this.__OnSessionStatusChangedToken)
            this.__OnSessionStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnRemotePortAddedToken")) {
            this.remove_RemotePortAdded(this.__OnRemotePortAddedToken)
            this.__OnRemotePortAdded.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_ServiceName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorStatus() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_ErrorStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionId() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_SessionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementId() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_AdvertisementId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceAddress() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_ServiceAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionAddress() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.get_SessionAddress()
    }

    /**
     * Gets a list of connection endpoint pairs for the session. Your code uses [IVectorView](../windows.foundation.collections/ivectorview_1.md) operations to enumerate the endpoint pairs in the list.
     * @returns {IVectorView<EndpointPair>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.getconnectionendpointpairs
     */
    GetConnectionEndpointPairs() {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.GetConnectionEndpointPairs()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionStatusChanged(handler) {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.add_SessionStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionStatusChanged(token) {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.remove_SessionStatusChanged(token)
    }

    /**
     * Adds a [StreamSocketListener](../windows.networking.sockets/streamsocketlistener.md) to the session. Your code creates the StreamSocketListener before calling this method. Associating a socket to the session causes port information to be sent to the remote device(s) in the session. (In terms of this API, a [RemotePortAdded](wifidirectservicesession_remoteportadded.md) event is raised on each remote device in the session, specifying the TCP protocol.) A remote device can use that information to open a socket and connect back to the local machine.
     * @param {StreamSocketListener} value The StreamSocketListener instance to be associated with the session.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.addstreamsocketlistenerasync
     */
    AddStreamSocketListenerAsync(value) {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.AddStreamSocketListenerAsync(value)
    }

    /**
     * Adds a [DatagramSocket](../windows.networking.sockets/datagramsocket.md) to the session. Your code creates the DatagramSocket before calling this method. Associating a socket to the session causes port information to be sent to the remote device(s) in the session. (In terms of this API, a [RemotePortAdded](wifidirectservicesession_remoteportadded.md) event is raised on each remote device in the session, specifying the UDP protocol.) A remote device can use that information to open a socket and connect back to the local machine.
     * @param {DatagramSocket} value The DatagramSocket instance to associate with this session.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.adddatagramsocketasync
     */
    AddDatagramSocketAsync(value) {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.AddDatagramSocketAsync(value)
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceSession, WiFiDirectServiceRemotePortAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemotePortAdded(handler) {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.add_RemotePortAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RemotePortAdded(token) {
        if (!this.HasProp("__IWiFiDirectServiceSession")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSession := IWiFiDirectServiceSession(outPtr)
        }

        return this.__IWiFiDirectServiceSession.remove_RemotePortAdded(token)
    }

    /**
     * Closes the session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesession.close
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
