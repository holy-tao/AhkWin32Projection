#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialSurfaceInfo.ahk
#Include ..\SpatialCoordinateSystem.ahk
#Include .\SpatialSurfaceMeshBuffer.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceMesh extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceMesh
     * @type {Guid}
     */
    static IID => Guid("{108f57d9-df0d-3950-a0fd-f972c77c27b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SurfaceInfo", "get_CoordinateSystem", "get_TriangleIndices", "get_VertexPositions", "get_VertexPositionScale", "get_VertexNormals"]

    /**
     * @type {SpatialSurfaceInfo} 
     */
    SurfaceInfo {
        get => this.get_SurfaceInfo()
    }

    /**
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * @type {SpatialSurfaceMeshBuffer} 
     */
    TriangleIndices {
        get => this.get_TriangleIndices()
    }

    /**
     * @type {SpatialSurfaceMeshBuffer} 
     */
    VertexPositions {
        get => this.get_VertexPositions()
    }

    /**
     * @type {Vector3} 
     */
    VertexPositionScale {
        get => this.get_VertexPositionScale()
    }

    /**
     * @type {SpatialSurfaceMeshBuffer} 
     */
    VertexNormals {
        get => this.get_VertexNormals()
    }

    /**
     * 
     * @returns {SpatialSurfaceInfo} 
     */
    get_SurfaceInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialSurfaceInfo(value)
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }

    /**
     * 
     * @returns {SpatialSurfaceMeshBuffer} 
     */
    get_TriangleIndices() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialSurfaceMeshBuffer(value)
    }

    /**
     * 
     * @returns {SpatialSurfaceMeshBuffer} 
     */
    get_VertexPositions() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialSurfaceMeshBuffer(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_VertexPositionScale() {
        value := Vector3()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SpatialSurfaceMeshBuffer} 
     */
    get_VertexNormals() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialSurfaceMeshBuffer(value)
    }
}
