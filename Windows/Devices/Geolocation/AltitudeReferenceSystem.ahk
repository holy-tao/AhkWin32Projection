#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the altitude reference system to be used in defining a geographic shape.
 * @remarks
 * The `Terrain`, `Geoid`, and `Surface` values are implementation dependent and not mathematically precise.
 * 
 * > [!NOTE]
 * > The altitude reference system returned for a location fix may depend on the GNSS hardware. Most modern hardware
 * > reports values using the `Geoid` reference system, but Map Control APIs return values in the `Ellipsoid` system.
 * > To find the active reference system for a [Geopoint](geopoint.md), check the
 * > [AltitudeReferenceSystem](geopoint_altitudereferencesystem.md) property. When copying a
 * > [BasicGeoposition](basicgeoposition.md), also copy the associated
 * > [AltitudeReferenceSystem](geopoint_altitudereferencesystem.md); otherwise the `Altitude` value may be invalid.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.altitudereferencesystem
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class AltitudeReferenceSystem extends Win32Enum{

    /**
     * The altitude reference system was not specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The altitude reference system is based on distance above terrain or ground level.
     * @type {Integer (Int32)}
     */
    static Terrain => 1

    /**
     * The altitude reference system is based on an ellipsoid which is a mathematical approximation of the shape of the Earth.
     * @type {Integer (Int32)}
     */
    static Ellipsoid => 2

    /**
     * The altitude reference system is based on the distance above sea level.
     * @type {Integer (Int32)}
     */
    static Geoid => 3

    /**
     * The altitude reference system is based on the distance above the tallest surface structures, such as buildings,
     * trees, roads, etc., above terrain or ground level.
     * @type {Integer (Int32)}
     */
    static Surface => 4
}
