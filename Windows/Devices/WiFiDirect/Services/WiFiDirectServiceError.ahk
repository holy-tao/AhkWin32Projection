#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used for the [WiFiDirectServiceAdvertiser.ServiceError](wifidirectserviceadvertiser_serviceerror.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceerror
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceError extends Win32Enum{

    /**
     * No error.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The Wi-Fi Direct radio is not available.
     * @type {Integer (Int32)}
     */
    static RadioNotAvailable => 1

    /**
     * A required resource is in use.
     * @type {Integer (Int32)}
     */
    static ResourceInUse => 2

    /**
     * The Wi-Fi adapter does not support Wi-Fi Direct.
     * @type {Integer (Int32)}
     */
    static UnsupportedHardware => 3

    /**
     * No Wi-Fi adapter is found.
     * @type {Integer (Int32)}
     */
    static NoHardware => 4
}
