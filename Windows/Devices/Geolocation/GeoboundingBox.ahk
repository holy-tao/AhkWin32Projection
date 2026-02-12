#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeoboundingBox.ahk
#Include .\IGeoshape.ahk
#Include .\IGeoboundingBoxStatics.ahk
#Include .\IGeoboundingBoxFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a rectangle that defines a geographic area.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeoboundingBox extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeoboundingBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeoboundingBox.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Calculates a [GeoboundingBox](geoboundingbox.md) that contains the specified set of geographic positions and uses the specified altitude reference system.
     * @param {IIterable<BasicGeoposition>} positions A collection of geographic positions to include inside the [GeoboundingBox](geoboundingbox.md).
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.trycompute
     */
    static TryCompute(positions) {
        if (!GeoboundingBox.HasProp("__IGeoboundingBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeoboundingBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeoboundingBoxStatics.IID)
            GeoboundingBox.__IGeoboundingBoxStatics := IGeoboundingBoxStatics(factoryPtr)
        }

        return GeoboundingBox.__IGeoboundingBoxStatics.TryCompute(positions)
    }

    /**
     * Calculates a [GeoboundingBox](geoboundingbox.md) that contains the specified set of geographic positions and uses the specified altitude reference system and spatial reference ID (SRID).
     * @param {IIterable<BasicGeoposition>} positions A collection of geographic positions to include inside the [GeoboundingBox](geoboundingbox.md).
     * @param {Integer} altitudeRefSystem The altitude reference system to use for the [GeoboundingBox](geoboundingbox.md). For more info, see the [AltitudeReferenceSystem](geoboundingbox_altitudereferencesystem.md) property.
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.trycompute
     */
    static TryComputeWithAltitudeReference(positions, altitudeRefSystem) {
        if (!GeoboundingBox.HasProp("__IGeoboundingBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeoboundingBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeoboundingBoxStatics.IID)
            GeoboundingBox.__IGeoboundingBoxStatics := IGeoboundingBoxStatics(factoryPtr)
        }

        return GeoboundingBox.__IGeoboundingBoxStatics.TryComputeWithAltitudeReference(positions, altitudeRefSystem)
    }

    /**
     * Calculates a [GeoboundingBox](geoboundingbox.md) that contains the specified set of geographic positions.
     * @param {IIterable<BasicGeoposition>} positions A collection of geographic positions to include inside the [GeoboundingBox](geoboundingbox.md).
     * @param {Integer} altitudeRefSystem 
     * @param {Integer} spatialReferenceId 
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.trycompute
     */
    static TryComputeWithAltitudeReferenceAndSpatialReference(positions, altitudeRefSystem, spatialReferenceId) {
        if (!GeoboundingBox.HasProp("__IGeoboundingBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeoboundingBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeoboundingBoxStatics.IID)
            GeoboundingBox.__IGeoboundingBoxStatics := IGeoboundingBoxStatics(factoryPtr)
        }

        return GeoboundingBox.__IGeoboundingBoxStatics.TryComputeWithAltitudeReferenceAndSpatialReference(positions, altitudeRefSystem, spatialReferenceId)
    }

    /**
     * Initializes a new instance of the [GeoboundingBox](geoboundingbox.md) class that has the specified corners.
     * @param {BasicGeoposition} northwestCorner The northwest corner to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [NorthwestCorner](geoboundingbox_northwestcorner.md) property.
     * @param {BasicGeoposition} southeastCorner The southeast corner to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [SoutheastCorner](geoboundingbox_southeastcorner.md) property.
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.#ctor
     */
    static Create(northwestCorner, southeastCorner) {
        if (!GeoboundingBox.HasProp("__IGeoboundingBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeoboundingBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeoboundingBoxFactory.IID)
            GeoboundingBox.__IGeoboundingBoxFactory := IGeoboundingBoxFactory(factoryPtr)
        }

        return GeoboundingBox.__IGeoboundingBoxFactory.Create(northwestCorner, southeastCorner)
    }

    /**
     * Initializes a new instance of the [GeoboundingBox](geoboundingbox.md) class that has the specified corners and uses the specified altitude reference system.
     * @param {BasicGeoposition} northwestCorner The northwest corner to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [NorthwestCorner](geoboundingbox_northwestcorner.md) property.
     * @param {BasicGeoposition} southeastCorner The southeast corner to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [SoutheastCorner](geoboundingbox_southeastcorner.md) property.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [AltitudeReferenceSystem](geoboundingbox_altitudereferencesystem.md) property.
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.#ctor
     */
    static CreateWithAltitudeReference(northwestCorner, southeastCorner, altitudeReferenceSystem_) {
        if (!GeoboundingBox.HasProp("__IGeoboundingBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeoboundingBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeoboundingBoxFactory.IID)
            GeoboundingBox.__IGeoboundingBoxFactory := IGeoboundingBoxFactory(factoryPtr)
        }

        return GeoboundingBox.__IGeoboundingBoxFactory.CreateWithAltitudeReference(northwestCorner, southeastCorner, altitudeReferenceSystem_)
    }

    /**
     * Initializes a new instance of the [GeoboundingBox](geoboundingbox.md) class that has the specified corners and uses the specified altitude reference system and spatial reference ID (SRID).
     * @param {BasicGeoposition} northwestCorner The northwest corner to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [NorthwestCorner](geoboundingbox_northwestcorner.md) property.
     * @param {BasicGeoposition} southeastCorner The southeast corner to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [SoutheastCorner](geoboundingbox_southeastcorner.md) property.
     * @param {Integer} altitudeReferenceSystem_ The altitude reference system to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [AltitudeReferenceSystem](geoboundingbox_altitudereferencesystem.md) property.
     * @param {Integer} spatialReferenceId The spatial reference ID (SRID) to use for the new [GeoboundingBox](geoboundingbox.md). For more info, see the [SpatialReferenceId](geoboundingbox_spatialreferenceid.md) property.
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.#ctor
     */
    static CreateWithAltitudeReferenceAndSpatialReference(northwestCorner, southeastCorner, altitudeReferenceSystem_, spatialReferenceId) {
        if (!GeoboundingBox.HasProp("__IGeoboundingBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeoboundingBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeoboundingBoxFactory.IID)
            GeoboundingBox.__IGeoboundingBoxFactory := IGeoboundingBoxFactory(factoryPtr)
        }

        return GeoboundingBox.__IGeoboundingBoxFactory.CreateWithAltitudeReferenceAndSpatialReference(northwestCorner, southeastCorner, altitudeReferenceSystem_, spatialReferenceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the northwest corner of the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.northwestcorner
     * @type {BasicGeoposition} 
     */
    NorthwestCorner {
        get => this.get_NorthwestCorner()
    }

    /**
     * Gets the southeast corner of the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.southeastcorner
     * @type {BasicGeoposition} 
     */
    SoutheastCorner {
        get => this.get_SoutheastCorner()
    }

    /**
     * Gets the center of the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.center
     * @type {BasicGeoposition} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * Gets the altitude of the lowest corner of the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.minaltitude
     * @type {Float} 
     */
    MinAltitude {
        get => this.get_MinAltitude()
    }

    /**
     * Gets the altitude of the highest corner of the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.maxaltitude
     * @type {Float} 
     */
    MaxAltitude {
        get => this.get_MaxAltitude()
    }

    /**
     * Gets the type of geographic shape represented by the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.geoshapetype
     * @type {Integer} 
     */
    GeoshapeType {
        get => this.get_GeoshapeType()
    }

    /**
     * Gets the spatial reference ID (SRID) used by the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.spatialreferenceid
     * @type {Integer} 
     */
    SpatialReferenceId {
        get => this.get_SpatialReferenceId()
    }

    /**
     * Gets the altitude reference system used by the [GeoboundingBox](geoboundingbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoboundingbox.altitudereferencesystem
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
    get_NorthwestCorner() {
        if (!this.HasProp("__IGeoboundingBox")) {
            if ((queryResult := this.QueryInterface(IGeoboundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoboundingBox := IGeoboundingBox(outPtr)
        }

        return this.__IGeoboundingBox.get_NorthwestCorner()
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_SoutheastCorner() {
        if (!this.HasProp("__IGeoboundingBox")) {
            if ((queryResult := this.QueryInterface(IGeoboundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoboundingBox := IGeoboundingBox(outPtr)
        }

        return this.__IGeoboundingBox.get_SoutheastCorner()
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_Center() {
        if (!this.HasProp("__IGeoboundingBox")) {
            if ((queryResult := this.QueryInterface(IGeoboundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoboundingBox := IGeoboundingBox(outPtr)
        }

        return this.__IGeoboundingBox.get_Center()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinAltitude() {
        if (!this.HasProp("__IGeoboundingBox")) {
            if ((queryResult := this.QueryInterface(IGeoboundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoboundingBox := IGeoboundingBox(outPtr)
        }

        return this.__IGeoboundingBox.get_MinAltitude()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAltitude() {
        if (!this.HasProp("__IGeoboundingBox")) {
            if ((queryResult := this.QueryInterface(IGeoboundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoboundingBox := IGeoboundingBox(outPtr)
        }

        return this.__IGeoboundingBox.get_MaxAltitude()
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
