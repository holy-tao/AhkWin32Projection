#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NavigateDirection.ahk" { NavigateDirection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes a method to support access by a Microsoft UI Automation client to controls that support a custom navigation order.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationcustomnavigationpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationCustomNavigationPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationCustomNavigationPattern
     * @type {Guid}
     */
    static IID := Guid("{01ea217a-1766-47ed-a6cc-acf492854b1f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationCustomNavigationPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Navigate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationCustomNavigationPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next element in the specified direction within the logical UI tree.
     * @param {NavigateDirection} _direction 
     * @returns {IUIAutomationElement} The next element as specified by the <i>direction</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcustomnavigationpattern-navigate
     */
    Navigate(_direction) {
        result := ComCall(3, this, NavigateDirection, _direction, "ptr*", &pRetVal := 0, "HRESULT")
        return IUIAutomationElement(pRetVal)
    }

    Query(iid) {
        if (IUIAutomationCustomNavigationPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Navigate)
    }
}
