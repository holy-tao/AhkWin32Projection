#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the current state of a [Geofence](geofence.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencestate
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class GeofenceState extends Win32BitflagEnum{

    /**
     * No flag is set.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The device has entered the geofence area.
     * @type {Integer (UInt32)}
     */
    static Entered => 1

    /**
     * The device has left the geofence area.
     * @type {Integer (UInt32)}
     */
    static Exited => 2

    /**
     * The geofence was removed.
     * @type {Integer (UInt32)}
     */
    static Removed => 4
}
