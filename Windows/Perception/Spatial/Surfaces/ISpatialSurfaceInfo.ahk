#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\SpatialSurfaceMesh.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceInfo
     * @type {Guid}
     */
    static IID => Guid("{f8e9ebe7-39b7-3962-bb03-57f56e1fb0a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_UpdateTime", "TryGetBounds", "TryComputeLatestMeshAsync", "TryComputeLatestMeshWithOptionsAsync"]

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {DateTime} 
     */
    UpdateTime {
        get => this.get_UpdateTime()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_UpdateTime() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {IReference<SpatialBoundingOrientedBox>} 
     */
    TryGetBounds(coordinateSystem) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSpatialBoundingOrientedBox(), value)
    }

    /**
     * 
     * @param {Float} maxTrianglesPerCubicMeter 
     * @returns {IAsyncOperation<SpatialSurfaceMesh>} 
     */
    TryComputeLatestMeshAsync(maxTrianglesPerCubicMeter) {
        result := ComCall(9, this, "double", maxTrianglesPerCubicMeter, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpatialSurfaceMesh, value)
    }

    /**
     * 
     * @param {Float} maxTrianglesPerCubicMeter 
     * @param {SpatialSurfaceMeshOptions} options 
     * @returns {IAsyncOperation<SpatialSurfaceMesh>} 
     */
    TryComputeLatestMeshWithOptionsAsync(maxTrianglesPerCubicMeter, options) {
        result := ComCall(10, this, "double", maxTrianglesPerCubicMeter, "ptr", options, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpatialSurfaceMesh, value)
    }
}
