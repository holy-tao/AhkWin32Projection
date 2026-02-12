#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes the status of the [GetWpsConfigurationAsync](wifiadapter_getwpsconfigurationasync_1613138554.md) call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiwpsconfigurationstatus
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiWpsConfigurationStatus extends Win32Enum{

    /**
     * Connection failed for a reason other than those in this list.
     * @type {Integer (Int32)}
     */
    static UnspecifiedFailure => 0

    /**
     * Connection succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * Connection failed because the connection attempt timed out.
     * @type {Integer (Int32)}
     */
    static Timeout => 2
}
