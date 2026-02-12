#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialCoordinateSystem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialStageFrameOfReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialStageFrameOfReference
     * @type {Guid}
     */
    static IID => Guid("{7a8a3464-ad0d-4590-ab86-33062b674926}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CoordinateSystem", "get_MovementRange", "get_LookDirectionRange", "GetCoordinateSystemAtCurrentLocation", "TryGetMovementBounds"]

    /**
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * @type {Integer} 
     */
    MovementRange {
        get => this.get_MovementRange()
    }

    /**
     * @type {Integer} 
     */
    LookDirectionRange {
        get => this.get_LookDirectionRange()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MovementRange() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LookDirectionRange() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialLocator} locator_ 
     * @returns {SpatialCoordinateSystem} 
     */
    GetCoordinateSystemAtCurrentLocation(locator_) {
        result := ComCall(9, this, "ptr", locator_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(result_)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    TryGetMovementBounds(coordinateSystem, value) {
        result := ComCall(10, this, "ptr", coordinateSystem, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
