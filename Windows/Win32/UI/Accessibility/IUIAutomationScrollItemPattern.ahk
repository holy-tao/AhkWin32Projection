#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that enables an item in a scrollable view to be placed in a visible portion of the view.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationscrollitempattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationScrollItemPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationScrollItemPattern
     * @type {Guid}
     */
    static IID := Guid("{b488300f-d015-4f19-9c29-bb595e3645ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationScrollItemPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ScrollIntoView : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationScrollItemPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Scrolls the content area of a container object to display the UI Automation element within the visible region (viewport) of the container.
     * @remarks
     * This method does not provide the ability to specify the position of the element within the viewport.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollitempattern-scrollintoview
     */
    ScrollIntoView() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationScrollItemPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ScrollIntoView := CallbackCreate(GetMethod(implObj, "ScrollIntoView"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ScrollIntoView)
    }
}
