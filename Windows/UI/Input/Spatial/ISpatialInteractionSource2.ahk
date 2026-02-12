#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialInteractionController.ahk
#Include .\SpatialInteractionSourceState.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSource2
     * @type {Guid}
     */
    static IID => Guid("{e4c5b70c-0470-4028-88c0-a0eb44d34efe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPointingSupported", "get_IsMenuSupported", "get_IsGraspSupported", "get_Controller", "TryGetStateAtTimestamp"]

    /**
     * @type {Boolean} 
     */
    IsPointingSupported {
        get => this.get_IsPointingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsMenuSupported {
        get => this.get_IsMenuSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsGraspSupported {
        get => this.get_IsGraspSupported()
    }

    /**
     * @type {SpatialInteractionController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPointingSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMenuSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGraspSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SpatialInteractionController} 
     */
    get_Controller() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionController(value)
    }

    /**
     * 
     * @param {PerceptionTimestamp} timestamp_ 
     * @returns {SpatialInteractionSourceState} 
     */
    TryGetStateAtTimestamp(timestamp_) {
        result := ComCall(10, this, "ptr", timestamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionSourceState(value)
    }
}
