#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIAutomationType.ahk" { UIAutomationType }
#Import ".\UIAutomationParameter.ahk" { UIAutomationParameter }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a control pattern object. The client API wrapper uses this interface to implement all property and method calls in terms of the GetProperty and CallMethod methods.
 * @remarks
 * This interface is implemented by Microsoft UI Automation and returned by methods such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern">GetCurrentPattern</a>. The interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatternhandler-createclientwrapper">CreateClientWrapper</a>, where it is used to call the appropriate methods and property getters.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatterninstance
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationPatternInstance extends IUnknown {
    /**
     * The interface identifier for IUIAutomationPatternInstance
     * @type {Guid}
     */
    static IID := Guid("{c03a7fe4-9431-409f-bed8-ae7c2299bc8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationPatternInstance interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperty : IntPtr
        CallMethod  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationPatternInstance.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The client wrapper object implements the IUIAutomation::get_CurrentX and IUIAutomationElement::get_CachedX methods by calling this function, specifying the property by index.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the property.
     * @param {BOOL} cached Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the property should be retrieved from the cache, otherwise <b>FALSE</b>.
     * @param {UIAutomationType} type 
     * @returns {Void} Type: <b>void*</b>
     * 
     * Receives the value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-getproperty
     */
    GetProperty(index, cached, type) {
        result := ComCall(3, this, "uint", index, BOOL, cached, UIAutomationType, type, "ptr", &pPtr := 0, "HRESULT")
        return pPtr
    }

    /**
     * Client wrapper implements methods by calling this CallMethod function, specifying the parameters as an array of pointers.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the method.
     * @param {Pointer<UIAutomationParameter>} pParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationparameter">UIAutomationParameter</a>*</b>
     * 
     *  A pointer to an array of structures describing the parameters.
     * @param {Integer} cParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of parameters in <i>pParams</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-callmethod
     */
    CallMethod(index, pParams, cParams) {
        result := ComCall(4, this, "uint", index, UIAutomationParameter.Ptr, pParams, "uint", cParams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationPatternInstance.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 5)
        this.vtbl.CallMethod := CallbackCreate(GetMethod(implObj, "CallMethod"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.CallMethod)
    }
}
