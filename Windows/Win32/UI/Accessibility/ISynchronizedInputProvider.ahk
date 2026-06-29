#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SynchronizedInputType.ahk" { SynchronizedInputType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables Microsoft UI Automation client applications to direct the mouse or keyboard input to a specific UI element.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-isynchronizedinputprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ISynchronizedInputProvider extends IUnknown {
    /**
     * The interface identifier for ISynchronizedInputProvider
     * @type {Guid}
     */
    static IID := Guid("{29db1a06-02ce-4cf7-9b42-565d4fab20ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISynchronizedInputProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartListening : IntPtr
        Cancel         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISynchronizedInputProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts listening for input of the specified type.
     * @remarks
     * When it finds matching input, the provider checks if the target UI Automation element matches the current element. If they match, the provider raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputReachedTargetEventId</a> event; otherwise, it raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputReachedOtherElementEventId</a>  or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputDiscardedEventId</a> event. The UI Automation provider must discard the input if it is for an element other than this one.
     * 
     * This is a one-shot method; after receiving input, the provider stops listening and continues normally.
     * 
     * This method returns E_INVALIDOPERATION if the provider is already listening for input.
     * @param {SynchronizedInputType} inputType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype">SynchronizedInputType</a></b>
     * 
     * The type of input that is requested to be synchronized.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-isynchronizedinputprovider-startlistening
     */
    StartListening(inputType) {
        result := ComCall(3, this, SynchronizedInputType, inputType, "HRESULT")
        return result
    }

    /**
     * Cancels listening for input.
     * @remarks
     * If the provider is currently listening for input, it should revert to normal operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-isynchronizedinputprovider-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISynchronizedInputProvider.IID.Equals(iid)) {
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
