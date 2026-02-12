#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used to describe the service status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicestatus
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceStatus extends Win32Enum{

    /**
     * The service is available.
     * @type {Integer (Int32)}
     */
    static Available => 0

    /**
     * The service is not currently accepting connections.
     * @type {Integer (Int32)}
     */
    static Busy => 1

    /**
     * The service is returning service-defined custom status values. Get the status value from the [WiFiDirectServiceAdvertiser.CustomServiceStatusCode](wifidirectserviceadvertiser_customservicestatuscode.md) property.
     * @type {Integer (Int32)}
     */
    static Custom => 2
}
