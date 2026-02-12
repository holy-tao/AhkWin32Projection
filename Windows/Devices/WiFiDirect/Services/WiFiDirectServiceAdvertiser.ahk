#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceAdvertiser.ahk
#Include .\IWiFiDirectServiceAdvertiserFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiDirectServiceAdvertiser.ahk
#Include .\WiFiDirectServiceSessionRequestedEventArgs.ahk
#Include .\WiFiDirectServiceAutoAcceptSessionConnectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Service Advertiser. This class is used by code on a device that advertises Wi-Fi Direct Services, to advertise the service.
 * @remarks
 * This is one of several classes that support connecting two devices with a preference for which device should be the Group Owner. See the [Windows.Devices.WiFiDirect.Service](windows_devices_wifidirect_services.md) topic for a discussion of device pairing and how it can cause the Group Owner preference to be ignored (and how to fix that.)
 * 
 * The service name is set in the [WiFiDirectServiceAdvertiser](wifidirectserviceadvertiser_wifidirectserviceadvertiser_290278668.md) constructor. Service names are UTF-8 strings no more than 255 characters long. It is recommended that names use reverse domain name notation, where the service owner's DNS name (such as "contoso.com") is reversed and used as the beginning of the service name (such as "com.contoso.serviceX"). This convention is intended to make it easy to choose unique service names. Service names that start with "org.wi-fi.wfds" are reserved for use by the Wi-Fi Alliance, and you may not use such names for your service.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceAdvertiser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceAdvertiser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceAdvertiser.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the WiFiDirectServiceAdvertiser class. To start advertising a Wi-Fi Direct Service, create an instance of this class, set its properties appropriately for your service, and then call its [Start](wifidirectserviceadvertiser_start_1587696324.md) method.
     * @param {HSTRING} serviceName The name of the service to be advertised. Service names are UTF-8 strings no more than 255 characters long. It is recommended that names use reverse domain name notation, where the service owner's DNS name (such as "contoso.com") is reversed and used as the beginning of the service name (such as "com.contoso.serviceX"). This convention is intended to make it easy to choose unique service names. Service names that start with "org.wi-fi.wfds" are reserved for use by the Wi-Fi Alliance, and you may not use such names for your service.
     * @returns {WiFiDirectServiceAdvertiser} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.#ctor
     */
    static CreateWiFiDirectServiceAdvertiser(serviceName) {
        if (!WiFiDirectServiceAdvertiser.HasProp("__IWiFiDirectServiceAdvertiserFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAdvertiser")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectServiceAdvertiserFactory.IID)
            WiFiDirectServiceAdvertiser.__IWiFiDirectServiceAdvertiserFactory := IWiFiDirectServiceAdvertiserFactory(factoryPtr)
        }

        return WiFiDirectServiceAdvertiser.__IWiFiDirectServiceAdvertiserFactory.CreateWiFiDirectServiceAdvertiser(serviceName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the service name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.servicename
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
    }

    /**
     * Gets a list of service name prefixes that should match this service when a seeker is using prefix searching. Your code uses [IVector](../windows.foundation.collections/ivector_1.md) methods to add or remove elements from the list.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.servicenameprefixes
     * @type {IVector<HSTRING>} 
     */
    ServiceNamePrefixes {
        get => this.get_ServiceNamePrefixes()
    }

    /**
     * Gets or sets the service information blob. The format and contents of the blob are determined by the individual service, and are intended to be used by Seekers during service discovery.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.serviceinfo
     * @type {IBuffer} 
     */
    ServiceInfo {
        get => this.get_ServiceInfo()
        set => this.put_ServiceInfo(value)
    }

    /**
     * Gets or sets the Auto Accept property for this service advertisement.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.autoacceptsession
     * @type {Boolean} 
     */
    AutoAcceptSession {
        get => this.get_AutoAcceptSession()
        set => this.put_AutoAcceptSession(value)
    }

    /**
     * Gets or sets a value indicating whether the service requires that it be the Wi-Fi Direct Peer to Peer (P2P) Group Owner.
     * 
     * Being the Group Owner enables the service to exercise more control over the P2P connection configuration and the connection process. For details, see the Wi-Fi Direct P2P Technical Specifications, available from the Wi-Fi Alliance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.prefergroupownermode
     * @type {Boolean} 
     */
    PreferGroupOwnerMode {
        get => this.get_PreferGroupOwnerMode()
        set => this.put_PreferGroupOwnerMode(value)
    }

    /**
     * Gets a list (that implements the [IVector](../windows.foundation.collections/ivector_1.md) interface) of preferred session configuration methods. Your code uses IVector operations on the list to add or remove elements from the list.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.preferredconfigurationmethods
     * @type {IVector<Integer>} 
     */
    PreferredConfigurationMethods {
        get => this.get_PreferredConfigurationMethods()
    }

    /**
     * Gets or sets the service status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.servicestatus
     * @type {Integer} 
     */
    ServiceStatus {
        get => this.get_ServiceStatus()
        set => this.put_ServiceStatus(value)
    }

    /**
     * Gets or sets a custom service status code. Only valid if the [ServiceStatus](wifidirectserviceadvertiser_servicestatus.md) property value is **Custom**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.customservicestatuscode
     * @type {Integer} 
     */
    CustomServiceStatusCode {
        get => this.get_CustomServiceStatusCode()
        set => this.put_CustomServiceStatusCode(value)
    }

    /**
     * Gets or sets the service-specific information that is passed to a session requester when establishing a session will not be completed immediately, as when, for example, the service is waiting for user input to complete the request. A requester should implement a 120 second timeout when its request is deferred.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.deferredsessioninfo
     * @type {IBuffer} 
     */
    DeferredSessionInfo {
        get => this.get_DeferredSessionInfo()
        set => this.put_DeferredSessionInfo(value)
    }

    /**
     * Gets a value that describes the current status of the advertisement.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.advertisementstatus
     * @type {Integer} 
     */
    AdvertisementStatus {
        get => this.get_AdvertisementStatus()
    }

    /**
     * Gets a specific error code when [AdvertisementStatus](wifidirectserviceadvertiser_advertisementstatus.md) is **Aborted**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.serviceerror
     * @type {Integer} 
     */
    ServiceError {
        get => this.get_ServiceError()
    }

    /**
     * Event raised when a Seeker has requested that a session be established with the service associated with this WiFiDirectServiceAdvertiser instance. To accept the request, call [WiFiDirectServiceAdvertiser.ConnectAsync](/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.connectasync) in your event handler.
     * @type {TypedEventHandler<WiFiDirectServiceAdvertiser, WiFiDirectServiceSessionRequestedEventArgs>}
    */
    OnSessionRequested {
        get {
            if(!this.HasProp("__OnSessionRequested")){
                this.__OnSessionRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cb98fd74-871d-5730-91fe-81ef947fe78f}"),
                    WiFiDirectServiceAdvertiser,
                    WiFiDirectServiceSessionRequestedEventArgs
                )
                this.__OnSessionRequestedToken := this.add_SessionRequested(this.__OnSessionRequested.iface)
            }
            return this.__OnSessionRequested
        }
    }

    /**
     * Event raised when the service has automatically accepted a session request. Your event handler should establish socket connections for the endpoint pairs listed in the event arguments object.
     * @type {TypedEventHandler<WiFiDirectServiceAdvertiser, WiFiDirectServiceAutoAcceptSessionConnectedEventArgs>}
    */
    OnAutoAcceptSessionConnected {
        get {
            if(!this.HasProp("__OnAutoAcceptSessionConnected")){
                this.__OnAutoAcceptSessionConnected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3be2d508-a856-5c09-9998-522597b44b07}"),
                    WiFiDirectServiceAdvertiser,
                    WiFiDirectServiceAutoAcceptSessionConnectedEventArgs
                )
                this.__OnAutoAcceptSessionConnectedToken := this.add_AutoAcceptSessionConnected(this.__OnAutoAcceptSessionConnected.iface)
            }
            return this.__OnAutoAcceptSessionConnected
        }
    }

    /**
     * Event raised when the [AdvertisementStatus](wifidirectserviceadvertiser_advertisementstatus.md) property value changes.
     * @type {TypedEventHandler<WiFiDirectServiceAdvertiser, IInspectable>}
    */
    OnAdvertisementStatusChanged {
        get {
            if(!this.HasProp("__OnAdvertisementStatusChanged")){
                this.__OnAdvertisementStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67fc3121-c1a0-5c23-af58-ecb7f2a7d773}"),
                    WiFiDirectServiceAdvertiser,
                    IInspectable
                )
                this.__OnAdvertisementStatusChangedToken := this.add_AdvertisementStatusChanged(this.__OnAdvertisementStatusChanged.iface)
            }
            return this.__OnAdvertisementStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSessionRequestedToken")) {
            this.remove_SessionRequested(this.__OnSessionRequestedToken)
            this.__OnSessionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnAutoAcceptSessionConnectedToken")) {
            this.remove_AutoAcceptSessionConnected(this.__OnAutoAcceptSessionConnectedToken)
            this.__OnAutoAcceptSessionConnected.iface.Dispose()
        }

        if(this.HasProp("__OnAdvertisementStatusChangedToken")) {
            this.remove_AdvertisementStatusChanged(this.__OnAdvertisementStatusChangedToken)
            this.__OnAdvertisementStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_ServiceName()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ServiceNamePrefixes() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_ServiceNamePrefixes()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ServiceInfo() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_ServiceInfo()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ServiceInfo(value) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.put_ServiceInfo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoAcceptSession() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_AutoAcceptSession()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoAcceptSession(value) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.put_AutoAcceptSession(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreferGroupOwnerMode() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_PreferGroupOwnerMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreferGroupOwnerMode(value) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.put_PreferGroupOwnerMode(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_PreferredConfigurationMethods() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_PreferredConfigurationMethods()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceStatus() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_ServiceStatus()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServiceStatus(value) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.put_ServiceStatus(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomServiceStatusCode() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_CustomServiceStatusCode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomServiceStatusCode(value) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.put_CustomServiceStatusCode(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeferredSessionInfo() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_DeferredSessionInfo()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_DeferredSessionInfo(value) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.put_DeferredSessionInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementStatus() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_AdvertisementStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceError() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.get_ServiceError()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceAdvertiser, WiFiDirectServiceSessionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionRequested(handler) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.add_SessionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionRequested(token) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.remove_SessionRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceAdvertiser, WiFiDirectServiceAutoAcceptSessionConnectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoAcceptSessionConnected(handler) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.add_AutoAcceptSessionConnected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AutoAcceptSessionConnected(token) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.remove_AutoAcceptSessionConnected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceAdvertiser, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvertisementStatusChanged(handler) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.add_AdvertisementStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AdvertisementStatusChanged(token) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.remove_AdvertisementStatusChanged(token)
    }

    /**
     * Accepts a session request by connecting with the given PIN.
     * @param {DeviceInformation} deviceInfo Describes the device to be connected. Pass in the [WiFiDirectServiceSessionRequestedEventArgs.DeviceInformation](wifidirectservicesessionrequest_deviceinformation.md) property value.
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.connectasync
     */
    ConnectAsync(deviceInfo) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.ConnectAsync(deviceInfo)
    }

    /**
     * Accepts a session request without requiring a PIN.
     * @param {DeviceInformation} deviceInfo Describes the device to be connected. Pass in the [WiFiDirectServiceSessionRequestedEventArgs.DeviceInformation](wifidirectservicesessionrequest_deviceinformation.md) property value.
     * @param {HSTRING} pin 
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.connectasync
     */
    ConnectAsyncWithPin(deviceInfo, pin) {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.ConnectAsyncWithPin(deviceInfo, pin)
    }

    /**
     * Starts advertising the service, using current property values to set the parameters of the advertisement.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.start
     */
    Start() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.Start()
    }

    /**
     * Stops advertising the service. This does not affect existing sessions that are connected to the service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertiser.stop
     */
    Stop() {
        if (!this.HasProp("__IWiFiDirectServiceAdvertiser")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceAdvertiser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceAdvertiser := IWiFiDirectServiceAdvertiser(outPtr)
        }

        return this.__IWiFiDirectServiceAdvertiser.Stop()
    }

;@endregion Instance Methods
}
