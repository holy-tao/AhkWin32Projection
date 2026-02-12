#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiOnDemandHotspotNetworkProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Represents various properties of a hotspot network (a [WiFiOnDemandHotspotNetwork](wifiondemandhotspotnetwork.md) object) such as battery percentage, display name, availability, and SSID/password.
  * 
  * > [!NOTE]
  * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * >
  * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiOnDemandHotspotNetworkProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiOnDemandHotspotNetworkProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiOnDemandHotspotNetworkProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets a value containing the display name of the hotspot network.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets a value indicating whether the hotspot is in (or out of) range. You can use this info to determine whether the hotspot should be injected into (or removed from) the network list.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * Windows may hide stale networks before the operating system (OS) removes the network from the list, at which point **Availability** would return [WiFiOnDemandHotspotAvailability.Unavailable](wifiondemandhotspotavailability.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.availability
     * @type {Integer} 
     */
    Availability {
        get => this.get_Availability()
        set => this.put_Availability(value)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets an optional (nullable) value indicating the remaining battery percentage of the hotspot network (an integer between 0 and 100, or null).
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.remainingbatterypercent
     * @type {IReference<Integer>} 
     */
    RemainingBatteryPercent {
        get => this.get_RemainingBatteryPercent()
        set => this.put_RemainingBatteryPercent(value)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets an optional (nullable) value indicating the number of cellular bars (out of five) of the hotspot network.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.cellularbars
     * @type {IReference<Integer>} 
     */
    CellularBars {
        get => this.get_CellularBars()
        set => this.put_CellularBars(value)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets a value indicating the app's preference for whether or not the hotspot network should be marked as metered.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * This value indicates the app's preference; there's no guarantee what the actual underlying network is set to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.ismetered
     * @type {Boolean} 
     */
    IsMetered {
        get => this.get_IsMetered()
        set => this.put_IsMetered(value)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets a value indicating the SSID of the hotspot network.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.ssid
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
        set => this.put_Ssid(value)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets or sets a value containing the password of the hotspot network.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * Hotspot networks must be secured with a password - enterprise networks and open networks are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetworkproperties.password
     * @type {PasswordCredential} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_DisplayName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Availability() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_Availability()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Availability(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_Availability(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RemainingBatteryPercent() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_RemainingBatteryPercent()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_RemainingBatteryPercent(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_RemainingBatteryPercent(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CellularBars() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_CellularBars()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CellularBars(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_CellularBars(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMetered() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_IsMetered()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMetered(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_IsMetered(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_Ssid()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Ssid(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_Ssid(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_Password() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.get_Password()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_Password(value) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetworkProperties")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetworkProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetworkProperties := IWiFiOnDemandHotspotNetworkProperties(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetworkProperties.put_Password(value)
    }

;@endregion Instance Methods
}
