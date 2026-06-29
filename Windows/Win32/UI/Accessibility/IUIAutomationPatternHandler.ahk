#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIAutomationParameter.ahk" { UIAutomationParameter }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationPatternInstance.ahk" { IUIAutomationPatternInstance }

/**
 * Returns a client API wrapper object and to unmarshal property and method requests to an actual provider instance.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatternhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationPatternHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationPatternHandler
     * @type {Guid}
     */
    static IID := Guid("{d97022f3-a947-465e-8b2a-ac4315fa54e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationPatternHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateClientWrapper : IntPtr
        Dispatch            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationPatternHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an object that enables a client application to interact with a custom control pattern.
     * @remarks
     * The wrapper object exposes methods and properties of the <i>control pattern</i>. The implementation of the wrapper class passes these calls to Microsoft UI Automation by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-callmethod">CallMethod</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-getproperty">GetProperty</a>.
     * @param {IUIAutomationPatternInstance} pPatternInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatterninstance">IUIAutomationPatternInstance</a>*</b>
     * 
     * A pointer to the instance of the control pattern that will be used by the wrapper.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to the wrapper object.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatternhandler-createclientwrapper
     */
    CreateClientWrapper(pPatternInstance) {
        result := ComCall(3, this, "ptr", pPatternInstance, "ptr*", &pClientWrapper := 0, "HRESULT")
        return IUnknown(pClientWrapper)
    }

    /**
     * Dispatches a method or property getter to a custom control pattern provider.
     * @param {IUnknown} pTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the object that implements the control pattern provider.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the method or property getter.
     * @param {Pointer<UIAutomationParameter>} pParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationparameter">UIAutomationParameter</a>*</b>
     * 
     * A pointer to an array of structures that contain information about the parameters to be passed.
     * @param {Integer} cParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of parameters in <i>pParams</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatternhandler-dispatch
     */
    Dispatch(pTarget, index, pParams, cParams) {
        result := ComCall(4, this, "ptr", pTarget, "uint", index, UIAutomationParameter.Ptr, pParams, "uint", cParams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationPatternHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateClientWrapper := CallbackCreate(GetMethod(implObj, "CreateClientWrapper"), flags, 3)
        this.vtbl.Dispatch := CallbackCreate(GetMethod(implObj, "Dispatch"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateClientWrapper)
        CallbackFree(this.vtbl.Dispatch)
    }
}
