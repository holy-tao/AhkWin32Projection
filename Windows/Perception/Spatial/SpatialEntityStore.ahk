#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialEntityStore.ahk
#Include .\ISpatialEntityStoreStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a shared pool of spatial entities, synchronized automatically among the participants in a remote session.
 * @remarks
 * > [!IMPORTANT]
 * > The **SpatialEntityStore** approach of synchronizing spatial anchors between devices is not currently supported.  Consider using [Azure Spatial Anchors](/azure/spatial-anchors) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitystore
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialEntityStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialEntityStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialEntityStore.IID

    /**
     * Gets whether spatial entity sharing is supported on this system.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitystore.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => SpatialEntityStore.get_IsSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!SpatialEntityStore.HasProp("__ISpatialEntityStoreStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialEntityStore")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialEntityStoreStatics.IID)
            SpatialEntityStore.__ISpatialEntityStoreStatics := ISpatialEntityStoreStatics(factoryPtr)
        }

        return SpatialEntityStore.__ISpatialEntityStoreStatics.get_IsSupported()
    }

    /**
     * Establishes or retrieves an automatically-synchronized pool of spatial entities for a remote session.
     * @param {RemoteSystemSession} session The remote session with the participants that will share spatial entities.
     * @returns {SpatialEntityStore} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitystore.tryget
     */
    static TryGetForRemoteSystemSession(session) {
        if (!SpatialEntityStore.HasProp("__ISpatialEntityStoreStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialEntityStore")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialEntityStoreStatics.IID)
            SpatialEntityStore.__ISpatialEntityStoreStatics := ISpatialEntityStoreStatics(factoryPtr)
        }

        return SpatialEntityStore.__ISpatialEntityStoreStatics.TryGetForRemoteSystemSession(session)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Saves a new or updated spatial entity into the store, to be synchronized with all participants.
     * @param {SpatialEntity} entity The new or updated spatial entity.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitystore.saveasync
     */
    SaveAsync(entity) {
        if (!this.HasProp("__ISpatialEntityStore")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityStore := ISpatialEntityStore(outPtr)
        }

        return this.__ISpatialEntityStore.SaveAsync(entity)
    }

    /**
     * Removes a spatial entity from the store for all participants.
     * @param {SpatialEntity} entity The spatial entity to remove.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitystore.removeasync
     */
    RemoveAsync(entity) {
        if (!this.HasProp("__ISpatialEntityStore")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityStore := ISpatialEntityStore(outPtr)
        }

        return this.__ISpatialEntityStore.RemoveAsync(entity)
    }

    /**
     * Gets a watcher that lets an app observe when participants add, update or remove entities in the store.
     * @returns {SpatialEntityWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitystore.createentitywatcher
     */
    CreateEntityWatcher() {
        if (!this.HasProp("__ISpatialEntityStore")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityStore := ISpatialEntityStore(outPtr)
        }

        return this.__ISpatialEntityStore.CreateEntityWatcher()
    }

;@endregion Instance Methods
}
