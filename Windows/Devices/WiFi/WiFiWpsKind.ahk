#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes the kinds of WPS connection methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiwpskind
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiWpsKind extends Win32Enum{

    /**
     * Unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * WPS pin.
     * @type {Integer (Int32)}
     */
    static Pin => 1

    /**
     * WPS push button.
     * @type {Integer (Int32)}
     */
    static PushButton => 2

    /**
     * Near field communication.
     * @type {Integer (Int32)}
     */
    static Nfc => 3

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static Ethernet => 4

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static Usb => 5
}
