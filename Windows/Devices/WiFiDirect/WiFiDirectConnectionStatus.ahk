#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the connection status of a [WiFiDirectDevice](wifidirectdevice.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionstatus
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectConnectionStatus extends Win32Enum{

    /**
     * The device is not connected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The device is connected to an associated Wi-Fi Direct device.
     * @type {Integer (Int32)}
     */
    static Connected => 1
}
