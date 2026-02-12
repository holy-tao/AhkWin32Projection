#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Defines constants that specify the number of cellular bars (out of five) of a hotspot network.
  * 
  * > [!NOTE]
  * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * >
  * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotcellularbars
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiOnDemandHotspotCellularBars extends Win32Enum{

    /**
     * Specifies that the hotspot network has zero cellular bars.
     * @type {Integer (Int32)}
     */
    static ZeroBars => 0

    /**
     * Specifies that the hotspot network has one cellular bar.
     * @type {Integer (Int32)}
     */
    static OneBar => 1

    /**
     * Specifies that the hotspot network has two cellular bars.
     * @type {Integer (Int32)}
     */
    static TwoBars => 2

    /**
     * Specifies that the hotspot network has three cellular bars.
     * @type {Integer (Int32)}
     */
    static ThreeBars => 3

    /**
     * Specifies that the hotspot network has four cellular bars.
     * @type {Integer (Int32)}
     */
    static FourBars => 4

    /**
     * Specifies that the hotspot network has five cellular bars.
     * @type {Integer (Int32)}
     */
    static FiveBars => 5
}
