#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Enables a client application to access the items (cells) in a spreadsheet.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationspreadsheetpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationSpreadsheetPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationSpreadsheetPattern
     * @type {Guid}
     */
    static IID := Guid("{7517a7c8-faae-4de9-9f08-29b91e8595c1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationSpreadsheetPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemByName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationSpreadsheetPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a UI Automation element that represents the spreadsheet cell that has the specified name.
     * @param {BSTR} name Type: <b>BSTR</b>
     * 
     * The name of the target cell.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives the element that represents the target cell.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetpattern-getitembyname
     */
    GetItemByName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(3, this, BSTR, name, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    Query(iid) {
        if (IUIAutomationSpreadsheetPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemByName := CallbackCreate(GetMethod(implObj, "GetItemByName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemByName)
    }
}
