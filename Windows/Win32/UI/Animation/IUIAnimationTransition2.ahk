#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the IUIAnimationTransition interface that defines a transition. An IUIAnimationTransition2 transition determines how an animation variable changes over time in a given dimension.
 * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nn-uianimation-iuianimationtransition2
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
     * Gets the number of dimensions in which the animation variable has a transition specified.
     * @returns {Integer} The number of dimensions.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-getdimension
     */
    GetDimension() {
        result := ComCall(3, this, "uint*", &dimension := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dimension
    }

    /**
     * Sets the initial value of the transition.
     * @remarks
     * Do not call this method after the transition has been added to a storyboard.
     * @param {Float} value The initial value for the transition.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-setinitialvalue
     */
    SetInitialValue(value) {
        result := ComCall(4, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the initial value of the transition for each specified dimension in the animation variable.
     * @remarks
     * The animation manager should not call this method after the transition has been added to a storyboard.
     * @param {Pointer<Float>} value A vector (of size <i>cDimension</i>) that contains  the initial values for the transition.
     * @param {Integer} cDimension The number of dimensions that require transition values. This parameter specifies the number of values listed in <i>value</i>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-setinitialvectorvalue
     */
    SetInitialVectorValue(value, cDimension) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, valueMarshal, value, "uint", cDimension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the initial velocity of the transition.
     * @param {Float} velocity The initial velocity for the transition.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-setinitialvelocity
     */
    SetInitialVelocity(velocity) {
        result := ComCall(6, this, "double", velocity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the initial velocity of the transition for each specified dimension in the animation variable.
     * @param {Pointer<Float>} velocity A vector (of size <i>cDimension</i>) that contains  the initial velocities for the transition.
     * @param {Integer} cDimension The number of dimensions that require transition velocities. This parameter specifies the number of values listed in <i>velocity</i>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-setinitialvectorvelocity
     */
    SetInitialVectorVelocity(velocity, cDimension) {
        velocityMarshal := velocity is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, velocityMarshal, velocity, "uint", cDimension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the duration of a transition is known.
     * @remarks
     * This method should not be called when the storyboard to which the transition has been added is scheduled or playing.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-isdurationknown
     */
    IsDurationKnown() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the duration of the transition. (IUIAnimationTransition2.GetDuration)
     * @remarks
     * An application should typically call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition2-isdurationknown">IsDurationKnown</a> method before calling this method. 
     * 
     * This method should not be called when the storyboard to which the transition has been added is scheduled or playing.
     * @returns {Float} The duration of the transition, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationtransition2-getduration
     */
    GetDuration() {
        result := ComCall(9, this, "double*", &duration := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return duration
    }
}
