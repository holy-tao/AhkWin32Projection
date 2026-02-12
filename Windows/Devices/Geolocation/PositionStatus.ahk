#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the ability of the [Geolocator](geolocator.md) object to provide location data.
 * @remarks
 * PositionStatus values indicate whether location can be retrieved and whether the app has permission. Monitor changes
 * using the [StatusChanged](geolocator_statuschanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.positionstatus
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class PositionStatus extends Win32Enum{

    /**
     * Location data can be retrieved.
     * @type {Integer (Int32)}
     */
    static Ready => 0

    /**
     * Attempting to obtain an initial location fix. Reported when a [Geolocator](geolocator.md) object is first created or when
     * its desired accuracy is changed.
     * @type {Integer (Int32)}
     */
    static Initializing => 1

    /**
     * No location data is available from any source.
     * > Call [RequestAccessAsync](geolocator_requestaccessasync_380675631.md) before accessing the user's location. At that
     * > time, your app must be in the foreground and `RequestAccessAsync` must be called from the UI thread. Until the user
     * > grants your app permission to their location, your app can't access location data.
     * @type {Integer (Int32)}
     */
    static NoData => 2

    /**
     * Location settings are turned off. This status indicates that the user has not granted the application permission to
     * access location.
     * @type {Integer (Int32)}
     */
    static Disabled => 3

    /**
     * An operation to retrieve location has not yet been initialized. [LocationStatus](geolocator_locationstatus.md) will have
     * this value if the application has not yet called [GetGeopositionAsync](geolocator_getgeopositionasync_189682258.md) or
     * registered an event handler for the [PositionChanged](geolocator_positionchanged.md) event.
     * @type {Integer (Int32)}
     */
    static NotInitialized => 4

    /**
     * Location is not supported on this version of Windows.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 5
}
