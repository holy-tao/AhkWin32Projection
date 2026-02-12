#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\SpatialCoordinateSystem.ahk
#Include ..\SpatialLocator.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Preview
 * @version WindowsRuntime 1.4
 */
class ISpatialGraphInteropPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialGraphInteropPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{c042644c-20d8-4ed0-aef7-6805b8e53f55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCoordinateSystemForNode", "CreateCoordinateSystemForNodeWithPosition", "CreateCoordinateSystemForNodeWithPositionAndOrientation", "CreateLocatorForNode"]

    /**
     * 
     * @param {Guid} nodeId 
     * @returns {SpatialCoordinateSystem} 
     */
    CreateCoordinateSystemForNode(nodeId) {
        result := ComCall(6, this, "ptr", nodeId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(result_)
    }

    /**
     * 
     * @param {Guid} nodeId 
     * @param {Vector3} relativePosition 
     * @returns {SpatialCoordinateSystem} 
     */
    CreateCoordinateSystemForNodeWithPosition(nodeId, relativePosition) {
        result := ComCall(7, this, "ptr", nodeId, "ptr", relativePosition, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(result_)
    }

    /**
     * 
     * @param {Guid} nodeId 
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @returns {SpatialCoordinateSystem} 
     */
    CreateCoordinateSystemForNodeWithPositionAndOrientation(nodeId, relativePosition, relativeOrientation) {
        result := ComCall(8, this, "ptr", nodeId, "ptr", relativePosition, "ptr", relativeOrientation, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(result_)
    }

    /**
     * 
     * @param {Guid} nodeId 
     * @returns {SpatialLocator} 
     */
    CreateLocatorForNode(nodeId) {
        result := ComCall(9, this, "ptr", nodeId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocator(result_)
    }
}
