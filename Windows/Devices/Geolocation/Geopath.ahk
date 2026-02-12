#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeopath.ahk
#Include .\IGeoshape.ahk
#Include .\IGeopathFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an ordered series of geographic points.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geopath extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeopath

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeopath.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [Geopath](geopath.md) class with the specified collection of positions.
     * @param {IIterable<BasicGeoposition>} positions The collection of positions to use to create the new [Geopath](geopath.md). For more info, see the [Positions](geopath_positions.md) property.
     * @returns {Geopath} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.#ctor
     */
    static Create(positions) {
        if (!Geopath.HasProp("__IGeopathFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geopath")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeopathFactory.IID)
            Geopath.__IGeopathFactory := IGeopathFactory(factoryPtr)
        }

        return Geopath.__IGeopathFactory.Create(positions)
    }

    /**
     * Initializes a new instance of the [Geopath](geopath.md) class with the specified collection of positions and with the specified altitude reference system.
     * @param {IIterable<BasicGeoposition>} positions The collection of positions to use to create the new [Geopath](geopath.md). For more info, see the [Positions](geopath_positions.md) property.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system to use to create the new [Geopath](geopath.md). For more info, see the [AltitudeReferenceSystem](geopath_altitudereferencesystem.md) property.
     * @returns {Geopath} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.#ctor
     */
    static CreateWithAltitudeReference(positions, altitudeReferenceSystem_) {
        if (!Geopath.HasProp("__IGeopathFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geopath")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeopathFactory.IID)
            Geopath.__IGeopathFactory := IGeopathFactory(factoryPtr)
        }

        return Geopath.__IGeopathFactory.CreateWithAltitudeReference(positions, altitudeReferenceSystem_)
    }

    /**
     * Initializes a new instance of the [Geopath](geopath.md) class with the specified collection of positions and with the specified altitude reference system and spatial reference ID (SRID).
     * @param {IIterable<BasicGeoposition>} positions The collection of positions to use to create the new [Geopath](geopath.md). For more info, see the [Positions](geopath_positions.md) property.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system to use to create the new [Geopath](geopath.md). For more info, see the [AltitudeReferenceSystem](geopath_altitudereferencesystem.md) property.
     * @param {Integer} spatialReferenceId The spatial reference ID (SRID) to use to create the new [Geopath](geopath.md). For more info, see the [SpatialReferenceId](geopath_spatialreferenceid.md) property.
     * @returns {Geopath} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.#ctor
     */
    static CreateWithAltitudeReferenceAndSpatialReference(positions, altitudeReferenceSystem_, spatialReferenceId) {
        if (!Geopath.HasProp("__IGeopathFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geopath")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeopathFactory.IID)
            Geopath.__IGeopathFactory := IGeopathFactory(factoryPtr)
        }

        return Geopath.__IGeopathFactory.CreateWithAltitudeReferenceAndSpatialReference(positions, altitudeReferenceSystem_, spatialReferenceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of geographic points that define the [Geopath](geopath.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.positions
     * @type {IVectorView<BasicGeoposition>} 
     */
    Positions {
        get => this.get_Positions()
    }

    /**
     * Gets the type of geographic shape represented by the [Geopath](geopath.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.geoshapetype
     * @type {Integer} 
     */
    GeoshapeType {
        get => this.get_GeoshapeType()
    }

    /**
     * Gets the spatial reference ID (SRID) used by the [Geopath](geopath.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.spatialreferenceid
     * @type {Integer} 
     */
    SpatialReferenceId {
        get => this.get_SpatialReferenceId()
    }

    /**
     * Gets the altitude reference system used by the [Geopath](geopath.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geopath.altitudereferencesystem
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
     * @returns {IVectorView<BasicGeoposition>} 
     */
    get_Positions() {
        if (!this.HasProp("__IGeopath")) {
            if ((queryResult := this.QueryInterface(IGeopath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeopath := IGeopath(outPtr)
        }

        return this.__IGeopath.get_Positions()
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
