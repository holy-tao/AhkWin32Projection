#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The basic information to describe a geographic position.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.basicgeoposition
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class BasicGeoposition extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The latitude of the geographic position. The valid range of latitude values is from -90.0 to 90.0 degrees.
     * @type {Float}
     */
    Latitude {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The longitude of the geographic position. This can be any value. For values less than or equal to -180.0 or values
     * greater than 180.0, the value may be wrapped and stored appropriately before it is used. For example, a longitude of
     * 183.0 degrees would become -177.0 degrees.
     * @type {Float}
     */
    Longitude {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The altitude of the geographic position in meters.
     * 
     * > [!NOTE]
     * > This field affects location only when you set the altitude reference system for the class created from this
     * > `BasicGeoposition`. For example, configure the [AltitudeReferenceSystem](geopoint_altitudereferencesystem.md)
     * > property on a [Geopoint](geopoint.md) before using it.
     * @type {Float}
     */
    Altitude {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }
}
