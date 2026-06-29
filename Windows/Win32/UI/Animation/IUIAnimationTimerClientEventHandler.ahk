#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UI_ANIMATION_TIMER_CLIENT_STATUS.ahk" { UI_ANIMATION_TIMER_CLIENT_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a method for handling events related to changes in timer client status.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtimerclienteventhandler
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTimerClientEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTimerClientEventHandler
     * @type {Guid}
     */
    static IID := Guid("{bedb4db6-94fa-4bfb-a47f-ef2d9e408c25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTimerClientEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnTimerClientStatusChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTimerClientEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles events that occur when the status of the timer's client changes.
     * @param {UI_ANIMATION_TIMER_CLIENT_STATUS} newStatus The new status of the timer's client.
     * @param {UI_ANIMATION_TIMER_CLIENT_STATUS} previousStatus The previous status of the timer's client.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerclienteventhandler-ontimerclientstatuschanged
     */
    OnTimerClientStatusChanged(newStatus, previousStatus) {
        result := ComCall(3, this, UI_ANIMATION_TIMER_CLIENT_STATUS, newStatus, UI_ANIMATION_TIMER_CLIENT_STATUS, previousStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationTimerClientEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTimerClientStatusChanged := CallbackCreate(GetMethod(implObj, "OnTimerClientStatusChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTimerClientStatusChanged)
    }
}
