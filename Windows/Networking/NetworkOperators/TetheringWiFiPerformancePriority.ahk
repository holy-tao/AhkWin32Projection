#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify performance priority options for the Wi-Fi chipset to decide which connection performance to prioritize should the station connection band interfere with the tethering hotspot band.
 * @remarks
 * The performance priority can be set only as a per-session hotspot configuration field; meaning that it won't persist between tethering sessions. This field will be part only of the [NetworkOperatorTetheringSessionAccessPointConfiguration](./networkoperatortetheringsessionaccesspointconfiguration.md) class, which holds all configurable per-session values.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringwifiperformancepriority
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringWiFiPerformancePriority extends Win32Enum{

    /**
     * Specifies the default behavior provided by the Wi-Fi chipset.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Specifies that the Wi-Fi chipset should prioritize the performance of the tethering hotspot over the performance of the station connection. This will allow the station connection frequency band to be changed to avoid any kind of interference.
     * 
     * For example, the main connection is over a 5 GHz band, and so the tethering hotspot can't be configured to use a 6 GHz band. In that case, *TetheringOverStation* tells the Wi-Fi chipset to attempt to change the main connection over to a 2.4 GHz band, so there'll no longer be interference with the requested 6 GHz band for the tethering hotspot.
     * 
     * A *BandInterference* status code is still possible when turning on the tethering hotspot if the Wi-Fi chipset can't change the station connection frequency. For example, the user's access point isn't broadcasting 2.4 GHz and 5GHz on the same SSID; some access point have different SSIDs for different frequencies: SSID-2.4G and SSID-5G. Due to hardware limitations, the only scenario where a band interference might occur and this performance priority can prevent it is when the device's station connection is over 5 GHz and the requested tethering hotspot is over 6 GHz.
     * @type {Integer (Int32)}
     */
    static TetheringOverStation => 1
}
