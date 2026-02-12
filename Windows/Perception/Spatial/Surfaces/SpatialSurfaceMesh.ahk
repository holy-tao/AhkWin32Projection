#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialSurfaceMesh.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the mesh data for a surface observed in the user's surroundings.
 * @remarks
 * The SpatialSurfaceMesh class contains all of the information you need to render the mesh or process it for physics, including its vertex, index and normal buffers.
 * 
 * Because this object keeps its buffers alive, you should be sure to delete it or release references to it when you either no longer need the mesh or have already transformed it into a different processed form that you are caching instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class SpatialSurfaceMesh extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialSurfaceMesh

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialSurfaceMesh.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the surface metadata that's associated with this mesh.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh.surfaceinfo
     * @type {SpatialSurfaceInfo} 
     */
    SurfaceInfo {
        get => this.get_SurfaceInfo()
    }

    /**
     * Gets the coordinate system in which the [VertexPositions](spatialsurfacemesh_vertexpositions.md) and [VertexNormals](spatialsurfacemesh_vertexnormals.md) buffers express their coordinates.
     * @remarks
     * Unlike other spatial data structures, vertex buffers and normal buffers are quite heavy, and it would be prohibitive to update all of their coordinates every frame. Instead, apps can transfer these buffers to the GPU or process them for physics once, and then reason about how the surface's [SpatialCoordinateSystem](../windows.perception.spatial/spatialcoordinatesystem.md) changes its relative transform to the app's other relevant coordinate systems in future frames.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * Gets the buffer object representing the mesh's index buffer.
     * @remarks
     * If [SpatialSurfaceMeshOptions.TriangleIndexFormat](spatialsurfacemeshoptions_triangleindexformat.md) is set as an option in the call to [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md), this buffer will be generated in the format indicated.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh.triangleindices
     * @type {SpatialSurfaceMeshBuffer} 
     */
    TriangleIndices {
        get => this.get_TriangleIndices()
    }

    /**
     * Gets the buffer object representing the mesh's vertex buffer.
     * @remarks
     * Note that to get correct vertex positions, coordinates must be scaled according to the VertexPositionScale property. If you are otherwise transforming these coordinates to another coordinate system before using them anyway, you can make a scale matrix from the VertexPositionScale vector and include that as the first matrix in your transform chain.
     * 
     * If [SpatialSurfaceMeshOptions.VertexPositionFormat](spatialsurfacemeshoptions_vertexpositionformat.md) is set as an option in the call to [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md), this buffer will be generated in the format indicated.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh.vertexpositions
     * @type {SpatialSurfaceMeshBuffer} 
     */
    VertexPositions {
        get => this.get_VertexPositions()
    }

    /**
     * Gets the scale vector that you must use to scale the elements of [VertexPositions](spatialsurfacemesh_vertexpositions.md).
     * @remarks
     * This gets you mesh coordinates in meters in the mesh's specified coordinate system.
     * 
     * If you are otherwise transforming these coordinates to another coordinate system before using them anyway, you can make a scale matrix from the VertexPositionScale vector and include that as the first matrix in your transform chain.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh.vertexpositionscale
     * @type {Vector3} 
     */
    VertexPositionScale {
        get => this.get_VertexPositionScale()
    }

    /**
     * Gets the buffer object representing the mesh's normal buffer, if IncludeVertexNormals was set as a mesh option in the call to [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md). Otherwise, this property is null.
     * @remarks
     * If the [SpatialSurfaceMeshOptions.VertexNormalFormat](spatialsurfacemeshoptions_vertexnormalformat.md) option is also set, this buffer will be generated in the format indicated.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemesh.vertexnormals
     * @type {SpatialSurfaceMeshBuffer} 
     */
    VertexNormals {
        get => this.get_VertexNormals()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialSurfaceInfo} 
     */
    get_SurfaceInfo() {
        if (!this.HasProp("__ISpatialSurfaceMesh")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMesh := ISpatialSurfaceMesh(outPtr)
        }

        return this.__ISpatialSurfaceMesh.get_SurfaceInfo()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        if (!this.HasProp("__ISpatialSurfaceMesh")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMesh := ISpatialSurfaceMesh(outPtr)
        }

        return this.__ISpatialSurfaceMesh.get_CoordinateSystem()
    }

    /**
     * 
     * @returns {SpatialSurfaceMeshBuffer} 
     */
    get_TriangleIndices() {
        if (!this.HasProp("__ISpatialSurfaceMesh")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMesh := ISpatialSurfaceMesh(outPtr)
        }

        return this.__ISpatialSurfaceMesh.get_TriangleIndices()
    }

    /**
     * 
     * @returns {SpatialSurfaceMeshBuffer} 
     */
    get_VertexPositions() {
        if (!this.HasProp("__ISpatialSurfaceMesh")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMesh := ISpatialSurfaceMesh(outPtr)
        }

        return this.__ISpatialSurfaceMesh.get_VertexPositions()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_VertexPositionScale() {
        if (!this.HasProp("__ISpatialSurfaceMesh")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMesh := ISpatialSurfaceMesh(outPtr)
        }

        return this.__ISpatialSurfaceMesh.get_VertexPositionScale()
    }

    /**
     * 
     * @returns {SpatialSurfaceMeshBuffer} 
     */
    get_VertexNormals() {
        if (!this.HasProp("__ISpatialSurfaceMesh")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMesh := ISpatialSurfaceMesh(outPtr)
        }

        return this.__ISpatialSurfaceMesh.get_VertexNormals()
    }

;@endregion Instance Methods
}
