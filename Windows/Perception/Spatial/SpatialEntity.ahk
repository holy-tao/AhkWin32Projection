#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialEntity.ahk
#Include .\ISpatialEntityFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a physical location in the user's surroundings and its metadata, which an app intends to share with other devices.
 * @remarks
 * > [!IMPORTANT]
 * > The [SpatialEntityStore](spatialentitystore.md) approach of synchronizing spatial anchors between devices is not currently supported.  Consider using [Azure Spatial Anchors](/azure/spatial-anchors) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentity
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialEntity extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialEntity.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new spatial entity to share the provided spatial anchor.
     * @param {SpatialAnchor} spatialAnchor_ The spatial anchor to share.
     * @returns {SpatialEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentity.#ctor
     */
    static CreateWithSpatialAnchor(spatialAnchor_) {
        if (!SpatialEntity.HasProp("__ISpatialEntityFactory")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialEntity")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialEntityFactory.IID)
            SpatialEntity.__ISpatialEntityFactory := ISpatialEntityFactory(factoryPtr)
        }

        return SpatialEntity.__ISpatialEntityFactory.CreateWithSpatialAnchor(spatialAnchor_)
    }

    /**
     * Creates a new spatial entity to share the provided spatial anchor and metadata.
     * @param {SpatialAnchor} spatialAnchor_ The spatial anchor to share.
     * @param {ValueSet} propertySet_ The metadata to share for this anchor.
     * @returns {SpatialEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentity.#ctor
     */
    static CreateWithSpatialAnchorAndProperties(spatialAnchor_, propertySet_) {
        if (!SpatialEntity.HasProp("__ISpatialEntityFactory")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialEntity")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialEntityFactory.IID)
            SpatialEntity.__ISpatialEntityFactory := ISpatialEntityFactory(factoryPtr)
        }

        return SpatialEntity.__ISpatialEntityFactory.CreateWithSpatialAnchorAndProperties(spatialAnchor_, propertySet_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the globally-unique ID for this spatial entity.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentity.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the spatial anchor representing the shared location in the user's surroundings.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentity.anchor
     * @type {SpatialAnchor} 
     */
    Anchor {
        get => this.get_Anchor()
    }

    /**
     * Gets the key/value store of metadata for this spatial entity.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentity.properties
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISpatialEntity")) {
            if ((queryResult := this.QueryInterface(ISpatialEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntity := ISpatialEntity(outPtr)
        }

        return this.__ISpatialEntity.get_Id()
    }

    /**
     * 
     * @returns {SpatialAnchor} 
     */
    get_Anchor() {
        if (!this.HasProp("__ISpatialEntity")) {
            if ((queryResult := this.QueryInterface(ISpatialEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntity := ISpatialEntity(outPtr)
        }

        return this.__ISpatialEntity.get_Anchor()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        if (!this.HasProp("__ISpatialEntity")) {
            if ((queryResult := this.QueryInterface(ISpatialEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntity := ISpatialEntity(outPtr)
        }

        return this.__ISpatialEntity.get_Properties()
    }

;@endregion Instance Methods
}
