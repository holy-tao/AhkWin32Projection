#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Defines constants that specify the status of a connection to a hotspot network.
  * 
  * > [!NOTE]
  * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * >
  * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotconnectstatus
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiOnDemandHotspotConnectStatus extends Win32Enum{

    /**
     * Specifies that the connection failed in an unspecified way.
     * @type {Integer (Int32)}
     */
    static UnspecifiedFailure => 0

    /**
     * Specifies that the connection succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * Specifies that the connection timed out.
     * @type {Integer (Int32)}
     */
    static AppTimedOut => 2

    /**
     * Specifies that the connection failed due to invalid credentials.
     * @type {Integer (Int32)}
     */
    static InvalidCredential => 3

    /**
     * Specifies that the connection failed due to the network not being available.
     * @type {Integer (Int32)}
     */
    static NetworkNotAvailable => 4

    /**
     * Specifies that the connection failed due to the authentication protocol not being supported.
     * @type {Integer (Int32)}
     */
    static UnsupportedAuthenticationProtocol => 5

    /**
     * Specifies that the connection failed due to a Bluetooth connection failure.
     * @type {Integer (Int32)}
     */
    static BluetoothConnectFailed => 6

    /**
     * Specifies that the connection failed due to a Bluetooth transmission error.
     * @type {Integer (Int32)}
     */
    static BluetoothTransmissionError => 7

    /**
     * Specifies that the connection failed because the user canceled it.
     * @type {Integer (Int32)}
     */
    static OperationCanceledByUser => 8

    /**
     * Specifies that the connection failed because the cellular customer isn't allowed to use the tethering feature based on their entitlement.
     * @type {Integer (Int32)}
     */
    static EntitlementCheckFailed => 9

    /**
     * Specifies that the connection failed due to no cellular signal.
     * @type {Integer (Int32)}
     */
    static NoCellularSignal => 10

    /**
     * Specifies that the connection failed due to cellular data being turned off.
     * @type {Integer (Int32)}
     */
    static CellularDataTurnedOff => 11

    /**
     * Specifies that the connection failed due to a wireless local-area network (WLAN) failure.
     * @type {Integer (Int32)}
     */
    static WlanConnectFailed => 12

    /**
     * Specifies that the connection failed due to the wireless local-area network (WLAN) not being visible. The PC couldn't see the SSID specified by the [WiFiOnDemandHotspotNetworkProperties.Ssid](wifiondemandhotspotnetworkproperties_ssid.md) property.
     * @type {Integer (Int32)}
     */
    static WlanNotVisible => 13

    /**
     * Specifies that the connection failed for not being able to connect to the access point.
     * @type {Integer (Int32)}
     */
    static AccessPointCannotConnect => 14

    /**
     * Specifies that the connection failed due to a cellular connection timeout.
     * @type {Integer (Int32)}
     */
    static CellularConnectTimedOut => 15

    /**
     * Specifies that the connection failed because roaming isn't allowed.
     * @type {Integer (Int32)}
     */
    static RoamingNotAllowed => 16

    /**
     * Specifies that the connection failed because pairing is required.
     * @type {Integer (Int32)}
     */
    static PairingRequired => 17

    /**
     * Specifies that the connection failed due to the data limit being reached.
     * @type {Integer (Int32)}
     */
    static DataLimitReached => 18
}
