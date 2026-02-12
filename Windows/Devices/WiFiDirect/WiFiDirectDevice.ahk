#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectDevice.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IWiFiDirectDeviceStatics.ahk
#Include .\IWiFiDirectDeviceStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiDirectDevice.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Manages connections to associated Wi-Fi Direct devices.
 * @remarks
 * You can use the WiFiDirectDevice class to establish a socket connection with other devices that have a Wi-Fi Direct (WFD) capable device. You can call the [GetDeviceSelector](wifidirectdevice_getdeviceselector_185243134.md) method to get the device identifier for a Wi-Fi Direct device. Once you have a reference to a WiFiDirectDevice on your computer, you can call the [GetConnectionEndpointPairs](wifidirectdevice_getconnectionendpointpairs_1958888015.md) method to get an [EndpointPair](../windows.networking/endpointpair.md) object and establish a socket connection using the [Windows.Networking.Sockets](../windows.networking.sockets/windows_networking_sockets.md) API.
 * 
 * You can add a handler for the [ConnectionStatusChanged](wifidirectdevice_connectionstatuschanged.md) event to be notified when the connection has been established or disconnected.
 * 
 * Only one app can be connected to a Wi-Fi Direct device at a time.
 * 
 * You must enable the **Proximity** capability to communicate with Wi-Fi Direct devices.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the class selection string that you can use to enumerate Wi-Fi Direct devices for a specific Wi-Fi Direct device selector type.
     * @remarks
     * This method will return either Wi-Fi Direct device interfaces or associated endpoints for PCs, tablets, and phones that support Wi-Fi Direct depending on the value of the *type* parameter.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!WiFiDirectDevice.HasProp("__IWiFiDirectDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectDeviceStatics.IID)
            WiFiDirectDevice.__IWiFiDirectDeviceStatics := IWiFiDirectDeviceStatics(factoryPtr)
        }

        return WiFiDirectDevice.__IWiFiDirectDeviceStatics.GetDeviceSelector()
    }

    /**
     * Creates an instance of the [WiFiDirectDevice](wifidirectdevice.md) class for the specified device interface id with specific connection parameters.
     * @remarks
     * You can use the [GetDeviceSelector](wifidirectdevice_getdeviceselector_185243134.md) methods to enumerate Wi-Fi Direct devices to determine their interface ids.
     * @param {HSTRING} deviceId The [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) of a Wi-Fi Direct device.
     * @returns {IAsyncOperation<WiFiDirectDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!WiFiDirectDevice.HasProp("__IWiFiDirectDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectDeviceStatics.IID)
            WiFiDirectDevice.__IWiFiDirectDeviceStatics := IWiFiDirectDeviceStatics(factoryPtr)
        }

        return WiFiDirectDevice.__IWiFiDirectDeviceStatics.FromIdAsync(deviceId)
    }

    /**
     * Returns the class selection string that you can use to enumerate Wi-Fi Direct devices.
     * @remarks
     * This method only returns Wi-Fi Direct device interfaces.
     * @param {Integer} type 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.getdeviceselector
     */
    static GetDeviceSelector1(type) {
        if (!WiFiDirectDevice.HasProp("__IWiFiDirectDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectDeviceStatics2.IID)
            WiFiDirectDevice.__IWiFiDirectDeviceStatics2 := IWiFiDirectDeviceStatics2(factoryPtr)
        }

        return WiFiDirectDevice.__IWiFiDirectDeviceStatics2.GetDeviceSelector(type)
    }

    /**
     * Creates an instance of the [WiFiDirectDevice](wifidirectdevice.md) class for the specified device interface id.
     * @remarks
     * You can use the [GetDeviceSelector](wifidirectdevice_getdeviceselector_185243134.md) methods to enumerate Wi-Fi Direct devices to determine their interface ids.
     * @param {HSTRING} deviceId The [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) of a Wi-Fi Direct device.
     * @param {WiFiDirectConnectionParameters} connectionParameters 
     * @returns {IAsyncOperation<WiFiDirectDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.fromidasync
     */
    static FromIdAsync1(deviceId, connectionParameters) {
        if (!WiFiDirectDevice.HasProp("__IWiFiDirectDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectDeviceStatics2.IID)
            WiFiDirectDevice.__IWiFiDirectDeviceStatics2 := IWiFiDirectDeviceStatics2(factoryPtr)
        }

        return WiFiDirectDevice.__IWiFiDirectDeviceStatics2.FromIdAsync(deviceId, connectionParameters)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the connection status for the WiFi-Direct device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.connectionstatus
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

    /**
     * Gets the [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) for the Wi-Fi Direct device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Occurs when a Wi-Fi Direct device connection is connected or disconnected.
     * @remarks
     * You can add a handler for the ConnectionStatusChanged event to be notified when the connection has been established or disconnected.
     * @type {TypedEventHandler<WiFiDirectDevice, IInspectable>}
    */
    OnConnectionStatusChanged {
        get {
            if(!this.HasProp("__OnConnectionStatusChanged")){
                this.__OnConnectionStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9208929a-2a3c-50ad-aa08-a0a986edbabe}"),
                    WiFiDirectDevice,
                    IInspectable
                )
                this.__OnConnectionStatusChangedToken := this.add_ConnectionStatusChanged(this.__OnConnectionStatusChanged.iface)
            }
            return this.__OnConnectionStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConnectionStatusChangedToken")) {
            this.remove_ConnectionStatusChanged(this.__OnConnectionStatusChangedToken)
            this.__OnConnectionStatusChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        if (!this.HasProp("__IWiFiDirectDevice")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectDevice := IWiFiDirectDevice(outPtr)
        }

        return this.__IWiFiDirectDevice.get_ConnectionStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IWiFiDirectDevice")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectDevice := IWiFiDirectDevice(outPtr)
        }

        return this.__IWiFiDirectDevice.get_DeviceId()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionStatusChanged(handler) {
        if (!this.HasProp("__IWiFiDirectDevice")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectDevice := IWiFiDirectDevice(outPtr)
        }

        return this.__IWiFiDirectDevice.add_ConnectionStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionStatusChanged(token) {
        if (!this.HasProp("__IWiFiDirectDevice")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectDevice := IWiFiDirectDevice(outPtr)
        }

        return this.__IWiFiDirectDevice.remove_ConnectionStatusChanged(token)
    }

    /**
     * Gets a collection of network addresses for the Wi-Fi Direct device as endpoint pairs.
     * @returns {IVectorView<EndpointPair>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.getconnectionendpointpairs
     */
    GetConnectionEndpointPairs() {
        if (!this.HasProp("__IWiFiDirectDevice")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectDevice := IWiFiDirectDevice(outPtr)
        }

        return this.__IWiFiDirectDevice.GetConnectionEndpointPairs()
    }

    /**
     * Close the active Wi-Fi Direct device connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectdevice.close
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
