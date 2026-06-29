#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\RowOrColumnMajor.ahk" { RowOrColumnMajor }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to controls that act as containers for a collection of child elements.
 * @remarks
 * This control pattern is analogous to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igridprovider">IGridProvider</a> with the distinction that any control that implements <b>ITableProvider</b> must also expose a column and/or row header relationship for each child element.
 *             
 * 
 * Controls that implement <b>ITableProvider</b> are also required to  implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igridprovider">IGridProvider</a> so as to expose the inherent grid functionality of a table control.
 *             
 * Implemented on a UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtable">Table</a> control pattern and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggrid">Grid</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itableprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITableProvider extends IUnknown {
    /**
     * The interface identifier for ITableProvider
     * @type {Guid}
     */
    static IID := Guid("{9c860395-97b3-490a-b52a-858cc22af166}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITableProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRowHeaders        : IntPtr
        GetColumnHeaders     : IntPtr
        get_RowOrColumnMajor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITableProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RowOrColumnMajor} 
     */
    RowOrColumnMajor {
        get => this.get_RowOrColumnMajor()
    }

    /**
     * Gets a collection of Microsoft UI Automation providers that represents all the row headers in a table.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces
     * 				of the row headers. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableprovider-getrowheaders
     */
    GetRowHeaders() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Gets a collection of Microsoft UI Automation providers that represents all the column headers in a table.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces
     * 				of the column headers. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableprovider-getcolumnheaders
     */
    GetColumnHeaders() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the primary direction of traversal for the table.
     * @returns {RowOrColumnMajor} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableprovider-get_roworcolumnmajor
     */
    get_RowOrColumnMajor() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (ITableProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRowHeaders := CallbackCreate(GetMethod(implObj, "GetRowHeaders"), flags, 2)
        this.vtbl.GetColumnHeaders := CallbackCreate(GetMethod(implObj, "GetColumnHeaders"), flags, 2)
        this.vtbl.get_RowOrColumnMajor := CallbackCreate(GetMethod(implObj, "get_RowOrColumnMajor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRowHeaders)
        CallbackFree(this.vtbl.GetColumnHeaders)
        CallbackFree(this.vtbl.get_RowOrColumnMajor)
    }
}
