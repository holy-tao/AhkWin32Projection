#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods used by a wizard extension to navigate the borders between itself and the rest of the wizard.
 * @remarks
 * When the user backs out or cancels the extension, or when the extension finishes displaying its pages, the extension then communicates to the wizard that it must navigate in and out of the stack of pages.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iwizardsite
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWizardSite extends IUnknown {
    /**
     * The interface identifier for IWizardSite
     * @type {Guid}
     */
    static IID := Guid("{88960f5b-422f-4e7b-8013-73415381c3c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWizardSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPreviousPage  : IntPtr
        GetNextPage      : IntPtr
        GetCancelledPage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWizardSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the user navigates backward out of the wizard extension. Gets the handle of the PROPSHEETPAGE that represents the wizard page that is before the wizard extension page.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a variable handle of type <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> that represents the wizard page that comes immediately before the wizard extension page.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardsite-getpreviouspage
     */
    GetPreviousPage() {
        phpage := HPROPSHEETPAGE.Owned()
        result := ComCall(3, this, HPROPSHEETPAGE.Ptr, phpage, "HRESULT")
        return phpage
    }

    /**
     * Called when the user navigates forward past the wizard extension pages. Gets the handle of the PROPSHEETPAGE that represents the wizard page immediately following the wizard extension page.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a handle variable of type <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> for the wizard page following the extension page.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardsite-getnextpage
     */
    GetNextPage() {
        phpage := HPROPSHEETPAGE.Owned()
        result := ComCall(4, this, HPROPSHEETPAGE.Ptr, phpage, "HRESULT")
        return phpage
    }

    /**
     * Called when the user cancels navigation through the wizard extension. Gets the handle of the PROPSHEETPAGE that represents the wizard page to display when the user cancels navigation while in the wizard extension.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a handle variable of type <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> that receives the wizard page to display when the user cancels navigation while in the wizard extension.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardsite-getcancelledpage
     */
    GetCancelledPage() {
        phpage := HPROPSHEETPAGE.Owned()
        result := ComCall(5, this, HPROPSHEETPAGE.Ptr, phpage, "HRESULT")
        return phpage
    }

    Query(iid) {
        if (IWizardSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPreviousPage := CallbackCreate(GetMethod(implObj, "GetPreviousPage"), flags, 2)
        this.vtbl.GetNextPage := CallbackCreate(GetMethod(implObj, "GetNextPage"), flags, 2)
        this.vtbl.GetCancelledPage := CallbackCreate(GetMethod(implObj, "GetCancelledPage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPreviousPage)
        CallbackFree(this.vtbl.GetNextPage)
        CallbackFree(this.vtbl.GetCancelledPage)
    }
}
