#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a transition, which determines how an animation variable changes over time.
 * @remarks
 * <b>IUIAnimationTransition</b> is one of the primary interfaces used to add animation to an application,
 *          along with 
 *          the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariable">IUIAnimationVariable</a> and 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboard">IUIAnimationStoryboard</a> interfaces.
 * 
 * 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317028(v=vs.85)">UIAnimationTransitionLibrary</a> implements
 *          a library of standard transitions.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtransition
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTransition extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTransition
     * @type {Guid}
     */
    static IID := Guid("{dc6ce252-f731-41cf-b610-614b6ca049ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTransition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetInitialValue    : IntPtr
        SetInitialVelocity : IntPtr
        IsDurationKnown    : IntPtr
        GetDuration        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTransition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the initial value for the transition.
     * @remarks
     * This method should not be called after the transition has been added to a storyboard.
     * @param {Float} value The initial value for the transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-setinitialvalue
     */
    SetInitialValue(value) {
        result := ComCall(3, this, "double", value, "HRESULT")
        return result
    }

    /**
     * Sets the initial velocity for the transition.
     * @remarks
     * This method should not be called after the transition has been added to a storyboard.
     * @param {Float} velocity The initial velocity for the transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-setinitialvelocity
     */
    SetInitialVelocity(velocity) {
        result := ComCall(4, this, "double", velocity, "HRESULT")
        return result
    }

    /**
     * Determines whether a transition's duration is currently known.
     * @remarks
     * This method should not be called when the storyboard to which the transition has been added is scheduled or playing.
     * @returns {HRESULT} Returns S_OK if the duration is known, S_FALSE if the duration is not known, or an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_STORYBOARD_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The storyboard for this transition is currently in schedule.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-isdurationknown
     */
    IsDurationKnown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the duration of the transition. (IUIAnimationTransition.GetDuration)
     * @remarks
     * An application should typically call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition-isdurationknown">IUIAnimationTransition::IsDurationKnown</a> method before calling this method. This method should not be called when the storyboard to which the transition has been added is scheduled or playing.
     * @returns {Float} The duration of the transition, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-getduration
     */
    GetDuration() {
        result := ComCall(6, this, "double*", &duration := 0, "HRESULT")
        return duration
    }

    Query(iid) {
        if (IUIAnimationTransition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInitialValue := CallbackCreate(GetMethod(implObj, "SetInitialValue"), flags, 2)
        this.vtbl.SetInitialVelocity := CallbackCreate(GetMethod(implObj, "SetInitialVelocity"), flags, 2)
        this.vtbl.IsDurationKnown := CallbackCreate(GetMethod(implObj, "IsDurationKnown"), flags, 1)
        this.vtbl.GetDuration := CallbackCreate(GetMethod(implObj, "GetDuration"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInitialValue)
        CallbackFree(this.vtbl.SetInitialVelocity)
        CallbackFree(this.vtbl.IsDurationKnown)
        CallbackFree(this.vtbl.GetDuration)
    }
}
