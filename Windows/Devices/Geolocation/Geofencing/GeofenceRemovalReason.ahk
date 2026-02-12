#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the reason a [Geofence](geofence.md) was removed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofenceremovalreason
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class GeofenceRemovalReason extends Win32Enum{

    /**
     * The geofence event was triggered and the geofence was used.
     * @type {Integer (Int32)}
     */
    static Used => 0

    /**
     * The duration of the geofence has expired.
     * @type {Integer (Int32)}
     */
    static Expired => 1
}
