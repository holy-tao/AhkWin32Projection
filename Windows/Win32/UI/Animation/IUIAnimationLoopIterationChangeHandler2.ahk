#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAnimationStoryboard2.ahk" { IUIAnimationStoryboard2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a method for handling storyboard loop iteration events.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationloopiterationchangehandler2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationLoopIterationChangeHandler2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationLoopIterationChangeHandler2
     * @type {Guid}
     */
    static IID := Guid("{2d3b15a4-4762-47ab-a030-b23221df3ae0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationLoopIterationChangeHandler2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLoopIterationChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationLoopIterationChangeHandler2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles loop iteration change events, which occur when a loop within a storyboard begins a new iteration.
     * @param {IUIAnimationStoryboard2} storyboard The storyboard to which the loop belongs.
     * @param {Pointer} id The loop ID.
     * @param {Integer} newIterationCount The iteration count for the latest <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-update">IUIAnimationManager2::Update</a>.
     * @param {Integer} oldIterationCount The iteration count for the previous <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-update">IUIAnimationManager2::Update</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationloopiterationchangehandler2-onloopiterationchanged
     */
    OnLoopIterationChanged(storyboard, id, newIterationCount, oldIterationCount) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", id, "uint", newIterationCount, "uint", oldIterationCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationLoopIterationChangeHandler2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLoopIterationChanged := CallbackCreate(GetMethod(implObj, "OnLoopIterationChanged"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLoopIterationChanged)
    }
}
