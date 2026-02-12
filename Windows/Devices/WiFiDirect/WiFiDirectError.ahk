#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies some common Wi-Fi Direct error cases.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirecterror
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectError extends Win32Enum{

    /**
     * The operation was successfully completed or serviced.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The Wi-Fi Direct radio was not available. This error occurs when the Wi-Fi Direct radio has been turned off.
     * @type {Integer (Int32)}
     */
    static RadioNotAvailable => 1

    /**
     * The operation cannot be serviced because the necessary resources are currently in use.
     * @type {Integer (Int32)}
     */
    static ResourceInUse => 2
}
