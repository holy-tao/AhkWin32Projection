#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the IUIAnimationTransition interface that defines a transition. An IUIAnimationTransition2 transition determines how an animation variable changes over time in a given dimension.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransition2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransition2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTransition2
     * @type {Guid}
     */
    static IID => Guid("{62ff9123-a85a-4e9b-a218-435a93e268fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDimension", "SetInitialValue", "SetInitialVectorValue", "SetInitialVelocity", "SetInitialVectorVelocity", "IsDurationKnown", "GetDuration"]

    /**
     * 
     * @param {Pointer<Integer>} dimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-getdimension
     */
    GetDimension(dimension) {
        dimensionMarshal := dimension is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, dimensionMarshal, dimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvalue
     */
    SetInitialValue(value) {
        result := ComCall(4, this, "double", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} value 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvectorvalue
     */
    SetInitialVectorValue(value, cDimension) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, valueMarshal, value, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvelocity
     */
    SetInitialVelocity(velocity) {
        result := ComCall(6, this, "double", velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} velocity 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvectorvelocity
     */
    SetInitialVectorVelocity(velocity, cDimension) {
        velocityMarshal := velocity is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, velocityMarshal, velocity, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-isdurationknown
     */
    IsDurationKnown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-getduration
     */
    GetDuration(duration) {
        durationMarshal := duration is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, durationMarshal, duration, "HRESULT")
        return result
    }
}
