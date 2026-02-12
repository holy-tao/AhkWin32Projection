#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeopoint.ahk
#Include .\IGeoshape.ahk
#Include .\IGeopointFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a geographic point.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geopoint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeopoint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeopoint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a geographic point object for the given position.
     * @remarks
     * The constructor will throw an exception if the provided [BasicGeoposition](basicgeoposition.md) has a latitude is less than -90 or greater than 90.
     * @param {BasicGeoposition} position Create a geographic point object for the given position.
     * @returns {Geopoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.#ctor
     */
    static Create(position) {
        if (!Geopoint.HasProp("__IGeopointFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geopoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeopointFactory.IID)
            Geopoint.__IGeopointFactory := IGeopointFactory(factoryPtr)
        }

        return Geopoint.__IGeopointFactory.Create(position)
    }

    /**
     * Create a geographic point object for the given position and altitude reference system.
     * @param {BasicGeoposition} position Create a geographic point object for the given position.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system of the new point.
     * @returns {Geopoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.#ctor
     */
    static CreateWithAltitudeReferenceSystem(position, altitudeReferenceSystem_) {
        if (!Geopoint.HasProp("__IGeopointFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geopoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeopointFactory.IID)
            Geopoint.__IGeopointFactory := IGeopointFactory(factoryPtr)
        }

        return Geopoint.__IGeopointFactory.CreateWithAltitudeReferenceSystem(position, altitudeReferenceSystem_)
    }

    /**
     * Create a geographic point object for the given position, altitude reference system, and spatial reference Id.
     * @param {BasicGeoposition} position Create a geographic point object for the given position.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system of the new point.
     * @param {Integer} spatialReferenceId The spatial reference Id of the new point.
     * @returns {Geopoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.#ctor
     */
    static CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, altitudeReferenceSystem_, spatialReferenceId) {
        if (!Geopoint.HasProp("__IGeopointFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geopoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeopointFactory.IID)
            Geopoint.__IGeopointFactory := IGeopointFactory(factoryPtr)
        }

        return Geopoint.__IGeopointFactory.CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, altitudeReferenceSystem_, spatialReferenceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The position of a geographic point.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.position
     * @type {BasicGeoposition} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The type of geographic shape.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.geoshapetype
     * @type {Integer} 
     */
    GeoshapeType {
        get => this.get_GeoshapeType()
    }

    /**
     * The spatial reference identifier for the geographic point, corresponding to a spatial reference system based on the
     * specific ellipsoid used for either flat-earth mapping or round-earth mapping.
     * @remarks
     * The spatial reference id (SRID) corresponds to a spatial reference system based on the specific ellipsoid used for either
     * flat-earth mapping or round-earth mapping. Spatial instances with the same SRID can be used when performing operations
     * with spatial data methods on your data. The result of any spatial method derived from two spatial data instances is valid
     * only if those instances have the same SRID that is based on the same unit of measurement, datum, and projection used to
     * determine the coordinates of the instances. The most common units of measurement of a SRID are meters or square meters.
     * The default SRID for the Windows platform is 4326 which is WGS84 ellipsoid.
     * 
     * The spatial reference identification system is defined by the [European Petroleum Survey Group (EPSG)](https://epsg.org/)
     * standard, which is a set of standards developed for cartography, surveying, and geodetic data storage. This standard is
     * owned by the Oil and Gas Producers (OGP) Surveying and Positioning Committee.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.spatialreferenceid
     * @type {Integer} 
     */
    SpatialReferenceId {
        get => this.get_SpatialReferenceId()
    }

    /**
     * The altitude reference system of the geographic point. GeoPoint will default to a value of unspecified when constructed without an altitude reference system. The behavior of an unspecified altitude reference system will depend on the API. A [MapIcon](/uwp/api/Windows.UI.Xaml.Controls.Maps.MapIcon) will treat an unspecified reference system as Surface with an altitude value of 0 and the supplied value for altitude will be ignored.
     * @remarks
     * > [!NOTE]
     * > The default [altitude reference system](altitudereferencesystem.md) used to provide location data depends on the GNSS hardware. Most hardware returns coordinates using the `Geoid` reference system. To find out which one is being used by a [Geopoint](geopoint.md), see the `AltitudeReferenceSystem` property. The `Geoid` reference system may not be what you want depending on your application. For example, if passing the coordinates to a map control, you may instead want to snap the coordinate to the terrain.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopoint.altitudereferencesystem
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
    get_Position() {
        if (!this.HasProp("__IGeopoint")) {
            if ((queryResult := this.QueryInterface(IGeopoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeopoint := IGeopoint(outPtr)
        }

        return this.__IGeopoint.get_Position()
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
