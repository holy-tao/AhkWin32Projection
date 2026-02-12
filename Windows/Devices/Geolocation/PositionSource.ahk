#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the source used to obtain a [Geocoordinate](geocoordinate.md).
 * @remarks
 * The [PositionSource](positionsource.md) value helps applications understand the characteristics and reliability of location
 * data. Different sources have different accuracy profiles and power consumption implications.
 * 
 * > [!NOTE]
 * > The position source reflects the provider currently delivering location data. The system selects a single provider based
 * > on availability, cost, accuracy, and reliability, and may switch to a different source if conditions change.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.positionsource
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class PositionSource extends Win32Enum{

    /**
     * The position was obtained from cellular network data.
     * @type {Integer (Int32)}
     */
    static Cellular => 0

    /**
     * The position was obtained from satellite data.
     * @type {Integer (Int32)}
     */
    static Satellite => 1

    /**
     * The position was obtained from Wi-Fi network data.
     * @type {Integer (Int32)}
     */
    static WiFi => 2

    /**
     * The position was obtained from an IP address.
     * @type {Integer (Int32)}
     */
    static IPAddress => 3

    /**
     * The position was obtained from an unknown source.
     * @type {Integer (Int32)}
     */
    static Unknown => 4

    /**
     * The position was obtained from the user's manually-set location.
     * @type {Integer (Int32)}
     */
    static Default => 5

    /**
     * The position was obtained via the coarse location feature and was therefore intentionally made inaccurate to a degree.
     * @type {Integer (Int32)}
     */
    static Obfuscated => 6
}
