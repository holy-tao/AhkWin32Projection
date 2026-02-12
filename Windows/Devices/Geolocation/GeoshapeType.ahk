#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the shape of a geographic region.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoshapetype
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeoshapeType extends Win32Enum{

    /**
     * The geographic region is a point.
     * @type {Integer (Int32)}
     */
    static Geopoint => 0

    /**
     * The geographic region is a circle with a center point and a radius.
     * @type {Integer (Int32)}
     */
    static Geocircle => 1

    /**
     * The geographic region is an order series of points.
     * @type {Integer (Int32)}
     */
    static Geopath => 2

    /**
     * The geographic region is a rectangular region.
     * @type {Integer (Int32)}
     */
    static GeoboundingBox => 3
}
