#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Enables a client application to retrieve information about an item (cell) in a spreadsheet.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationspreadsheetitempattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationSpreadsheetItemPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationSpreadsheetItemPattern
     * @type {Guid}
     */
    static IID := Guid("{7d4fb86c-8d34-40e1-8e83-62c15204e335}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationSpreadsheetItemPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_CurrentFormula          : IntPtr
        GetCurrentAnnotationObjects : IntPtr
        GetCurrentAnnotationTypes   : IntPtr
        get_CachedFormula           : IntPtr
        GetCachedAnnotationObjects  : IntPtr
        GetCachedAnnotationTypes    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationSpreadsheetItemPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    CurrentFormula {
        get => this.get_CurrentFormula()
    }

    /**
     * @type {BSTR} 
     */
    CachedFormula {
        get => this.get_CachedFormula()
    }

    /**
     * Retrieves the formula for this cell.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-get_currentformula
     */
    get_CurrentFormula() {
        retVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of elements representing the annotations associated with this spreadsheet cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives the array of annotation elements for this spreadsheet cell.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcurrentannotationobjects
     */
    GetCurrentAnnotationObjects() {
        result := ComCall(4, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves an array of annotation type identifiers indicating the types of annotations that are associated with this spreadsheet cell. (IUIAutomationSpreadsheetItemPattern.GetCurrentAnnotationTypes)
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the array of annotation type identifiers. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcurrentannotationtypes
     */
    GetCurrentAnnotationTypes() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached formula for this cell.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-get_cachedformula
     */
    get_CachedFormula() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of elements representing the annotations associated with this spreadsheet cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives the cached array of annotation elements for this spreadsheet cell.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcachedannotationobjects
     */
    GetCachedAnnotationObjects() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of annotation type identifiers indicating the types of annotations that are associated with this spreadsheet cell.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the cached array of annotation type identifiers. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcachedannotationtypes
     */
    GetCachedAnnotationTypes() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationSpreadsheetItemPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentFormula := CallbackCreate(GetMethod(implObj, "get_CurrentFormula"), flags, 2)
        this.vtbl.GetCurrentAnnotationObjects := CallbackCreate(GetMethod(implObj, "GetCurrentAnnotationObjects"), flags, 2)
        this.vtbl.GetCurrentAnnotationTypes := CallbackCreate(GetMethod(implObj, "GetCurrentAnnotationTypes"), flags, 2)
        this.vtbl.get_CachedFormula := CallbackCreate(GetMethod(implObj, "get_CachedFormula"), flags, 2)
        this.vtbl.GetCachedAnnotationObjects := CallbackCreate(GetMethod(implObj, "GetCachedAnnotationObjects"), flags, 2)
        this.vtbl.GetCachedAnnotationTypes := CallbackCreate(GetMethod(implObj, "GetCachedAnnotationTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentFormula)
        CallbackFree(this.vtbl.GetCurrentAnnotationObjects)
        CallbackFree(this.vtbl.GetCurrentAnnotationTypes)
        CallbackFree(this.vtbl.get_CachedFormula)
        CallbackFree(this.vtbl.GetCachedAnnotationObjects)
        CallbackFree(this.vtbl.GetCachedAnnotationTypes)
    }
}
