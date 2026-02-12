#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiWpsConfigurationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Wifi configuration result returned by a call to [GetWpsConfigurationAsync](wifiadapter_getwpsconfigurationasync_1613138554.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiwpsconfigurationresult
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiWpsConfigurationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiWpsConfigurationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiWpsConfigurationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * The status of a [GetWpsConfigurationAsync](wifiadapter_getwpsconfigurationasync_1613138554.md) call.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiwpsconfigurationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A list of supported WPS connection methods.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiwpsconfigurationresult.supportedwpskinds
     * @type {IVectorView<Integer>} 
     */
    SupportedWpsKinds {
        get => this.get_SupportedWpsKinds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IWiFiWpsConfigurationResult")) {
            if ((queryResult := this.QueryInterface(IWiFiWpsConfigurationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiWpsConfigurationResult := IWiFiWpsConfigurationResult(outPtr)
        }

        return this.__IWiFiWpsConfigurationResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedWpsKinds() {
        if (!this.HasProp("__IWiFiWpsConfigurationResult")) {
            if ((queryResult := this.QueryInterface(IWiFiWpsConfigurationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiWpsConfigurationResult := IWiFiWpsConfigurationResult(outPtr)
        }

        return this.__IWiFiWpsConfigurationResult.get_SupportedWpsKinds()
    }

;@endregion Instance Methods
}
