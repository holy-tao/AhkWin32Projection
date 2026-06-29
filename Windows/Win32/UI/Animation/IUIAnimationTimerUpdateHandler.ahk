#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UI_ANIMATION_UPDATE_RESULT.ahk" { UI_ANIMATION_UPDATE_RESULT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAnimationTimerClientEventHandler.ahk" { IUIAnimationTimerClientEventHandler }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines methods for handling timing update events.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317019(v=vs.85)">UIAnimationManager</a> object implements this interface, so a client application can query the <b>UIAnimationManager</b> object for this interface and then pass the interface to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler">IUIAnimationTimer::SetTimerUpdateHandler</a>.  It is not necessary to disconnect the <b>UIAnimationManager</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317021(v=vs.85)">UIAnimationTimer</a> objects; releasing them both is sufficient to clean up.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtimerupdatehandler
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTimerUpdateHandler extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTimerUpdateHandler
     * @type {Guid}
     */
    static IID := Guid("{195509b7-5d5e-4e3e-b278-ee3759b367ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTimerUpdateHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUpdate                     : IntPtr
        SetTimerClientEventHandler   : IntPtr
        ClearTimerClientEventHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTimerUpdateHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles update events from the timer.
     * @remarks
     * This method is used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317021(v=vs.85)">UIAnimationTimer</a> object to update the state of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317019(v=vs.85)">UIAnimationManager</a> object. The <b>UIAnimationTimer</b> object calls <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpostupdate">UIAnimationTimerEventHandler::OnPostUpdate</a> only when calls to this method return a result of <b>UI_ANIMATION_UPDATE_VARIABLES_CHANGED</b>.
     * @param {Float} timeNow The current timer time, in seconds.
     * @returns {UI_ANIMATION_UPDATE_RESULT} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_update_result">UI_ANIMATION_UPDATE_RESULT</a> enumeration, indicating whether any animation variables changed as a result of the update.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate
     */
    OnUpdate(timeNow) {
        result := ComCall(3, this, "double", timeNow, "int*", &result := 0, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for timer client status change events.
     * @remarks
     * If the update handler is already connected to the timer, this method returns <b>UI_E_TIMER_CLIENT_ALREADY_CONNECTED.</b>
     * @param {IUIAnimationTimerClientEventHandler} handler A handler for timer client events.  The specified object must implement
     *                <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimerclienteventhandler">IUIAnimationTimerUpdateHandler</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-settimerclienteventhandler
     */
    SetTimerClientEventHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Clears the handler for timer client status change events.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-cleartimerclienteventhandler
     */
    ClearTimerClientEventHandler() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationTimerUpdateHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUpdate := CallbackCreate(GetMethod(implObj, "OnUpdate"), flags, 3)
        this.vtbl.SetTimerClientEventHandler := CallbackCreate(GetMethod(implObj, "SetTimerClientEventHandler"), flags, 2)
        this.vtbl.ClearTimerClientEventHandler := CallbackCreate(GetMethod(implObj, "ClearTimerClientEventHandler"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUpdate)
        CallbackFree(this.vtbl.SetTimerClientEventHandler)
        CallbackFree(this.vtbl.ClearTimerClientEventHandler)
    }
}
