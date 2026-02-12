#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicKeyboard extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicKeyboard
     * @type {Guid}
     */
    static IID => Guid("{07dd0893-aa21-5e6f-a91b-11b2b3fd7be3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPlacementOverride", "SetPlacementOverrideWithMaxSize", "ResetPlacementOverride"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} topCenterPosition 
     * @param {Quaternion} orientation_ 
     * @returns {HRESULT} 
     */
    SetPlacementOverride(coordinateSystem, topCenterPosition, orientation_) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr", topCenterPosition, "ptr", orientation_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} topCenterPosition 
     * @param {Quaternion} orientation_ 
     * @param {Vector2} maxSize 
     * @returns {HRESULT} 
     */
    SetPlacementOverrideWithMaxSize(coordinateSystem, topCenterPosition, orientation_, maxSize) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr", topCenterPosition, "ptr", orientation_, "ptr", maxSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetPlacementOverride() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
