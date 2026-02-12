#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates if your app has permission to access location data.
 * @remarks
 * The [GeolocationAccessStatus](geolocationaccessstatus.md) enum is returned by
 * [RequestAccessAsync](geolocator_requestaccessasync_380675631.md) to indicate whether your application has permission to
 * access location data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocationaccessstatus
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeolocationAccessStatus extends Win32Enum{

    /**
     * Permission to access location was not specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Permission to access location was granted.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Permission to access location was denied.
     * @type {Integer (Int32)}
     */
    static Denied => 2
}
