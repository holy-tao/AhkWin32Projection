#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiConnectionResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes the results of an attempt to connect to a Wi-Fi network.
 * @remarks
 * An instance of this class is created and returned by the [WiFiAdapter.ConnectAsync](/uwp/api/windows.devices.wifi.wifiadapter.connectasync) function.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wificonnectionresult
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiConnectionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiConnectionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiConnectionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets the connection result value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wificonnectionresult.connectionstatus
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
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
    get_ConnectionStatus() {
        if (!this.HasProp("__IWiFiConnectionResult")) {
            if ((queryResult := this.QueryInterface(IWiFiConnectionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiConnectionResult := IWiFiConnectionResult(outPtr)
        }

        return this.__IWiFiConnectionResult.get_ConnectionStatus()
    }

;@endregion Instance Methods
}
