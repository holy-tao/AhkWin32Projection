#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiAvailableNetwork.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes an available Wi-Fi network.
 * @remarks
 * You do not instantiate objects of this class directly. The system creates instances of this object in as part of the process of scanning for networks and raising the [WiFiAdapter.AvailableNetworksChanged](wifiadapter_availablenetworkschanged.md) event. You can initiate a network scan using the [WiFiAdapter.FindAllAdaptersAsync](wifiadapter_findalladaptersasync_130273039.md) static method or the [WiFiAdapter.ScanAsync](wifiadapter_scanasync_1036183308.md) method on a particular adapter. You can also retrieve the list of networks from the results of the most current scan from a given Wi-Fi adapter by getting the [AvailableNetworks](wifinetworkreport_availablenetworks.md) property of the [WiFiAdapter.NetworkReport](wifiadapter_networkreport.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiAvailableNetwork extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiAvailableNetwork

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiAvailableNetwork.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the uptime value reported by the network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.uptime
     * @type {TimeSpan} 
     */
    Uptime {
        get => this.get_Uptime()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the SSID (name) of the network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.ssid
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the MAC address of the access point.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.bssid
     * @type {HSTRING} 
     */
    Bssid {
        get => this.get_Bssid()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the channel center frequency of the band on which the 802.11 Beacon or Probe Response was received.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.channelcenterfrequencyinkilohertz
     * @type {Integer} 
     */
    ChannelCenterFrequencyInKilohertz {
        get => this.get_ChannelCenterFrequencyInKilohertz()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the signal strength of the network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.networkrssiindecibelmilliwatts
     * @type {Float} 
     */
    NetworkRssiInDecibelMilliwatts {
        get => this.get_NetworkRssiInDecibelMilliwatts()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the strength of the signal as a number of bars.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.signalbars
     * @type {Integer} 
     */
    SignalBars {
        get => this.get_SignalBars()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets a value describing the kind of network being described.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.networkkind
     * @type {Integer} 
     */
    NetworkKind {
        get => this.get_NetworkKind()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets a value describing the kind of PHY used by this network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.phykind
     * @type {Integer} 
     */
    PhyKind {
        get => this.get_PhyKind()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the security configuration of the network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.securitysettings
     * @type {NetworkSecuritySettings} 
     */
    SecuritySettings {
        get => this.get_SecuritySettings()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the interval between 802.11 Beacon frames used by this network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.beaconinterval
     * @type {TimeSpan} 
     */
    BeaconInterval {
        get => this.get_BeaconInterval()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets a value indicating whether this network originates from a Wi-Fi Direct access point.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiavailablenetwork.iswifidirect
     * @type {Boolean} 
     */
    IsWiFiDirect {
        get => this.get_IsWiFiDirect()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Uptime() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_Uptime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_Ssid()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bssid() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_Bssid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChannelCenterFrequencyInKilohertz() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_ChannelCenterFrequencyInKilohertz()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NetworkRssiInDecibelMilliwatts() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_NetworkRssiInDecibelMilliwatts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignalBars() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_SignalBars()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkKind() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_NetworkKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhyKind() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_PhyKind()
    }

    /**
     * 
     * @returns {NetworkSecuritySettings} 
     */
    get_SecuritySettings() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_SecuritySettings()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BeaconInterval() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_BeaconInterval()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWiFiDirect() {
        if (!this.HasProp("__IWiFiAvailableNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiAvailableNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiAvailableNetwork := IWiFiAvailableNetwork(outPtr)
        }

        return this.__IWiFiAvailableNetwork.get_IsWiFiDirect()
    }

;@endregion Instance Methods
}
