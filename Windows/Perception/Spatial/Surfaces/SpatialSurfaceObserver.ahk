#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialSurfaceObserver.ahk
#Include .\ISpatialSurfaceObserverStatics.ahk
#Include .\ISpatialSurfaceObserverStatics2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialSurfaceObserver.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods for observing surfaces in the user's surroundings.
 * @remarks
 * Spatial mapping lets your app understand the shape and location of the surfaces in the user's surroundings.
 * 
 * Through the sensors on a device like HoloLens, Windows generates 3D triangle meshes of surfaces in large cube-shaped volumes. Over time, as Windows improves its understanding of your surroundings, new surface volumes are generated and existing volumes are updated with new mesh. Sometimes, surface volumes can be destroyed as well, when the system is running low on storage.
 * 
 * You access these surfaces by expressing interest in a volume of space, either a bounding box, bounding frustum, or bounding sphere. Windows updates you to let you know when the set of surfaces in that observed volume has changed, with each surface volume identified by an id and the time of its last update. By reasoning about changes to this set of observed surface metadata, you can detect new mesh, updated mesh, and removed mesh over time.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class SpatialSurfaceObserver extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialSurfaceObserver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialSurfaceObserver.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Requests access for an app to use spatial mapping. This requires the spatialPerception capability.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!SpatialSurfaceObserver.HasProp("__ISpatialSurfaceObserverStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialSurfaceObserverStatics.IID)
            SpatialSurfaceObserver.__ISpatialSurfaceObserverStatics := ISpatialSurfaceObserverStatics(factoryPtr)
        }

        return SpatialSurfaceObserver.__ISpatialSurfaceObserverStatics.RequestAccessAsync()
    }

    /**
     * Gets whether spatial mapping is supported on the current system.
     * @remarks
     * This returns true on HoloLens and false elsewhere.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver.issupported
     */
    static IsSupported() {
        if (!SpatialSurfaceObserver.HasProp("__ISpatialSurfaceObserverStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialSurfaceObserverStatics2.IID)
            SpatialSurfaceObserver.__ISpatialSurfaceObserverStatics2 := ISpatialSurfaceObserverStatics2(factoryPtr)
        }

        return SpatialSurfaceObserver.__ISpatialSurfaceObserverStatics2.IsSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Initializes a new instance of the [SpatialSurfaceObserver](spatialsurfaceobserver.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnObservedSurfacesChangedToken")) {
            this.remove_ObservedSurfacesChanged(this.__OnObservedSurfacesChangedToken)
            this.__OnObservedSurfacesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets metadata for the set of surfaces observed within the bounding volume at the moment.
     * @remarks
     * Each [SpatialSurfaceInfo](spatialsurfaceinfo.md) snapshot is immutable, so you can compare their values later to see if a given surface has recently experienced a mesh update.
     * 
     * Correlating the [Id](spatialsurfaceinfo_id.md) and [UpdateTime](spatialsurfaceinfo_updatetime.md) properties across multiple observations lets you identify new mesh, updated mesh and removed mesh:
     * * If you see a SpatialSurfaceInfo with an Id you haven't seen before, treat it as new mesh.
     * * If you see a SpatialSurfaceInfo with a known Id, but with a new UpdateTime, treat it as updated mesh.
     * * If you no longer see a SpatialSurfaceInfo with a known Id, treat it as removed mesh.
     * @returns {IMapView<Guid, SpatialSurfaceInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver.getobservedsurfaces
     */
    GetObservedSurfaces() {
        if (!this.HasProp("__ISpatialSurfaceObserver")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceObserver := ISpatialSurfaceObserver(outPtr)
        }

        return this.__ISpatialSurfaceObserver.GetObservedSurfaces()
    }

    /**
     * Sets the single bounding volume that this observer will track for new, updated or removed surfaces.
     * @remarks
     * When the set of surface metadata within this bounding volume changes, the [ObservedSurfacesChanged](spatialsurfaceobserver_observedsurfaceschanged.md) event will fire.
     * @param {SpatialBoundingVolume} bounds The new bounding volume for this observer to track for surface updates.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver.setboundingvolume
     */
    SetBoundingVolume(bounds) {
        if (!this.HasProp("__ISpatialSurfaceObserver")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceObserver := ISpatialSurfaceObserver(outPtr)
        }

        return this.__ISpatialSurfaceObserver.SetBoundingVolume(bounds)
    }

    /**
     * Sets the list of bounding volumes that this observer will track for new, updated or removed surfaces.
     * @remarks
     * When the set of surface metadata within these bounding volumes changes, the [ObservedSurfacesChanged](spatialsurfaceobserver_observedsurfaceschanged.md) event will fire.
     * @param {IIterable<SpatialBoundingVolume>} bounds The bounding volumes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver.setboundingvolumes
     */
    SetBoundingVolumes(bounds) {
        if (!this.HasProp("__ISpatialSurfaceObserver")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceObserver := ISpatialSurfaceObserver(outPtr)
        }

        return this.__ISpatialSurfaceObserver.SetBoundingVolumes(bounds)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialSurfaceObserver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ObservedSurfacesChanged(handler) {
        if (!this.HasProp("__ISpatialSurfaceObserver")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceObserver := ISpatialSurfaceObserver(outPtr)
        }

        return this.__ISpatialSurfaceObserver.add_ObservedSurfacesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ObservedSurfacesChanged(token) {
        if (!this.HasProp("__ISpatialSurfaceObserver")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceObserver := ISpatialSurfaceObserver(outPtr)
        }

        return this.__ISpatialSurfaceObserver.remove_ObservedSurfacesChanged(token)
    }

;@endregion Instance Methods
}
