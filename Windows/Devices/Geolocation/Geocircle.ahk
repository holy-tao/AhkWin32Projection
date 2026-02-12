#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeocircle.ahk
#Include .\IGeoshape.ahk
#Include .\IGeocircleFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a geographic circle with a center point and a radius.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geocircle extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeocircle

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeocircle.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a geographic circle object for the given position and radius.
     * @remarks
     * The constructor will throw an exception if the provided [BasicGeoposition](basicgeoposition.md) has a latitude is less than -90 or greater than 90 or if the supplied [Radius](geocircle_radius.md) is outside of the allowed range.
     * @param {BasicGeoposition} position The geographic position of the new circle.
     * @param {Float} radius The radius of the new circle, in meters.
     * @returns {Geocircle} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.#ctor
     */
    static Create(position, radius) {
        if (!Geocircle.HasProp("__IGeocircleFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geocircle")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeocircleFactory.IID)
            Geocircle.__IGeocircleFactory := IGeocircleFactory(factoryPtr)
        }

        return Geocircle.__IGeocircleFactory.Create(position, radius)
    }

    /**
     * Create a geographic circle object for the given position, radius and altitude reference system.
     * @param {BasicGeoposition} position The geographic position of the new circle.
     * @param {Float} radius The radius of the new circle, in meters.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system of the new circle.
     * @returns {Geocircle} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.#ctor
     */
    static CreateWithAltitudeReferenceSystem(position, radius, altitudeReferenceSystem_) {
        if (!Geocircle.HasProp("__IGeocircleFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geocircle")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeocircleFactory.IID)
            Geocircle.__IGeocircleFactory := IGeocircleFactory(factoryPtr)
        }

        return Geocircle.__IGeocircleFactory.CreateWithAltitudeReferenceSystem(position, radius, altitudeReferenceSystem_)
    }

    /**
     * Create a geographic circle object for the given position, radius, altitude reference system, and spatial reference id.
     * @param {BasicGeoposition} position The geographic position of the new circle.
     * @param {Float} radius The radius of the new circle, in meters.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system of the new circle.
     * @param {Integer} spatialReferenceId The spatial reference Id of the new circle.
     * @returns {Geocircle} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.#ctor
     */
    static CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, radius, altitudeReferenceSystem_, spatialReferenceId) {
        if (!Geocircle.HasProp("__IGeocircleFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geocircle")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeocircleFactory.IID)
            Geocircle.__IGeocircleFactory := IGeocircleFactory(factoryPtr)
        }

        return Geocircle.__IGeocircleFactory.CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, radius, altitudeReferenceSystem_, spatialReferenceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The center point of a geographic circle.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.center
     * @type {BasicGeoposition} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * The radius of a geographic circle in meters.
     * @remarks
     * The valid range of radius values is from .1 to 10018754.3 meters. 10018754.3 meters is one quarter of the earth’s circumference.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.radius
     * @type {Float} 
     */
    Radius {
        get => this.get_Radius()
    }

    /**
     * The type of geographic shape.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.geoshapetype
     * @type {Integer} 
     */
    GeoshapeType {
        get => this.get_GeoshapeType()
    }

    /**
     * The spatial reference identifier for the geographic circle, corresponding to a spatial reference system based on the specific ellipsoid used for either flat-earth mapping or round-earth mapping.
     * @remarks
     * The spatial reference id (SRID) corresponds to a spatial reference system based on the specific ellipsoid used for either flat-earth mapping or round-earth mapping. Spatial instances with the same SRID can be used when performing operations with spatial data methods on your data. The result of any spatial method derived from two spatial data instances is valid only if those instances have the same SRID that is based on the same unit of measurement, datum, and projection used to determine the coordinates of the instances. The most common units of measurement of a SRID are meters or square meters. The default SRID for the Windows platform is 4326 which is WGS84 ellipsoid.
     * 
     * The spatial reference identification system is defined by the [European Petroleum Survey Group (EPSG)](https://epsg.org/) standard, which is a set of standards developed for cartography, surveying, and geodetic data storage. This standard is owned by the Oil and Gas Producers (OGP) Surveying and Positioning Committee.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.spatialreferenceid
     * @type {Integer} 
     */
    SpatialReferenceId {
        get => this.get_SpatialReferenceId()
    }

    /**
     * The altitude reference system of the geographic circle.
     * @remarks
     * Windows supports the `Ellipsoid` altitude reference system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocircle.altitudereferencesystem
     * @type {Integer} 
     */
    AltitudeReferenceSystem {
        get => this.get_AltitudeReferenceSystem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_Center() {
        if (!this.HasProp("__IGeocircle")) {
            if ((queryResult := this.QueryInterface(IGeocircle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocircle := IGeocircle(outPtr)
        }

        return this.__IGeocircle.get_Center()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Radius() {
        if (!this.HasProp("__IGeocircle")) {
            if ((queryResult := this.QueryInterface(IGeocircle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocircle := IGeocircle(outPtr)
        }

        return this.__IGeocircle.get_Radius()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeoshapeType() {
        if (!this.HasProp("__IGeoshape")) {
            if ((queryResult := this.QueryInterface(IGeoshape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoshape := IGeoshape(outPtr)
        }

        return this.__IGeoshape.get_GeoshapeType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SpatialReferenceId() {
        if (!this.HasProp("__IGeoshape")) {
            if ((queryResult := this.QueryInterface(IGeoshape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoshape := IGeoshape(outPtr)
        }

        return this.__IGeoshape.get_SpatialReferenceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AltitudeReferenceSystem() {
        if (!this.HasProp("__IGeoshape")) {
            if ((queryResult := this.QueryInterface(IGeoshape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoshape := IGeoshape(outPtr)
        }

        return this.__IGeoshape.get_AltitudeReferenceSystem()
    }

;@endregion Instance Methods
}
