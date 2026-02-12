#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiOnDemandHotspotConnectTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Represents details of a [WiFiOnDemandHotspotConnectTrigger](/uwp/api/windows.applicationmodel.background.wifiondemandhotspotconnecttrigger), which is used to notify the app that the user wishes to connect to a specific on-demand hotspot network.
  * 
  * > [!NOTE]
  * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * >
  * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
 * @remarks
 * When run as a result of a [WiFiOnDemandHotspotConnectTrigger](/uwp/api/windows.applicationmodel.background.wifiondemandhotspotconnecttrigger), your background task code is passed an instance of this class in the [IBackgroundTaskInstance.TriggerDetails](/uwp/api/Windows.ApplicationModel.Background.IBackgroundTaskInstance.TriggerDetails) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotconnecttriggerdetails
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiOnDemandHotspotConnectTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiOnDemandHotspotConnectTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiOnDemandHotspotConnectTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets a [WiFiOnDemandHotspotNetwork](wifiondemandhotspotnetwork.md) object representing the hotspot network that the user is requesting to connect to.
     * 
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotconnecttriggerdetails.requestednetwork
     * @type {WiFiOnDemandHotspotNetwork} 
     */
    RequestedNetwork {
        get => this.get_RequestedNetwork()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WiFiOnDemandHotspotNetwork} 
     */
    get_RequestedNetwork() {
        if (!this.HasProp("__IWiFiOnDemandHotspotConnectTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotConnectTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotConnectTriggerDetails := IWiFiOnDemandHotspotConnectTriggerDetails(outPtr)
        }

        return this.__IWiFiOnDemandHotspotConnectTriggerDetails.get_RequestedNetwork()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Notifies the operating system (OS) of an error activating the given hotspot network.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * Internally, should the app fail to call this method, the connection flow will time out once the background task process has been ended.
     * @param {Integer} status_ The status to report.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotconnecttriggerdetails.reporterror
     */
    ReportError(status_) {
        if (!this.HasProp("__IWiFiOnDemandHotspotConnectTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotConnectTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotConnectTriggerDetails := IWiFiOnDemandHotspotConnectTriggerDetails(outPtr)
        }

        return this.__IWiFiOnDemandHotspotConnectTriggerDetails.ReportError(status_)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Asynchronously notifies the operating system (OS) connection flow to connect to the given hotspot network (a specific SSID/password).
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * Internally, should the app fail to call this method, the connection flow will time out once the background task process has been ended.
     * @returns {IAsyncOperation<WiFiOnDemandHotspotConnectionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotconnecttriggerdetails.connectasync
     */
    ConnectAsync() {
        if (!this.HasProp("__IWiFiOnDemandHotspotConnectTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotConnectTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotConnectTriggerDetails := IWiFiOnDemandHotspotConnectTriggerDetails(outPtr)
        }

        return this.__IWiFiOnDemandHotspotConnectTriggerDetails.ConnectAsync()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Notifies the operating system (OS) connection flow to connect to the given hotspot network (a specific SSID/password).
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * Internally, should the app fail to call this method, the connection flow will time out once the background task process has been ended.
     * @returns {WiFiOnDemandHotspotConnectionResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotconnecttriggerdetails.connect
     */
    Connect() {
        if (!this.HasProp("__IWiFiOnDemandHotspotConnectTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotConnectTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotConnectTriggerDetails := IWiFiOnDemandHotspotConnectTriggerDetails(outPtr)
        }

        return this.__IWiFiOnDemandHotspotConnectTriggerDetails.Connect()
    }

;@endregion Instance Methods
}
