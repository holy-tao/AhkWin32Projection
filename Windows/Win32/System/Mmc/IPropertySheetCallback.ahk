#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPropertySheetCallback interface is a COM-based interface used by a snap-in to add its property pages to a property sheet.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-ipropertysheetcallback
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IPropertySheetCallback extends IUnknown {
    /**
     * The interface identifier for IPropertySheetCallback
     * @type {Guid}
     */
    static IID := Guid("{85de64dd-ef21-11cf-a285-00c04fd8dbe6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertySheetCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPage    : IntPtr
        RemovePage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertySheetCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IPropertySheetCallback::AddPage method enables a snap-in to add a page to a property sheet.
     * @remarks
     * The snap-in cannot call 
     * AddPage from within a property page handler because the property page is created and runs on a secondary thread. A snap-in cannot call an MMC interface from a different thread than the one in which the snap-in was created. The correct place to call 
     * AddPage is in the snap-in's implementation of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814847(v=vs.85)">IExtendPropertySheet2::CreatePropertyPages</a> method.
     * 
     * If a snap-in uses the 
     * IPropertySheetProvider interface directly, it can use 
     * AddPage to add the primary pages and then call <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> (<b>NULL</b>, <b>FALSE</b>, <b>NULL</b>, [<b>TRUE</b> or <b>FALSE</b>]) so that the provider will add these pages to the property sheet. For more information about how to create your property pages in the snap-in's implementation of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814847(v=vs.85)">IExtendPropertySheet2::CreatePropertyPages</a>, see <b>IPropertySheetProvider::AddPrimaryPages</b>.
     * 
     * Pages are added to the sheet in the order in which they are presented. The primary snap-in's pages are always added first.
     * @param {HPROPSHEETPAGE} hPage A value that specifies the handle to the page to be added. The hPage parameter is a handle to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v3">PROPSHEETPAGE</a> structure created by the Windows API 
     * <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetcallback-addpage
     */
    AddPage(hPage) {
        result := ComCall(3, this, HPROPSHEETPAGE, hPage, "HRESULT")
        return result
    }

    /**
     * The IPropertySheetCallback::RemovePage method enables a snap-in to remove a page from a property sheet.
     * @remarks
     * RemovePage can be used only for pages that the snap-in has added.
     * @param {HPROPSHEETPAGE} hPage A handle to the page to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetcallback-removepage
     */
    RemovePage(hPage) {
        result := ComCall(4, this, HPROPSHEETPAGE, hPage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertySheetCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPage := CallbackCreate(GetMethod(implObj, "AddPage"), flags, 2)
        this.vtbl.RemovePage := CallbackCreate(GetMethod(implObj, "RemovePage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPage)
        CallbackFree(this.vtbl.RemovePage)
    }
}
