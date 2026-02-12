#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiNetworkReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Contains the result of a network scan operation.
 * @remarks
 * The system creates an instance of this object when a network scan completes successfully and raises a [WiFiAdapter.AvailableNetworksChanged](wifiadapter_availablenetworkschanged.md) event. (You can initiate a network scan using the [WiFiAdapter.FindAllAdaptersAsync](wifiadapter_findalladaptersasync_130273039.md) static method or the [WiFiAdapter.ScanAsync](wifiadapter_scanasync_1036183308.md) method on a particular adapter.) You can also retrieve the results of the most current scan from a given Wi-Fi adapter by getting the [WiFiAdapter.NetworkReport](wifiadapter_networkreport.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifinetworkreport
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiNetworkReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiNetworkReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiNetworkReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Contains the result of a network scan operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifinetworkreport.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A list of available networks.
     * @remarks
     * This list will not show any [On-Demand Hotspot networks](/uwp/api/windows.devices.wifi.wifiondemandhotspotnetwork). Those networks are only exposed in the Windows UI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifinetworkreport.availablenetworks
     * @type {IVectorView<WiFiAvailableNetwork>} 
     */
    AvailableNetworks {
        get => this.get_AvailableNetworks()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IWiFiNetworkReport")) {
            if ((queryResult := this.QueryInterface(IWiFiNetworkReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiNetworkReport := IWiFiNetworkReport(outPtr)
        }

        return this.__IWiFiNetworkReport.get_Timestamp()
    }

    /**
     * 
     * @returns {IVectorView<WiFiAvailableNetwork>} 
     */
    get_AvailableNetworks() {
        if (!this.HasProp("__IWiFiNetworkReport")) {
            if ((queryResult := this.QueryInterface(IWiFiNetworkReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiNetworkReport := IWiFiNetworkReport(outPtr)
        }

        return this.__IWiFiNetworkReport.get_AvailableNetworks()
    }

;@endregion Instance Methods
}
