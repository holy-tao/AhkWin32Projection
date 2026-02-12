#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectService.ahk
#Include .\IWiFiDirectServiceStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiDirectService.ahk
#Include .\WiFiDirectServiceSessionDeferredEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Wi-Fi Direct service. This class is used by code on a device that seeks to use a Wi-Fi Direct Service, to establish a Wi-Fi Direct Service session with the service provider.
 * @remarks
 * This is one of several classes that support connecting two devices with a preference for which device should be the Group Owner. See the [Windows.Devices.WiFiDirect.Service](windows_devices_wifidirect_services.md) topic for a discussion of device pairing and how it can cause the Group Owner preference to be ignored (and how to fix that.)
 * 
 * Your code does not instantiate this class directly. Instead, your code follows this process to get an instance of this class and use it to establish a Wi-Fi Direct Service session.
 * 
 * 
 * 1. Use one of the [GetSelector](wifidirectservice_getselector_1490626236.md) methods to get a query string for a particular service
 * 1. Create a [DeviceWatcher](../windows.devices.enumeration/devicewatcher.md) that watches for Advertisers that match the query string. When an Advertiser is found, decide whether to use that Advertiser, either programmatically or by asking the user to indicate a choice.
 * 1. Once your Seeker has identified the desired service advertiser, call the static [FromIdAsync](wifidirectservice_fromidasync_1322863552.md) method with the Device ID of the chosen advertiser device. FromIdAsync retrieves an instance of WiFiDirectService for the requested service on the requested device.
 * 1. Proceed to establish a session by calling [WiFiDirectService.ConnectAsync](/uwp/api/windows.devices.wifidirect.services.wifidirectservice.connectasync).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectService.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an Advanced Query Syntax (AQS) string to be used to find Wi-Fi Direct Service advertisers for a particular service, where a given byte sequence appears in the advertiser's service information blob.
     * @remarks
     * Your code uses AQS strings with the search and enumeration methods in the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) namespace.
     * @param {HSTRING} serviceName The service name to be found.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.getselector
     */
    static GetSelector(serviceName) {
        if (!WiFiDirectService.HasProp("__IWiFiDirectServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.Services.WiFiDirectService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectServiceStatics.IID)
            WiFiDirectService.__IWiFiDirectServiceStatics := IWiFiDirectServiceStatics(factoryPtr)
        }

        return WiFiDirectService.__IWiFiDirectServiceStatics.GetSelector(serviceName)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string to be used to find Wi-Fi Direct Service advertisers for a particular service.
     * @remarks
     * Your code uses AQS strings with the search and enumeration methods in the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) namespace.
     * @param {HSTRING} serviceName The service name to be found.
     * @param {IBuffer} serviceInfoFilter 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.getselector
     */
    static GetSelectorWithFilter(serviceName, serviceInfoFilter) {
        if (!WiFiDirectService.HasProp("__IWiFiDirectServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.Services.WiFiDirectService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectServiceStatics.IID)
            WiFiDirectService.__IWiFiDirectServiceStatics := IWiFiDirectServiceStatics(factoryPtr)
        }

        return WiFiDirectService.__IWiFiDirectServiceStatics.GetSelectorWithFilter(serviceName, serviceInfoFilter)
    }

    /**
     * Static method that retrieves a WiFiDirectService instance for a Wi-Fi Direct Service offered by the device with a given device ID.
     * @remarks
     * Your code retrieves Device IDs for service advertisers by using the search and enumeration methods in the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) namespace.
     * @param {HSTRING} deviceId Device ID of the device that advertises the desired Wi-Fi Direct Service.
     * @returns {IAsyncOperation<WiFiDirectService>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!WiFiDirectService.HasProp("__IWiFiDirectServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.Services.WiFiDirectService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectServiceStatics.IID)
            WiFiDirectService.__IWiFiDirectServiceStatics := IWiFiDirectServiceStatics(factoryPtr)
        }

        return WiFiDirectService.__IWiFiDirectServiceStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the service information blob from this service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.remoteserviceinfo
     * @type {IBuffer} 
     */
    RemoteServiceInfo {
        get => this.get_RemoteServiceInfo()
    }

    /**
     * Gets a list of supported configuration methods, ordered by preference. Your code uses [IVector](../windows.foundation.collections/ivector_1.md) operations to modify the contents of the list.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.supportedconfigurationmethods
     * @type {IVectorView<Integer>} 
     */
    SupportedConfigurationMethods {
        get => this.get_SupportedConfigurationMethods()
    }

    /**
     * Gets or sets a value specifying whether the service instance should choose Wi-Fi Direct Point to Point (P2P) Group Owner (GO) mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.prefergroupownermode
     * @type {Boolean} 
     */
    PreferGroupOwnerMode {
        get => this.get_PreferGroupOwnerMode()
        set => this.put_PreferGroupOwnerMode(value)
    }

    /**
     * Gets or sets app-specific session information passed to the server when initiating a session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.sessioninfo
     * @type {IBuffer} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
        set => this.put_SessionInfo(value)
    }

    /**
     * Error information about the latest attempt to connect to the service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.serviceerror
     * @type {Integer} 
     */
    ServiceError {
        get => this.get_ServiceError()
    }

    /**
     * Event raised when a session request has been deferred. Note that this does not mean that the request has failed or been denied. It is a notification that the server is performing a long operation, such as waiting for a user to enter a PIN. The seeker that receives this message should begin a 120-second wait before it times out the session request, to give the server time to complete its operation. The event arguments include a buffer supplied by the server in the deferral notification with additional information.
     * @type {TypedEventHandler<WiFiDirectService, WiFiDirectServiceSessionDeferredEventArgs>}
    */
    OnSessionDeferred {
        get {
            if(!this.HasProp("__OnSessionDeferred")){
                this.__OnSessionDeferred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fc3dfc2c-9cfa-5822-ba3f-ff3afb65777e}"),
                    WiFiDirectService,
                    WiFiDirectServiceSessionDeferredEventArgs
                )
                this.__OnSessionDeferredToken := this.add_SessionDeferred(this.__OnSessionDeferred.iface)
            }
            return this.__OnSessionDeferred
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSessionDeferredToken")) {
            this.remove_SessionDeferred(this.__OnSessionDeferredToken)
            this.__OnSessionDeferred.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_RemoteServiceInfo() {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.get_RemoteServiceInfo()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedConfigurationMethods() {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.get_SupportedConfigurationMethods()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreferGroupOwnerMode() {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.get_PreferGroupOwnerMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreferGroupOwnerMode(value) {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.put_PreferGroupOwnerMode(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionInfo() {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.get_SessionInfo()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_SessionInfo(value) {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.put_SessionInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceError() {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.get_ServiceError()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectService, WiFiDirectServiceSessionDeferredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionDeferred(handler) {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.add_SessionDeferred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionDeferred(token) {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.remove_SessionDeferred(token)
    }

    /**
     * Asynchronously retrieves Wi-Fi Direct Service session provisioning information.
     * @param {Integer} selectedConfigurationMethod The preferred method of configuring the session.
     * @returns {IAsyncOperation<WiFiDirectServiceProvisioningInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.getprovisioninginfoasync
     */
    GetProvisioningInfoAsync(selectedConfigurationMethod) {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.GetProvisioningInfoAsync(selectedConfigurationMethod)
    }

    /**
     * Initiates the establishment of a service session with the Wi-Fi Direct Service represented by this instance, using a PIN to configure the session.
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.connectasync
     */
    ConnectAsync() {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.ConnectAsync()
    }

    /**
     * Initiates the establishment of a service session with the Wi-Fi Direct Service represented by this instance.
     * @param {HSTRING} pin 
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservice.connectasync
     */
    ConnectAsyncWithPin(pin) {
        if (!this.HasProp("__IWiFiDirectService")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectService := IWiFiDirectService(outPtr)
        }

        return this.__IWiFiDirectService.ConnectAsyncWithPin(pin)
    }

;@endregion Instance Methods
}
