#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialSurfaceInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a snapshot of metadata for a surface observed in the user's surroundings.
 * @remarks
 * Mesh objects contain large vertex and index buffers, and so they're heavy to hold onto if you don't have good reason. For efficient use in rendering or physics, an app is expected to cache the mesh and buffer objects it's interested in, and to throw out mesh for areas where the user is no longer operating.
 * 
 * You can use the set of SpatialSurfaceInfo instances given to you by [SpatialSurfaceObserver](spatialsurfaceobserver.md), representing what mesh is present in the targeted bounding volume, in order to manage your cache.
 * 
 * Correlating the [Id](spatialsurfaceinfo_id.md) and [UpdateTime](spatialsurfaceinfo_updatetime.md) properties across multiple observations lets you identify new mesh, updated mesh and removed mesh:
 * 
 * * If you see a SpatialSurfaceInfo with an Id you haven't seen before, treat it as new mesh.
 * * If you see a SpatialSurfaceInfo with a known Id, but with a new UpdateTime, treat it as updated mesh.
 * * If you no longer see a SpatialSurfaceInfo with a known Id, treat it as removed mesh.
 * 
 * Because this is a snapshot, the UpdateTime property will not change over time. To see if this surface's mesh has updated, or whether a surface has been removed or moved out of the bounding volume, return to the SpatialSurfaceObserver and either call [GetObservedSurfaces](spatialsurfaceobserver_getobservedsurfaces_672856049.md) each frame or handle the [ObservedSurfacesChanged](spatialsurfaceobserver_observedsurfaceschanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceinfo
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class SpatialSurfaceInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialSurfaceInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialSurfaceInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the persistent identifier for this surface.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceinfo.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the last update time represented by this surface metadata snapshot.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceinfo.updatetime
     * @type {DateTime} 
     */
    UpdateTime {
        get => this.get_UpdateTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__ISpatialSurfaceInfo")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceInfo := ISpatialSurfaceInfo(outPtr)
        }

        return this.__ISpatialSurfaceInfo.get_Id()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_UpdateTime() {
        if (!this.HasProp("__ISpatialSurfaceInfo")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceInfo := ISpatialSurfaceInfo(outPtr)
        }

        return this.__ISpatialSurfaceInfo.get_UpdateTime()
    }

    /**
     * Gets the bounds of this surface, expressed in the specified coordinate system.
     * @remarks
     * Because this is a snapshot, the bounds returned will not change over time.
     * 
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the bounds.
     * @returns {IReference<SpatialBoundingOrientedBox>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceinfo.trygetbounds
     */
    TryGetBounds(coordinateSystem) {
        if (!this.HasProp("__ISpatialSurfaceInfo")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceInfo := ISpatialSurfaceInfo(outPtr)
        }

        return this.__ISpatialSurfaceInfo.TryGetBounds(coordinateSystem)
    }

    /**
     * Generates a mesh object and its vertex and index buffers for this surface, with the specified mesh generation options. This chooses the most detailed mesh that does not exceed the specified triangle density, in triangles per cubic meter.
     * @param {Float} maxTrianglesPerCubicMeter The maximum triangle density that the app can accept, in triangles per cubic meter.
     * @returns {IAsyncOperation<SpatialSurfaceMesh>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceinfo.trycomputelatestmeshasync
     */
    TryComputeLatestMeshAsync(maxTrianglesPerCubicMeter) {
        if (!this.HasProp("__ISpatialSurfaceInfo")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceInfo := ISpatialSurfaceInfo(outPtr)
        }

        return this.__ISpatialSurfaceInfo.TryComputeLatestMeshAsync(maxTrianglesPerCubicMeter)
    }

    /**
     * Generates a mesh object and its vertex and index buffers for this surface. This chooses the most detailed mesh that does not exceed the specified triangle density, in triangles per cubic meter.
     * @remarks
     * Note that this method does not retrieve the specific mesh that was most current as of the UpdateTime property. Instead, the system's latest mesh data for this surface Id is always returned.
     * 
     * This method may return null if the mesh now contains no triangles or if the surface has since been removed.
     * @param {Float} maxTrianglesPerCubicMeter The maximum triangle density that the app can accept, in triangles per cubic meter.
     * @param {SpatialSurfaceMeshOptions} options 
     * @returns {IAsyncOperation<SpatialSurfaceMesh>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceinfo.trycomputelatestmeshasync
     */
    TryComputeLatestMeshWithOptionsAsync(maxTrianglesPerCubicMeter, options) {
        if (!this.HasProp("__ISpatialSurfaceInfo")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceInfo := ISpatialSurfaceInfo(outPtr)
        }

        return this.__ISpatialSurfaceInfo.TryComputeLatestMeshWithOptionsAsync(maxTrianglesPerCubicMeter, options)
    }

;@endregion Instance Methods
}
