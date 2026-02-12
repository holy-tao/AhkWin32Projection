#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether the Wi-Fi Direct device is listening and discoverable.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementlistenstatediscoverability
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectAdvertisementListenStateDiscoverability extends Win32Enum{

    /**
     * The device is not discoverable.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The device is highly discoverable so long as the app is in the foreground.
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * The device is discoverable when the app is in the foreground or in the background.
     * @type {Integer (Int32)}
     */
    static Intensive => 2
}
