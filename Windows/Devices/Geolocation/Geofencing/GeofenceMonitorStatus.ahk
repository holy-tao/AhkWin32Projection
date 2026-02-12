#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the current state of a [GeofenceMonitor](geofencemonitor.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitorstatus
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class GeofenceMonitorStatus extends Win32Enum{

    /**
     * The monitor is ready and active.
     * @type {Integer (Int32)}
     */
    static Ready => 0

    /**
     * The monitor is in the process of initializing.
     * @type {Integer (Int32)}
     */
    static Initializing => 1

    /**
     * There is no data on the status of the monitor.
     * @type {Integer (Int32)}
     */
    static NoData => 2

    /**
     * Access to location is denied.
     * @type {Integer (Int32)}
     */
    static Disabled => 3

    /**
     * The geofence monitor has not been initialized.
     * @type {Integer (Int32)}
     */
    static NotInitialized => 4

    /**
     * The geofence monitor is not available.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 5
}
