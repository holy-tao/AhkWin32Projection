#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables Windows Store apps to opt out of the automatic invocation behavior.
 * @remarks
 * Clients can request that the touch keyboard and handwriting input panel check to see that a user tapped in the edit control with focus before invoking.
 * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelinvocationconfiguration
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInputPanelInvocationConfiguration extends IUnknown {
    /**
     * The interface identifier for IInputPanelInvocationConfiguration
     * @type {Guid}
     */
    static IID := Guid("{a213f136-3b45-4362-a332-efb6547cd432}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputPanelInvocationConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequireTouchInEditControl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputPanelInvocationConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requires an explicit user tap in an edit field before the touch keyboard invokes.
     * @remarks
     * When the <b>RequireTouchInEditControl</b> method is called, all future focus changes require an explicit user tap in an edit field before the touch keyboard invokes. You can call the <b>RequireTouchInEditControl</b> method multiple times, but there's no way to undo the setting. 
     * 
     * This setting applies for any focus event that takes place to a window that is running in the process that called it. The <b>RequireTouchInEditControl</b> method doesn't affect owned windows in another process that have an ownership chain to the current process that called <b>RequireTouchInEditControl</b>. 
     * 
     * The <b>RequireTouchInEditControl</b> method always returns <b>S_OK</b>. If this API is used, then the <b>IsUIBusy</b> property has no effect. The two interaction models are essentially mutually exclusive.
     * 
     * The following code shows how to call the <b>RequireTouchInEditControl</b> method.
     * 
     * 
     * ```cpp
     * @returns {HRESULT} The <b>RequireTouchInEditControl</b> method always returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nf-inputpanelconfiguration-iinputpanelinvocationconfiguration-requiretouchineditcontrol
     */
    RequireTouchInEditControl() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputPanelInvocationConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequireTouchInEditControl := CallbackCreate(GetMethod(implObj, "RequireTouchInEditControl"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequireTouchInEditControl)
    }
}
