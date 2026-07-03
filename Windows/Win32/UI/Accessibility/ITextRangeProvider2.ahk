#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextRangeProvider.ahk" { ITextRangeProvider }

/**
 * Extends the ITextRangeProvider interface to enable Microsoft UI Automation providers to invoke context menus.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITextRangeProvider2 extends ITextRangeProvider {
    /**
     * The interface identifier for ITextRangeProvider2
     * @type {Guid}
     */
    static IID := Guid("{9bbce42c-1921-4f18-89ca-dba1910a0386}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextRangeProvider2 interfaces
    */
    struct Vtbl extends ITextRangeProvider.Vtbl {
        ShowContextMenu : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextRangeProvider2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Programmatically invokes a context menu on the target element. (ITextRangeProvider2.ShowContextMenu)
     * @remarks
     * This method should return an error code if the context menu could not be invoked.
     * 
     * <b>ShowContextMenu</b> should always show the context menu at the beginning end point of the range.  This should be equivalent to what would happen if the user pressed the context menu key or SHIFT + F10 with the insertion point at the beginning of the range.
     * 
     * If showing the context menu would typically result in the insertion point moving to a given location, then it should do so for programmatically invoking <b>ShowContextMenu</b> for Microsoft UI Automation support also.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextRangeProvider2.IID.Equals(iid)) {
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
