#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialPointerPose.ahk
#Include .\SpatialInteraction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionDetectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionDetectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{075878e4-5961-3b41-9dfb-cea5d89cc38a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InteractionSourceKind", "TryGetPointerPose", "get_Interaction"]

    /**
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
    }

    /**
     * @type {SpatialInteraction} 
     */
    Interaction {
        get => this.get_Interaction()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InteractionSourceKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialPointerPose} 
     */
    TryGetPointerPose(coordinateSystem) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialPointerPose(value)
    }

    /**
     * 
     * @returns {SpatialInteraction} 
     */
    get_Interaction() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteraction(value)
    }
}
