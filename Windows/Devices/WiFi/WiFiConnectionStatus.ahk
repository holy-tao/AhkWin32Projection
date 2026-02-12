#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Status of the connection attempt.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wificonnectionstatus
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiConnectionStatus extends Win32Enum{

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
     * Connection failed because access to the network has been revoked.
     * @type {Integer (Int32)}
     */
    static AccessRevoked => 2

    /**
     * Connection failed because an invalid credential was presented.
     * @type {Integer (Int32)}
     */
    static InvalidCredential => 3

    /**
     * Connection failed because the network is not available.
     * @type {Integer (Int32)}
     */
    static NetworkNotAvailable => 4

    /**
     * Connection failed because the connection attempt timed out.
     * @type {Integer (Int32)}
     */
    static Timeout => 5

    /**
     * Connection failed because the authentication protocol is not supported.
     * @type {Integer (Int32)}
     */
    static UnsupportedAuthenticationProtocol => 6
}
