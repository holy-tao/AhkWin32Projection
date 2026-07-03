#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to controls that initiate or perform a single, unambiguous action and do not maintain state when activated.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must 
 *         support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
 * 		
 * 
 * Controls implement <b>IInvokeProvider</b> if the same behavior is not 
 *         exposed through another  control pattern provider. For example, if 
 *         the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iinvokeprovider-invoke">Invoke</a> method of a control performs the same 
 *         action as the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand">IExpandCollapseProvider::Expand</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse">Collapse</a> 
 *         method, the control should not also implement <b>IInvokeProvider</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iinvokeprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IInvokeProvider extends IUnknown {
    /**
     * The interface identifier for IInvokeProvider
     * @type {Guid}
     */
    static IID := Guid("{54fcb24b-e18e-47a2-b4d3-eccbe77599a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInvokeProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInvokeProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sends a request to activate a control and initiate its single, unambiguous action. (IInvokeProvider.Invoke)
     * @remarks
     * <b>IInvokeProvider::Invoke</b> is an asynchronous call and must return immediately without blocking. 
     *         
     * 
     * <div class="alert"><b>Note</b>  This is particularly critical for controls that, directly or indirectly, launch a modal dialog when invoked. 
     *         Any Microsoft UI Automation client that instigated the event will remain blocked until the modal dialog is closed.
     *         </div>
     * <div> </div>
     * <b>IInvokeProvider::Invoke</b> raises the Invoked event after the control 
     * 			has completed its associated action, if possible. 
     *             
     * 
     * The event should be raised before servicing the Invoke request 
     * 			in the following scenarios:
     * 	
     * 
     * <ul>
     * <li>It is not possible or practical to wait until the action is complete.</li>
     * <li>The action requires user interaction.</li>
     * <li>The action is time-consuming and will cause the calling client to block for a significant length of time.
     * </li>
     * </ul>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iinvokeprovider-invoke
     */
    Invoke() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInvokeProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}
