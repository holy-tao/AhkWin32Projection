#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a virtualized item, which is an item that is represented by a placeholder automation element in the Microsoft UI Automation tree.
 * @remarks
 * A virtualized item can be an item retrieved from a control that supports the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingitemcontainer">ItemContainer</a> control pattern, or a virtualized embedded object retrieved from a control that supports the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-about-text-and-textrange-patterns">Text</a> control pattern.
 * 
 * The placeholder automation element for a virtualized item might not have loaded data for all UI Automation properties, and may return <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-error-codes">UIA_E_ELEMENTNOTAVAILABLE</a> in response to queries for properties that are not available.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationvirtualizeditempattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationVirtualizedItemPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationVirtualizedItemPattern
     * @type {Guid}
     */
    static IID := Guid("{6ba3d7a6-04cf-4f11-8793-a8d1cde9969f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationVirtualizedItemPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Realize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationVirtualizedItemPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a full UI Automation element for a virtualized item.
     * @remarks
     * A virtualized item is represented by a placeholder automation element in the UI Automation tree. The <b>Realize</b> method causes the provider to make full information available for the item so that a full UI Automation element can be created for the item.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvirtualizeditempattern-realize
     */
    Realize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationVirtualizedItemPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Realize := CallbackCreate(GetMethod(implObj, "Realize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Realize)
    }
}
