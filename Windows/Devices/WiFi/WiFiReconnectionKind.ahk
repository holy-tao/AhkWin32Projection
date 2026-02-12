#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes whether to automatically reconnect to this network.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifireconnectionkind
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiReconnectionKind extends Win32Enum{

    /**
     * Reconnect automatically.
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * Allow user to reconnect manually.
     * @type {Integer (Int32)}
     */
    static Manual => 1
}
