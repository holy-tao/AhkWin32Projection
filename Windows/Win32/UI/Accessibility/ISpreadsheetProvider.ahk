#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to items (cells) in a spreadsheet.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-ispreadsheetprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ISpreadsheetProvider extends IUnknown {
    /**
     * The interface identifier for ISpreadsheetProvider
     * @type {Guid}
     */
    static IID := Guid("{6f6b5d35-5525-4f80-b758-85473832ffc7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpreadsheetProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemByName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpreadsheetProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Exposes a UI Automation element that represents the spreadsheet cell that has the specified name.
     * @remarks
     * A spreadsheet cell typically has a name such as “c5” or “a15”.  A name can also apply to a range of cells.
     * @param {PWSTR} name Type: <b>LPCWSTR</b>
     * 
     * The name of the target cell.
     * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives the element that represents the target cell.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetprovider-getitembyname
     */
    GetItemByName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    Query(iid) {
        if (ISpreadsheetProvider.IID.Equals(iid)) {
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
