#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeocoordinate.ahk
#Include .\IGeocoordinateWithPositionData.ahk
#Include .\IGeocoordinateWithPoint.ahk
#Include .\IGeocoordinateWithPositionSourceTimestamp.ahk
#Include .\IGeocoordinateWithRemoteSource.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the information for identifying a geographic location.
 * @remarks
 * The [Geocoordinate](geocoordinate.md) class represents a geographic location with associated metadata about accuracy,
 * positioning method, and optional movement data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geocoordinate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeocoordinate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeocoordinate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The latitude in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.latitude
     * @type {Float} 
     */
    Latitude {
        get => this.get_Latitude()
    }

    /**
     * The longitude in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.longitude
     * @type {Float} 
     */
    Longitude {
        get => this.get_Longitude()
    }

    /**
     * The altitude of the location, in meters.
     * @remarks
     * This optional property will be set if it is available. If the property is not available, the value will be `null` or `NaN` (depending on the operating system version). We recommend that your app checks for both of these possibilities.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.altitude
     * @type {IReference<Float>} 
     */
    Altitude {
        get => this.get_Altitude()
    }

    /**
     * The accuracy of the location in meters.
     * @remarks
     * Location services accuracy depends on the location data available. For example, if Wi-Fi is available, data is accurate to within 50 meters. If Wi-Fi is not available, the data could be accurate to within 10 miles or larger.
     * 
     * A GNSS device can provide data accurate to within a few meters. However, its accuracy can vary if the GNSS sensor is obscured by buildings, trees, or cloud cover. GNSS data may not be available at all within a building.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.accuracy
     * @type {Float} 
     */
    Accuracy {
        get => this.get_Accuracy()
    }

    /**
     * The accuracy of the altitude, in meters.
     * @remarks
     * This optional property will be set if it is available. If the property is not available, the value will be `null`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.altitudeaccuracy
     * @type {IReference<Float>} 
     */
    AltitudeAccuracy {
        get => this.get_AltitudeAccuracy()
    }

    /**
     * The current heading in degrees relative to true north.
     * @remarks
     * This optional property will be set if it is available. If the property is not available, the value will be `null` or `NaN` (depending on the operating system version). We recommend that your app checks for both of these possibilities.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.heading
     * @type {IReference<Float>} 
     */
    Heading {
        get => this.get_Heading()
    }

    /**
     * The speed in meters per second.
     * @remarks
     * This optional property will be set if it is available. If the property is not available, the value will be `null` or `NaN` (depending on the operating system version). We recommend that your app checks for both of these possibilities.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.speed
     * @type {IReference<Float>} 
     */
    Speed {
        get => this.get_Speed()
    }

    /**
     * The system time at which the location was determined.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the source used to obtain a Geocoordinate.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.positionsource
     * @type {Integer} 
     */
    PositionSource {
        get => this.get_PositionSource()
    }

    /**
     * Gets information about the satellites used to obtain a Geocoordinate.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.satellitedata
     * @type {GeocoordinateSatelliteData} 
     */
    SatelliteData {
        get => this.get_SatelliteData()
    }

    /**
     * The location of the [Geocoordinate.](geocoordinate.md)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.point
     * @type {Geopoint} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * Gets the time at which the associated [Geocoordinate](geocoordinate.md) position was calculated.
     * @remarks
     * When this property is not available, the value will be `null`.
     * 
     * The timestamp returned by this property depends on how the location was obtained and may be completely unrelated to
     * the system time on the device. For example, if the position is obtained from the Global Navigation Satellite System
     * (GNSS) the timestamp would be obtained from the satellites. If the position is obtained from Secure User Plane
     * Location (SUPL), the timestamp would be obtained from SUPL servers. This means that the timestamps obtained from these
     * services will be precise and, most importantly, consistent across all devices regardless of whether the system time
     * on the devices is set correctly.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.positionsourcetimestamp
     * @type {IReference<DateTime>} 
     */
    PositionSourceTimestamp {
        get => this.get_PositionSourceTimestamp()
    }

    /**
     * Gets a value that indicates whether the current location reported by this [Geocoordinate](geocoordinate.md) object is
     * being redirected to a remote physical location.
     * @remarks
     * In some scenarios, such as remote desktop sessions, the physical location of the current device does not represent the
     * user's actual location. In these scenarios, Windows can redirect the user's location to a remote computer that is used
     * as the main source for positioning. Use this property to determine whether the user's location is being redirected to a
     * remote computer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinate.isremotesource
     * @type {Boolean} 
     */
    IsRemoteSource {
        get => this.get_IsRemoteSource()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Latitude() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Latitude()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Longitude() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Longitude()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Altitude() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Altitude()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Accuracy() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Accuracy()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_AltitudeAccuracy() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_AltitudeAccuracy()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Heading() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Heading()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Speed() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Speed()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IGeocoordinate")) {
            if ((queryResult := this.QueryInterface(IGeocoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinate := IGeocoordinate(outPtr)
        }

        return this.__IGeocoordinate.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionSource() {
        if (!this.HasProp("__IGeocoordinateWithPositionData")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateWithPositionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateWithPositionData := IGeocoordinateWithPositionData(outPtr)
        }

        return this.__IGeocoordinateWithPositionData.get_PositionSource()
    }

    /**
     * 
     * @returns {GeocoordinateSatelliteData} 
     */
    get_SatelliteData() {
        if (!this.HasProp("__IGeocoordinateWithPositionData")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateWithPositionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateWithPositionData := IGeocoordinateWithPositionData(outPtr)
        }

        return this.__IGeocoordinateWithPositionData.get_SatelliteData()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Point() {
        if (!this.HasProp("__IGeocoordinateWithPoint")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateWithPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateWithPoint := IGeocoordinateWithPoint(outPtr)
        }

        return this.__IGeocoordinateWithPoint.get_Point()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_PositionSourceTimestamp() {
        if (!this.HasProp("__IGeocoordinateWithPositionSourceTimestamp")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateWithPositionSourceTimestamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateWithPositionSourceTimestamp := IGeocoordinateWithPositionSourceTimestamp(outPtr)
        }

        return this.__IGeocoordinateWithPositionSourceTimestamp.get_PositionSourceTimestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemoteSource() {
        if (!this.HasProp("__IGeocoordinateWithRemoteSource")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateWithRemoteSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateWithRemoteSource := IGeocoordinateWithRemoteSource(outPtr)
        }

        return this.__IGeocoordinateWithRemoteSource.get_IsRemoteSource()
    }

;@endregion Instance Methods
}
