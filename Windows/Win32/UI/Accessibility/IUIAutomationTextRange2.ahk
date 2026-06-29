#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationTextRange.ahk" { IUIAutomationTextRange }

/**
 * Extends the IUIAutomationTextRange interface to enable Microsoft UI Automation clients to programmatically invoke context menus.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextRange2 extends IUIAutomationTextRange {
    /**
     * The interface identifier for IUIAutomationTextRange2
     * @type {Guid}
     */
    static IID := Guid("{bb9b40e0-5e04-46bd-9be0-4b601b9afad4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextRange2 interfaces
    */
    struct Vtbl extends IUIAutomationTextRange.Vtbl {
        ShowContextMenu : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextRange2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Programmatically invokes a context menu on the target text range.
     * @remarks
     * This method returns an error code if the context menu could not be invoked. If no context menu is available directly on the text range on which it was invoked, the Microsoft UI Automation system might attempt to invoke a context menu on the UI Automation parent of the current item.
     * 
     * The context menus themselves fire menu opened / closed events when they are invoked and dismissed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationTextRange2.IID.Equals(iid)) {
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
