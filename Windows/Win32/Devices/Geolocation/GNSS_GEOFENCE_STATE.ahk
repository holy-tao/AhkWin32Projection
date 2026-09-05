#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_GEOFENCE_STATE extends Win32Enum {

    /**
     * Native name: GNSS_GeofenceState_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: GNSS_GeofenceState_Entered
     * @type {Integer (Int32)}
     */
    static Entered => 1

    /**
     * Native name: GNSS_GeofenceState_Exited
     * @type {Integer (Int32)}
     */
    static Exited => 2
}
