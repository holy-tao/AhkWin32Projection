#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UI_ANIMATION_MANAGER_STATUS.ahk" { UI_ANIMATION_MANAGER_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a method for handling updates to an animation manager.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationmanagereventhandler2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationManagerEventHandler2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationManagerEventHandler2
     * @type {Guid}
     */
    static IID := Guid("{f6e022ba-bff3-42ec-9033-e073f33e83c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationManagerEventHandler2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnManagerStatusChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationManagerEventHandler2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles status changes to an animation manager. (IUIAnimationManagerEventHandler2.OnManagerStatusChanged)
     * @remarks
     * Calls made to other Windows Animation methods from <b>IUIAnimationManager2::OnManagerStatusChanged</b> fail and return <b>UI_E_ILLEGAL_REENTRANCY</b>.
     * @param {UI_ANIMATION_MANAGER_STATUS} newStatus The new status of the animation manager.
     * @param {UI_ANIMATION_MANAGER_STATUS} previousStatus The previous status of the animation manager.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanagereventhandler2-onmanagerstatuschanged
     */
    OnManagerStatusChanged(newStatus, previousStatus) {
        result := ComCall(3, this, UI_ANIMATION_MANAGER_STATUS, newStatus, UI_ANIMATION_MANAGER_STATUS, previousStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationManagerEventHandler2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnManagerStatusChanged := CallbackCreate(GetMethod(implObj, "OnManagerStatusChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnManagerStatusChanged)
    }
}
