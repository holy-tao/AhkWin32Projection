#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Enumeration that represents the kinds of radio devices.
 * @remarks
 * [RadioKind](radiokind.md) identifies the technology type of radio devices, enabling applications to filter and manage 
 * specific radio types appropriately.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radiokind
 * @namespace Windows.Devices.Radios
 * @version WindowsRuntime 1.4
 */
class RadioKind extends Win32Enum{

    /**
     * An unspecified kind of radio device.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * A Wi-Fi radio. 802.11 wireless networking radios for local area network connectivity.
     * @type {Integer (Int32)}
     */
    static WiFi => 1

    /**
     * A mobile broadband radio. Cellular radios for wide-area network connectivity (3G, 4G, 5G). This value became available in Windows 10 version 1703.
     * @type {Integer (Int32)}
     */
    static MobileBroadband => 2

    /**
     * A Bluetooth radio. Short-range wireless communication for device pairing and data transfer.
     * @type {Integer (Int32)}
     */
    static Bluetooth => 3

    /**
     * An FM radio. Radio reception hardware.
     * 
     * > [!NOTE]
     * > This value is defined for future use, and is not currently available.
     * @type {Integer (Int32)}
     */
    static FM => 4
}
