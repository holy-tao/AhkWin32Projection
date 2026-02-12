#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicKeyboardPlacementOverridePreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicKeyboardPlacementOverridePreview
     * @type {Guid}
     */
    static IID => Guid("{c8a8ce3a-dfde-5a14-8d5f-182c526dd9c4}")

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
     * @param {Vector3} normal 
     * @returns {HRESULT} 
     */
    SetPlacementOverride(coordinateSystem, topCenterPosition, normal) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr", topCenterPosition, "ptr", normal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} topCenterPosition 
     * @param {Vector3} normal 
     * @param {Vector2} maxSize 
     * @returns {HRESULT} 
     */
    SetPlacementOverrideWithMaxSize(coordinateSystem, topCenterPosition, normal, maxSize) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr", topCenterPosition, "ptr", normal, "ptr", maxSize, "int")
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
