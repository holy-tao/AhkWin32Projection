#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IDepthCorrelatedCoordinateMapper extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDepthCorrelatedCoordinateMapper
     * @type {Guid}
     */
    static IID => Guid("{f95d89fb-8af0-4cb0-926d-696866e5046a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnprojectPoint", "UnprojectPoints", "MapPoint", "MapPoints"]

    /**
     * 
     * @param {POINT} sourcePoint 
     * @param {SpatialCoordinateSystem} targetCoordinateSystem 
     * @returns {Vector3} 
     */
    UnprojectPoint(sourcePoint, targetCoordinateSystem) {
        result_ := Vector3()
        result := ComCall(6, this, "ptr", sourcePoint, "ptr", targetCoordinateSystem, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} sourcePoints_length 
     * @param {Pointer<POINT>} sourcePoints 
     * @param {SpatialCoordinateSystem} targetCoordinateSystem 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results 
     * @returns {HRESULT} 
     */
    UnprojectPoints(sourcePoints_length, sourcePoints, targetCoordinateSystem, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", sourcePoints_length, "ptr", sourcePoints, "ptr", targetCoordinateSystem, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} sourcePoint 
     * @param {SpatialCoordinateSystem} targetCoordinateSystem 
     * @param {CameraIntrinsics} targetCameraIntrinsics 
     * @returns {POINT} 
     */
    MapPoint(sourcePoint, targetCoordinateSystem, targetCameraIntrinsics) {
        result_ := POINT()
        result := ComCall(8, this, "ptr", sourcePoint, "ptr", targetCoordinateSystem, "ptr", targetCameraIntrinsics, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} sourcePoints_length 
     * @param {Pointer<POINT>} sourcePoints 
     * @param {SpatialCoordinateSystem} targetCoordinateSystem 
     * @param {CameraIntrinsics} targetCameraIntrinsics 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results 
     * @returns {HRESULT} 
     */
    MapPoints(sourcePoints_length, sourcePoints, targetCoordinateSystem, targetCameraIntrinsics, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "uint", sourcePoints_length, "ptr", sourcePoints, "ptr", targetCoordinateSystem, "ptr", targetCameraIntrinsics, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
