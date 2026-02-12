#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IVisualInteractionSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualInteractionSource2
     * @type {Guid}
     */
    static IID => Guid("{aa914893-a73c-414d-80d0-249bad2fbd93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeltaPosition", "get_DeltaScale", "get_Position", "get_PositionVelocity", "get_Scale", "get_ScaleVelocity", "ConfigureCenterPointXModifiers", "ConfigureCenterPointYModifiers", "ConfigureDeltaPositionXModifiers", "ConfigureDeltaPositionYModifiers", "ConfigureDeltaScaleModifiers"]

    /**
     * @type {Vector3} 
     */
    DeltaPosition {
        get => this.get_DeltaPosition()
    }

    /**
     * @type {Float} 
     */
    DeltaScale {
        get => this.get_DeltaScale()
    }

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Vector3} 
     */
    PositionVelocity {
        get => this.get_PositionVelocity()
    }

    /**
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
    }

    /**
     * @type {Float} 
     */
    ScaleVelocity {
        get => this.get_ScaleVelocity()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_DeltaPosition() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeltaScale() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_PositionVelocity() {
        value := Vector3()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleVelocity() {
        result := ComCall(11, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureCenterPointXModifiers(conditionalValues) {
        result := ComCall(12, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureCenterPointYModifiers(conditionalValues) {
        result := ComCall(13, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureDeltaPositionXModifiers(conditionalValues) {
        result := ComCall(14, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureDeltaPositionYModifiers(conditionalValues) {
        result := ComCall(15, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureDeltaScaleModifiers(conditionalValues) {
        result := ComCall(16, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
