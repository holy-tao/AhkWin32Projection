#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes the kinds of connection methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wificonnectionmethod
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiConnectionMethod extends Win32Enum{

    /**
     * Default.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * WPS pin.
     * @type {Integer (Int32)}
     */
    static WpsPin => 1

    /**
     * WPS protected setup.
     * @type {Integer (Int32)}
     */
    static WpsPushButton => 2
}
