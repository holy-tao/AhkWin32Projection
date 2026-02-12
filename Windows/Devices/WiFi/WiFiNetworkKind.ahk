#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes the kinds of Wi-Fi networks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifinetworkkind
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiNetworkKind extends Win32Enum{

    /**
     * Either an infrastructure or independent network.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * An infrastructure network.
     * @type {Integer (Int32)}
     */
    static Infrastructure => 1

    /**
     * An independent (IBSS) network.
     * @type {Integer (Int32)}
     */
    static Adhoc => 2
}
