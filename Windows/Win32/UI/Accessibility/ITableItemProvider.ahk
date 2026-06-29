#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to child controls of containers that implement ITableProvider.
 * @remarks
 * This control pattern is analogous to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igriditemprovider">IGridItemProvider</a> with 
 *             the distinction that any control implementing <b>ITableItemProvider</b> 
 *             must expose the relationship between the individual cell and its row and column information.
 *             
 * 
 * Access to individual cell functionality is provided by the concurrent implementation 
 *             of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igriditemprovider">IGridItemProvider</a>. 
 *             
 * 
 * Implemented on a UI Automation provider that must 
 *             support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtableitem">TableItem</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itableitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITableItemProvider extends IUnknown {
    /**
     * The interface identifier for ITableItemProvider
     * @type {Guid}
     */
    static IID := Guid("{b9734fa6-771f-4d78-9c90-2517999349cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITableItemProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRowHeaderItems    : IntPtr
        GetColumnHeaderItems : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITableItemProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a collection of Microsoft UI Automation provider representing all the row headers associated with a table item or cell.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces
     * 				of the row headers. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableitemprovider-getrowheaderitems
     */
    GetRowHeaderItems() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a collection of Microsoft UI Automation provider representing all the column headers associated with a table item or cell.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces of
     * 				the column headers. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableitemprovider-getcolumnheaderitems
     */
    GetColumnHeaderItems() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (ITableItemProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRowHeaderItems := CallbackCreate(GetMethod(implObj, "GetRowHeaderItems"), flags, 2)
        this.vtbl.GetColumnHeaderItems := CallbackCreate(GetMethod(implObj, "GetColumnHeaderItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRowHeaderItems)
        CallbackFree(this.vtbl.GetColumnHeaderItems)
    }
}
