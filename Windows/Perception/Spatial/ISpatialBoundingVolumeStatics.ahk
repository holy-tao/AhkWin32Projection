#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialBoundingVolume.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialBoundingVolumeStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialBoundingVolumeStatics
     * @type {Guid}
     */
    static IID => Guid("{05889117-b3e1-36d8-b017-566181a5b196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromBox", "FromOrientedBox", "FromSphere", "FromFrustum"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {SpatialBoundingBox} box 
     * @returns {SpatialBoundingVolume} 
     */
    FromBox(coordinateSystem, box) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr", box, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialBoundingVolume(value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {SpatialBoundingOrientedBox} box 
     * @returns {SpatialBoundingVolume} 
     */
    FromOrientedBox(coordinateSystem, box) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr", box, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialBoundingVolume(value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {SpatialBoundingSphere} sphere 
     * @returns {SpatialBoundingVolume} 
     */
    FromSphere(coordinateSystem, sphere) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr", sphere, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialBoundingVolume(value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {SpatialBoundingFrustum} frustum 
     * @returns {SpatialBoundingVolume} 
     */
    FromFrustum(coordinateSystem, frustum) {
        result := ComCall(9, this, "ptr", coordinateSystem, "ptr", frustum, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialBoundingVolume(value)
    }
}
