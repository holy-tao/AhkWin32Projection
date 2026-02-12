#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe a Visit-related state change.
 * @remarks
 * When a state change is logged with the value `Arrived`, the device remains in that area until either a `Departed` or `TrackingLost` change is logged.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.visitstatechange
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class VisitStateChange extends Win32Enum{

    /**
     * The device is unable to track location at this time.
     * @type {Integer (Int32)}
     */
    static TrackingLost => 0

    /**
     * The user arrived at a visit.
     * @type {Integer (Int32)}
     */
    static Arrived => 1

    /**
     * The user departed from a visit.
     * @type {Integer (Int32)}
     */
    static Departed => 2

    /**
     * The user moved significantly since the last visit.
     * @type {Integer (Int32)}
     */
    static OtherMovement => 3
}
