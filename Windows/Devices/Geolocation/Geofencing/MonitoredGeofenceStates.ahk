#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the state or states of the Geofences that are currently being monitored by the system.
 * @remarks
 * You must specify the `MonitoredGeofenceStates.Entered` or `MonitoredGeofenceStates.Exited` flags, or both, for a geofence to be monitored. It is not possible to create a geofence that only monitors the `MonitoredGeofenceStates.Removed` flag.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.monitoredgeofencestates
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class MonitoredGeofenceStates extends Win32BitflagEnum{

    /**
     * No flag is set.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The device has entered a geofence area.
     * @type {Integer (UInt32)}
     */
    static Entered => 1

    /**
     * The device has left a geofence area.
     * @type {Integer (UInt32)}
     */
    static Exited => 2

    /**
     * The geofence has been removed.
     * @type {Integer (UInt32)}
     */
    static Removed => 4
}
