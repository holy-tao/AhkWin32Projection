#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialAnchor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialAnchorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAnchorStatics
     * @type {Guid}
     */
    static IID => Guid("{a9928642-0174-311c-ae79-0e5107669f16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateRelativeTo", "TryCreateWithPositionRelativeTo", "TryCreateWithPositionAndOrientationRelativeTo"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialAnchor} 
     */
    TryCreateRelativeTo(coordinateSystem) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialAnchor(value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} position 
     * @returns {SpatialAnchor} 
     */
    TryCreateWithPositionRelativeTo(coordinateSystem, position) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr", position, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialAnchor(value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} position 
     * @param {Quaternion} orientation_ 
     * @returns {SpatialAnchor} 
     */
    TryCreateWithPositionAndOrientationRelativeTo(coordinateSystem, position, orientation_) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr", position, "ptr", orientation_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialAnchor(value)
    }
}
