#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to virtualized items, which are items that are represented by placeholder automation elements in the Microsoft UI Automation tree.
 * @remarks
 * A virtualized item is typically an item in a virtual list; that is, a list that does not manage its own data. When an application retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> for a virtualized item by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationitemcontainerpattern-finditembyproperty">FindItemByProperty</a>, UI Automation calls the provider's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iitemcontainerprovider-finditembyproperty">FindItemByProperty</a>, where the provider may return a placeholder element that also implements <b>IVirtualizedItemProvider</b>. On a call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvirtualizeditempattern-realize">Realize</a>, the provider's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize">Realize</a> returns a full UI Automation element reference and may also scroll the item into view.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-ivirtualizeditemprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IVirtualizedItemProvider extends IUnknown {
    /**
     * The interface identifier for IVirtualizedItemProvider
     * @type {Guid}
     */
    static IID := Guid("{cb98b665-2d35-4fac-ad35-f3c60d0c0b8b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVirtualizedItemProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Realize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVirtualizedItemProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Makes the virtual item fully accessible as a UI Automation element. (IVirtualizedItemProvider.Realize)
     * @remarks
     * When an item is obtained from a virtual list, it is only a placeholder. Use this method to convert it to a full reference to UI Automation element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize
     */
    Realize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVirtualizedItemProvider.IID.Equals(iid)) {
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
