#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }

/**
 * Extends the IRawElementProviderSimple interface to enable programmatically invoking context menus.
 * @remarks
 * This interface can be implemented on:
 * 			
 * 
 * <ul>
 * <li>Providers that add or override properties or control patterns on a UI element that already has a provider.</li>
 * </ul>
 *  If no context menu is available directly on the element on which <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple2-showcontextmenu">ShowContextMenu</a>  was invoked, the provider should attempt to invoke a context menu on the UI Automation parent of the current item.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderSimple2 extends IRawElementProviderSimple {
    /**
     * The interface identifier for IRawElementProviderSimple2
     * @type {Guid}
     */
    static IID := Guid("{a0a839a9-8da1-4a82-806a-8e0d44e79f56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderSimple2 interfaces
    */
    struct Vtbl extends IRawElementProviderSimple.Vtbl {
        ShowContextMenu : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderSimple2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Programmatically invokes a context menu on the target element. (IRawElementProviderSimple2.ShowContextMenu)
     * @remarks
     * This method returns an error code if the context menu could not be invoked.
     * 
     *  If no context menu is available directly on the element on which <b>ShowContextMenu</b> was invoked, the provider should attempt to invoke a context menu on the UI Automation parent of the current item.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRawElementProviderSimple2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowContextMenu := CallbackCreate(GetMethod(implObj, "ShowContextMenu"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowContextMenu)
    }
}
