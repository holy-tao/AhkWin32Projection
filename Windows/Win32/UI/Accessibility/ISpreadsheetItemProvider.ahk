#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to information about an item (cell) in a spreadsheet.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-ispreadsheetitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ISpreadsheetItemProvider extends IUnknown {
    /**
     * The interface identifier for ISpreadsheetItemProvider
     * @type {Guid}
     */
    static IID := Guid("{eaed4660-7b3d-4879-a2e6-365ce603f3d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpreadsheetItemProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Formula          : IntPtr
        GetAnnotationObjects : IntPtr
        GetAnnotationTypes   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpreadsheetItemProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Formula {
        get => this.get_Formula()
    }

    /**
     * Specifies the formula for this spreadsheet cell.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-get_formula
     */
    get_Formula() {
        pRetVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of objects that represent the annotations associated with this spreadsheet cell.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces that represent the annotations associated with the spreadsheet cell.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-getannotationobjects
     */
    GetAnnotationObjects() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of annotation type identifiers indicating the types of annotations that are associated with this spreadsheet cell. (ISpreadsheetItemProvider.GetAnnotationTypes)
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives an array of annotation type identifiers, one for each type of annotation associated with the spreadsheet cell. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-getannotationtypes
     */
    GetAnnotationTypes() {
        result := ComCall(5, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (ISpreadsheetItemProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Formula := CallbackCreate(GetMethod(implObj, "get_Formula"), flags, 2)
        this.vtbl.GetAnnotationObjects := CallbackCreate(GetMethod(implObj, "GetAnnotationObjects"), flags, 2)
        this.vtbl.GetAnnotationTypes := CallbackCreate(GetMethod(implObj, "GetAnnotationTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Formula)
        CallbackFree(this.vtbl.GetAnnotationObjects)
        CallbackFree(this.vtbl.GetAnnotationTypes)
    }
}
