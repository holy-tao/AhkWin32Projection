#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAnimationVariable2.ahk" { IUIAnimationVariable2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a method for handling animation curve update events.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationvariablecurvechangehandler2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationVariableCurveChangeHandler2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationVariableCurveChangeHandler2
     * @type {Guid}
     */
    static IID := Guid("{72895e91-0145-4c21-9192-5aab40eddf80}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationVariableCurveChangeHandler2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCurveChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationVariableCurveChangeHandler2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles events that occur when the animation curve of an animation variable changes.
     * @param {IUIAnimationVariable2} variable The animation variable for which the animation curve has been updated.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariablecurvechangehandler2-oncurvechanged
     */
    OnCurveChanged(variable) {
        result := ComCall(3, this, "ptr", variable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationVariableCurveChangeHandler2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCurveChanged := CallbackCreate(GetMethod(implObj, "OnCurveChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCurveChanged)
    }
}
