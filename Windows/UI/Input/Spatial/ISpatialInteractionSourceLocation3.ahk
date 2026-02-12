#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\SpatialPointerInteractionSourcePose.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSourceLocation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSourceLocation3
     * @type {Guid}
     */
    static IID => Guid("{6702e65e-e915-4cfb-9c1b-0538efc86687}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PositionAccuracy", "get_AngularVelocity", "get_SourcePointerPose"]

    /**
     * @type {Integer} 
     */
    PositionAccuracy {
        get => this.get_PositionAccuracy()
    }

    /**
     * @type {IReference<Vector3>} 
     */
    AngularVelocity {
        get => this.get_AngularVelocity()
    }

    /**
     * @type {SpatialPointerInteractionSourcePose} 
     */
    SourcePointerPose {
        get => this.get_SourcePointerPose()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionAccuracy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_AngularVelocity() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetVector3(), value)
    }

    /**
     * 
     * @returns {SpatialPointerInteractionSourcePose} 
     */
    get_SourcePointerPose() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialPointerInteractionSourcePose(value)
    }
}
