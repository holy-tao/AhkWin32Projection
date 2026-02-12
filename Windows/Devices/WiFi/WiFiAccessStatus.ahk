#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Used to report the results of an attempt to request access to a Wi-Fi adapter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiaccessstatus
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiAccessStatus extends Win32Enum{

    /**
     * The asynchronous request has not completed yet.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Access has been allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Access has been denied by the user, through the user interface.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * Access has been denied by the system.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}
