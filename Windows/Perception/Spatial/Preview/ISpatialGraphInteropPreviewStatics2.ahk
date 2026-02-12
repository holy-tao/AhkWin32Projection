#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialGraphInteropFrameOfReferencePreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Preview
 * @version WindowsRuntime 1.4
 */
class ISpatialGraphInteropPreviewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialGraphInteropPreviewStatics2
     * @type {Guid}
     */
    static IID => Guid("{2490b15f-6cbd-4b1e-b765-31e462a32df2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateFrameOfReference", "TryCreateFrameOfReferenceWithPosition", "TryCreateFrameOfReferenceWithPositionAndOrientation"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialGraphInteropFrameOfReferencePreview} 
     */
    TryCreateFrameOfReference(coordinateSystem) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialGraphInteropFrameOfReferencePreview(result_)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} relativePosition 
     * @returns {SpatialGraphInteropFrameOfReferencePreview} 
     */
    TryCreateFrameOfReferenceWithPosition(coordinateSystem, relativePosition) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr", relativePosition, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialGraphInteropFrameOfReferencePreview(result_)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @returns {SpatialGraphInteropFrameOfReferencePreview} 
     */
    TryCreateFrameOfReferenceWithPositionAndOrientation(coordinateSystem, relativePosition, relativeOrientation) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr", relativePosition, "ptr", relativeOrientation, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialGraphInteropFrameOfReferencePreview(result_)
    }
}
