#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUIAutomationElement8.ahk" { IUIAutomationElement8 }

/**
 * Extends the IUIAutomationElement8 interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement9
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement9 extends IUIAutomationElement8 {
    /**
     * The interface identifier for IUIAutomationElement9
     * @type {Guid}
     */
    static IID := Guid("{39325fac-039d-440e-a3a3-5eb81a5cecc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement9 interfaces
    */
    struct Vtbl extends IUIAutomationElement8.Vtbl {
        get_CurrentIsDialog : IntPtr
        get_CachedIsDialog  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsDialog {
        get => this.get_CurrentIsDialog()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsDialog {
        get => this.get_CachedIsDialog()
    }

    /**
     * Retrieves the current is dialog window indicator for the element.
     * @remarks
     * When the <b>CurrentIsDialog</b> property is <b>TRUE</b>, a client application can assume the current window is a dialog.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement9-get_currentisdialog
     */
    get_CurrentIsDialog() {
        result := ComCall(117, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached is dialog window indicator for the element.
     * @remarks
     * When the <b>CachedIsDialog</b> property is <b>TRUE</b>, a client application can assume the cached window is a dialog.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement9-get_cachedisdialog
     */
    get_CachedIsDialog() {
        result := ComCall(118, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationElement9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentIsDialog := CallbackCreate(GetMethod(implObj, "get_CurrentIsDialog"), flags, 2)
        this.vtbl.get_CachedIsDialog := CallbackCreate(GetMethod(implObj, "get_CachedIsDialog"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentIsDialog)
        CallbackFree(this.vtbl.get_CachedIsDialog)
    }
}
