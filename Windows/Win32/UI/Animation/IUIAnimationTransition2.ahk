#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Extends the IUIAnimationTransition interface that defines a transition. An IUIAnimationTransition2 transition determines how an animation variable changes over time in a given dimension.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtransition2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTransition2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTransition2
     * @type {Guid}
     */
    static IID := Guid("{62ff9123-a85a-4e9b-a218-435a93e268fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTransition2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDimension             : IntPtr
        SetInitialValue          : IntPtr
        SetInitialVectorValue    : IntPtr
        SetInitialVelocity       : IntPtr
        SetInitialVectorVelocity : IntPtr
        IsDurationKnown          : IntPtr
        GetDuration              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTransition2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of dimensions in which the animation variable has a transition specified.
     * @returns {Integer} The number of dimensions.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-getdimension
     */
    GetDimension() {
        result := ComCall(3, this, "uint*", &dimension := 0, "HRESULT")
        return dimension
    }

    /**
     * Sets the initial value of the transition.
     * @remarks
     * Do not call this method after the transition has been added to a storyboard.
     * @param {Float} value The initial value for the transition.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvalue
     */
    SetInitialValue(value) {
        result := ComCall(4, this, "double", value, "HRESULT")
        return result
    }

    /**
     * Sets the initial value of the transition for each specified dimension in the animation variable.
     * @remarks
     * The animation manager should not call this method after the transition has been added to a storyboard.
     * @param {Pointer<Float>} value A vector (of size <i>cDimension</i>) that contains  the initial values for the transition.
     * @param {Integer} cDimension The number of dimensions that require transition values. This parameter specifies the number of values listed in <i>value</i>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvectorvalue
     */
    SetInitialVectorValue(value, cDimension) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, valueMarshal, value, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Sets the initial velocity of the transition.
     * @param {Float} velocity The initial velocity for the transition.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvelocity
     */
    SetInitialVelocity(velocity) {
        result := ComCall(6, this, "double", velocity, "HRESULT")
        return result
    }

    /**
     * Sets the initial velocity of the transition for each specified dimension in the animation variable.
     * @param {Pointer<Float>} velocity A vector (of size <i>cDimension</i>) that contains  the initial velocities for the transition.
     * @param {Integer} cDimension The number of dimensions that require transition velocities. This parameter specifies the number of values listed in <i>velocity</i>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvectorvelocity
     */
    SetInitialVectorVelocity(velocity, cDimension) {
        velocityMarshal := velocity is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, velocityMarshal, velocity, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Determines whether the duration of a transition is known.
     * @remarks
     * This method should not be called when the storyboard to which the transition has been added is scheduled or playing.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-isdurationknown
     */
    IsDurationKnown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Gets the duration of the transition. (IUIAnimationTransition2.GetDuration)
     * @remarks
     * An application should typically call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition2-isdurationknown">IsDurationKnown</a> method before calling this method. 
     * 
     * This method should not be called when the storyboard to which the transition has been added is scheduled or playing.
     * @returns {Float} The duration of the transition, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition2-getduration
     */
    GetDuration() {
        result := ComCall(9, this, "double*", &duration := 0, "HRESULT")
        return duration
    }

    Query(iid) {
        if (IUIAnimationTransition2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDimension := CallbackCreate(GetMethod(implObj, "GetDimension"), flags, 2)
        this.vtbl.SetInitialValue := CallbackCreate(GetMethod(implObj, "SetInitialValue"), flags, 2)
        this.vtbl.SetInitialVectorValue := CallbackCreate(GetMethod(implObj, "SetInitialVectorValue"), flags, 3)
        this.vtbl.SetInitialVelocity := CallbackCreate(GetMethod(implObj, "SetInitialVelocity"), flags, 2)
        this.vtbl.SetInitialVectorVelocity := CallbackCreate(GetMethod(implObj, "SetInitialVectorVelocity"), flags, 3)
        this.vtbl.IsDurationKnown := CallbackCreate(GetMethod(implObj, "IsDurationKnown"), flags, 1)
        this.vtbl.GetDuration := CallbackCreate(GetMethod(implObj, "GetDuration"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDimension)
        CallbackFree(this.vtbl.SetInitialValue)
        CallbackFree(this.vtbl.SetInitialVectorValue)
        CallbackFree(this.vtbl.SetInitialVelocity)
        CallbackFree(this.vtbl.SetInitialVectorVelocity)
        CallbackFree(this.vtbl.IsDurationKnown)
        CallbackFree(this.vtbl.GetDuration)
    }
}
