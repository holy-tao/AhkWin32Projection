#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVector3NaturalMotionAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVector3NaturalMotionAnimation
     * @type {Guid}
     */
    static IID => Guid("{9c17042c-e2ca-45ad-969e-4e78b7b9ad41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FinalValue", "put_FinalValue", "get_InitialValue", "put_InitialValue", "get_InitialVelocity", "put_InitialVelocity"]

    /**
     * @type {IReference<Vector3>} 
     */
    FinalValue {
        get => this.get_FinalValue()
        set => this.put_FinalValue(value)
    }

    /**
     * @type {IReference<Vector3>} 
     */
    InitialValue {
        get => this.get_InitialValue()
        set => this.put_InitialValue(value)
    }

    /**
     * @type {Vector3} 
     */
    InitialVelocity {
        get => this.get_InitialVelocity()
        set => this.put_InitialVelocity(value)
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_FinalValue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetVector3(), value)
    }

    /**
     * 
     * @param {IReference<Vector3>} value 
     * @returns {HRESULT} 
     */
    put_FinalValue(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_InitialValue() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetVector3(), value)
    }

    /**
     * 
     * @param {IReference<Vector3>} value 
     * @returns {HRESULT} 
     */
    put_InitialValue(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_InitialVelocity() {
        value := Vector3()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_InitialVelocity(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
