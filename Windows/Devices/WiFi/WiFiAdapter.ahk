#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiAdapter.ahk
#Include .\IWiFiAdapter2.ahk
#Include .\IWiFiAdapterStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiAdapter.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Use this class to enumerate local Wi-Fi adapters, initiate Wi-Fi scans, enumerate scan results, and to connect or disconnect individual adapters.
 * @remarks
 * Your code uses the static methods of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiAdapter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiAdapter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiAdapter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A static method that initiates an asynchronous operation to enumerate all Wi-Fi adapters in the system.
     * 
     * Note that if you do not specify that your app has the [wiFiControl](/windows/uwp/packaging/app-capability-declarations) capability in your app manifest, this method fails.
     * @returns {IAsyncOperation<IVectorView<WiFiAdapter>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.findalladaptersasync
     */
    static FindAllAdaptersAsync() {
        if (!WiFiAdapter.HasProp("__IWiFiAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFi.WiFiAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiAdapterStatics.IID)
            WiFiAdapter.__IWiFiAdapterStatics := IWiFiAdapterStatics(factoryPtr)
        }

        return WiFiAdapter.__IWiFiAdapterStatics.FindAllAdaptersAsync()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A static method that returns an Advanced Query Syntax (AQS) string to be used to enumerate Wi-Fi adapters using [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) and related methods.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!WiFiAdapter.HasProp("__IWiFiAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFi.WiFiAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiAdapterStatics.IID)
            WiFiAdapter.__IWiFiAdapterStatics := IWiFiAdapterStatics(factoryPtr)
        }

        return WiFiAdapter.__IWiFiAdapterStatics.GetDeviceSelector()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A static method that initiates an asynchronous operation to get a [WiFiAdapter](wifiadapter.md) object.
     * 
     * Note that if you do not specify that your app has the [wiFiControl](/windows/uwp/packaging/app-capability-declarations) capability in your app manifest, this method fails.
     * @param {HSTRING} deviceId The Device ID of the Wi-Fi adapter to be retrieved. Obtain a Device ID through the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) namespace.
     * @returns {IAsyncOperation<WiFiAdapter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!WiFiAdapter.HasProp("__IWiFiAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFi.WiFiAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiAdapterStatics.IID)
            WiFiAdapter.__IWiFiAdapterStatics := IWiFiAdapterStatics(factoryPtr)
        }

        return WiFiAdapter.__IWiFiAdapterStatics.FromIdAsync(deviceId)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A static method for determining whether the current user can access any of the Wi-Fi adapters on this device.
     * 
     * Note that if you do not specify that your app has the [wiFiControl](/windows/uwp/packaging/app-capability-declarations) capability in your app manifest, this method always returns DeniedBySystem.
     * 
     * Always returns **DeniedBySystem** on Xbox.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!WiFiAdapter.HasProp("__IWiFiAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFi.WiFiAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiAdapterStatics.IID)
            WiFiAdapter.__IWiFiAdapterStatics := IWiFiAdapterStatics(factoryPtr)
        }

        return WiFiAdapter.__IWiFiAdapterStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets information about a Wi-Fi adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.networkadapter
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets a list of available networks populated by the last Wi-Fi scan on this WiFiNetworkAdapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.networkreport
     * @type {WiFiNetworkReport} 
     */
    NetworkReport {
        get => this.get_NetworkReport()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Event raised when a scan completes on this Wi-Fi adapter. This event cannot be raised from a background task.
     * @type {TypedEventHandler<WiFiAdapter, IInspectable>}
    */
    OnAvailableNetworksChanged {
        get {
            if(!this.HasProp("__OnAvailableNetworksChanged")){
                this.__OnAvailableNetworksChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f6c02d1b-43e8-5fc8-8e8e-ee7b8094b683}"),
                    WiFiAdapter,
                    IInspectable
                )
                this.__OnAvailableNetworksChangedToken := this.add_AvailableNetworksChanged(this.__OnAvailableNetworksChanged.iface)
            }
            return this.__OnAvailableNetworksChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAvailableNetworksChangedToken")) {
            this.remove_AvailableNetworksChanged(this.__OnAvailableNetworksChangedToken)
            this.__OnAvailableNetworksChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.get_NetworkAdapter()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Directs this adapter to initiate an asynchronous network scan.
     * @remarks
     * You should call this API from a foreground app. If it is called from a background task, you will see an "Access Denied" error message or a similar message.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.scanasync
     */
    ScanAsync() {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.ScanAsync()
    }

    /**
     * 
     * @returns {WiFiNetworkReport} 
     */
    get_NetworkReport() {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.get_NetworkReport()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiAdapter, IInspectable>} args 
     * @returns {EventRegistrationToken} 
     */
    add_AvailableNetworksChanged(args) {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.add_AvailableNetworksChanged(args)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_AvailableNetworksChanged(eventCookie) {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.remove_AvailableNetworksChanged(eventCookie)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Connect this Wi-Fi device to the specified network, with the specified passphrase and reconnection policy.
     * @param {WiFiAvailableNetwork} availableNetwork Specifies the Wi-Fi network to connect to.
     * @param {Integer} reconnectionKind Describes how to reconnect to the network if connection is lost.
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.connectasync
     */
    ConnectAsync(availableNetwork, reconnectionKind) {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.ConnectAsync(availableNetwork, reconnectionKind)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Connect this Wi-Fi device to a hidden network, with the given passphrase and reconnection policy.
     * @param {WiFiAvailableNetwork} availableNetwork Describes the Wi-Fi network to connect to.
     * @param {Integer} reconnectionKind Describes how to reconnect to the network if connection is lost.
     * @param {PasswordCredential} passwordCredential_ Password or other credential to use to connect to the network.
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.connectasync
     */
    ConnectWithPasswordCredentialAsync(availableNetwork, reconnectionKind, passwordCredential_) {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.ConnectWithPasswordCredentialAsync(availableNetwork, reconnectionKind, passwordCredential_)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Connect this Wi-Fi device to a hidden network, with the given passphrase, connection method, and reconnection policy.
     * @param {WiFiAvailableNetwork} availableNetwork Specifies the Wi-Fi network to connect to.
     * @param {Integer} reconnectionKind Specifies how to reconnect if the connection is lost.
     * @param {PasswordCredential} passwordCredential_ The passphrase to be used to connect to the access point.
     * @param {HSTRING} ssid When the network SSID is hidden, use this parameter to provide the SSID.
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.connectasync
     */
    ConnectWithPasswordCredentialAndSsidAsync(availableNetwork, reconnectionKind, passwordCredential_, ssid) {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.ConnectWithPasswordCredentialAndSsidAsync(availableNetwork, reconnectionKind, passwordCredential_, ssid)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Disconnects any active Wi-Fi connection through this adapter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.disconnect
     */
    Disconnect() {
        if (!this.HasProp("__IWiFiAdapter")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter := IWiFiAdapter(outPtr)
        }

        return this.__IWiFiAdapter.Disconnect()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Performs WPS discovery to query the WPS methods supported by the network.
     * @param {WiFiAvailableNetwork} availableNetwork An available Wi-Fi network. See WiFiAvailableNetwork class.
     * @returns {IAsyncOperation<WiFiWpsConfigurationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.getwpsconfigurationasync
     */
    GetWpsConfigurationAsync(availableNetwork) {
        if (!this.HasProp("__IWiFiAdapter2")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter2 := IWiFiAdapter2(outPtr)
        }

        return this.__IWiFiAdapter2.GetWpsConfigurationAsync(availableNetwork)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Connect this Wi-Fi device to the specified network, with the specified reconnection policy.
     * @param {WiFiAvailableNetwork} availableNetwork Describes the Wi-Fi network to be connected.
     * @param {Integer} reconnectionKind Specifies how to reconnect if the connection is lost.
     * @param {PasswordCredential} passwordCredential_ 
     * @param {HSTRING} ssid 
     * @param {Integer} connectionMethod 
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiadapter.connectasync
     */
    ConnectWithPasswordCredentialAndSsidAndConnectionMethodAsync(availableNetwork, reconnectionKind, passwordCredential_, ssid, connectionMethod) {
        if (!this.HasProp("__IWiFiAdapter2")) {
            if ((queryResult := this.QueryInterface(IWiFiAdapter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAdapter2 := IWiFiAdapter2(outPtr)
        }

        return this.__IWiFiAdapter2.ConnectWithPasswordCredentialAndSsidAndConnectionMethodAsync(availableNetwork, reconnectionKind, passwordCredential_, ssid, connectionMethod)
    }

;@endregion Instance Methods
}
