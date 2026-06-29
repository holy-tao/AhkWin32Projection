#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ExpandCollapseState.ahk" { ExpandCollapseState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that visually expands to display content, and collapses to hide content.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingexpandcollapse">ExpandCollapse</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iexpandcollapseprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IExpandCollapseProvider extends IUnknown {
    /**
     * The interface identifier for IExpandCollapseProvider
     * @type {Guid}
     */
    static IID := Guid("{d847d3a5-cab0-4a98-8c32-ecb45c59ad24}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExpandCollapseProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Expand                  : IntPtr
        Collapse                : IntPtr
        get_ExpandCollapseState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExpandCollapseProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ExpandCollapseState} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Displays all child nodes, controls, or content of the control.
     * @remarks
     * This is a blocking method that returns after the control has been expanded.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand
     */
    Expand() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Hides all child nodes, controls, or content of this element.
     * @remarks
     * This is a blocking method that returns after the element has been collapsed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse
     */
    Collapse() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Indicates the state, expanded or collapsed, of the control.
     * @returns {ExpandCollapseState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-get_expandcollapsestate
     */
    get_ExpandCollapseState() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IExpandCollapseProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Expand := CallbackCreate(GetMethod(implObj, "Expand"), flags, 1)
        this.vtbl.Collapse := CallbackCreate(GetMethod(implObj, "Collapse"), flags, 1)
        this.vtbl.get_ExpandCollapseState := CallbackCreate(GetMethod(implObj, "get_ExpandCollapseState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Expand)
        CallbackFree(this.vtbl.Collapse)
        CallbackFree(this.vtbl.get_ExpandCollapseState)
    }
}
