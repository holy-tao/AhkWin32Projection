#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerInertiaStateEnteredArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerInertiaStateEnteredArgs
     * @type {Guid}
     */
    static IID => Guid("{87108cf2-e7ff-4f7d-9ffd-d72f1e409b63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ModifiedRestingPosition", "get_ModifiedRestingScale", "get_NaturalRestingPosition", "get_NaturalRestingScale", "get_PositionVelocityInPixelsPerSecond", "get_RequestId", "get_ScaleVelocityInPercentPerSecond"]

    /**
     * @type {IReference<Vector3>} 
     */
    ModifiedRestingPosition {
        get => this.get_ModifiedRestingPosition()
    }

    /**
     * @type {IReference<Float>} 
     */
    ModifiedRestingScale {
        get => this.get_ModifiedRestingScale()
    }

    /**
     * @type {Vector3} 
     */
    NaturalRestingPosition {
        get => this.get_NaturalRestingPosition()
    }

    /**
     * @type {Float} 
     */
    NaturalRestingScale {
        get => this.get_NaturalRestingScale()
    }

    /**
     * @type {Vector3} 
     */
    PositionVelocityInPixelsPerSecond {
        get => this.get_PositionVelocityInPixelsPerSecond()
    }

    /**
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * @type {Float} 
     */
    ScaleVelocityInPercentPerSecond {
        get => this.get_ScaleVelocityInPercentPerSecond()
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_ModifiedRestingPosition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetVector3(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ModifiedRestingScale() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_NaturalRestingPosition() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NaturalRestingScale() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_PositionVelocityInPixelsPerSecond() {
        value := Vector3()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleVelocityInPercentPerSecond() {
        result := ComCall(12, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
