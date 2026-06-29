#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SynchronizedInputType.ahk" { SynchronizedInputType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the keyboard or mouse input of a control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationsynchronizedinputpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationSynchronizedInputPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationSynchronizedInputPattern
     * @type {Guid}
     */
    static IID := Guid("{2233be0b-afb7-448b-9fda-3b378aa5eae1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationSynchronizedInputPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartListening : IntPtr
        Cancel         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationSynchronizedInputPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Causes the Microsoft UI Automation provider to start listening for mouse or keyboard input.
     * @remarks
     * When matching input is found, the provider checks whether the target element matches the current element. If they match, the provider raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputReachedTargetEventId</a> event; otherwise it raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputReachedOtherElementEventId</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputDiscardedEventId</a> event.
     * 
     * After receiving input of the specified type, the provider stops checking for input and continues as normal.
     * 
     * If the provider is already listening for input, this method returns <b>E_INVALIDOPERATION</b>.
     * @param {SynchronizedInputType} inputType 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationsynchronizedinputpattern-startlistening
     */
    StartListening(inputType) {
        result := ComCall(3, this, SynchronizedInputType, inputType, "HRESULT")
        return result
    }

    /**
     * Causes the Microsoft UI Automation provider to stop listening for mouse or keyboard input.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationsynchronizedinputpattern-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationSynchronizedInputPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartListening := CallbackCreate(GetMethod(implObj, "StartListening"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartListening)
        CallbackFree(this.vtbl.Cancel)
    }
}
