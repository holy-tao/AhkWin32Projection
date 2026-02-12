#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Describes PHY types supported by standard 802.11.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiphykind
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiPhyKind extends Win32Enum{

    /**
     * Unspecified PHY type
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Frequency-hopping, spread-spectrum (FHSS) PHY.
     * @type {Integer (Int32)}
     */
    static Fhss => 1

    /**
     * Direct sequence, spread-spectrum (DSSS) PHY.
     * @type {Integer (Int32)}
     */
    static Dsss => 2

    /**
     * Infrared (IR) baseband PHY.
     * @type {Integer (Int32)}
     */
    static IRBaseband => 3

    /**
     * Orthogonal frequency division multiplex (OFDM) PHY.
     * @type {Integer (Int32)}
     */
    static Ofdm => 4

    /**
     * High-rated DSSS (HRDSSS) PHY.
     * @type {Integer (Int32)}
     */
    static Hrdsss => 5

    /**
     * Extended Rate (ERP) PHY.
     * @type {Integer (Int32)}
     */
    static Erp => 6

    /**
     * High Throughput (HT) PHY for 802.11n PHY.
     * @type {Integer (Int32)}
     */
    static HT => 7

    /**
     * Very High Throughput (VHT) PHY for 802.11ac PHY.
     * @type {Integer (Int32)}
     */
    static Vht => 8

    /**
     * Directional multi-gigabit (DMG) PHY for 802.11ad.
     * @type {Integer (Int32)}
     */
    static Dmg => 9

    /**
     * High-Efficiency Wireless (HEW) PHY for 802.11ax.
     * @type {Integer (Int32)}
     */
    static HE => 10

    /**
     * @type {Integer (Int32)}
     */
    static Eht => 11
}
