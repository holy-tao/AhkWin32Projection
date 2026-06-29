#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by wizards such as the Web Publishing Wizard and Online Print Ordering Wizard which host server-side content pages. This interface exposes methods to specify supported extension pages and to navigate into and out of those pages.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iwizardextension
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWizardExtension extends IUnknown {
    /**
     * The interface identifier for IWizardExtension
     * @type {Guid}
     */
    static IID := Guid("{c02ea696-86cc-491e-9b23-74394a0444a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWizardExtension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPages     : IntPtr
        GetFirstPage : IntPtr
        GetLastPage  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWizardExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds extension pages to the wizard by filling an array with handles to PROPSHEETPAGE structures representing those pages.
     * @remarks
     * The array of handles pointed to by <i>aPages</i> can contain handles to wizard dialog pages preceding and following the extension pages. The array's pointer should be passed to this method so that its value is the first empty array element, ready to accept the handle of the first extension page, rather than simply the first element. Collaterally, the value passed in <i>cPages</i> should state the number of unused array elements instead of the total number.
     * 
     * For example, if two introductory host pages were added to an array called <b>hpages</b>, then the call to <b>IWizardExtension::AddPages</b> would appear as follows.
     * 
     * 				
     * 
     * 
     * ```
     * @param {Pointer<HPROPSHEETPAGE>} aPages Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> handles that represent the wizard dialog pages. Handles to <b>PROPSHEETPAGE</b> structures for the extension pages are added to this array.
     * @param {Integer} cPages Type: <b>UINT</b>
     * 
     * The count of elements in <i>aPages</i>.
     * @param {Pointer<Integer>} pnPagesAdded Type: <b>UINT*</b>
     * 
     * The count of handles successfully added.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardextension-addpages
     */
    AddPages(aPages, cPages, pnPagesAdded) {
        pnPagesAddedMarshal := pnPagesAdded is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, HPROPSHEETPAGE.Ptr, aPages, "uint", cPages, pnPagesAddedMarshal, pnPagesAdded, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the first page of the wizard extension.
     * @remarks
     * Although the wizard extension may host several sequential HTML pages, if it consists of only one page, the handles returned by <b>IWizardExtension::GetFirstPage</b> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-iwizardextension-getlastpage">IWizardExtension::GetLastPage</a> are the same.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> handle representing the first page of any wizard extension pages.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardextension-getfirstpage
     */
    GetFirstPage() {
        phpage := HPROPSHEETPAGE.Owned()
        result := ComCall(4, this, HPROPSHEETPAGE.Ptr, phpage, "HRESULT")
        return phpage
    }

    /**
     * Gets a handle to the final page of the wizard extension pages.
     * @remarks
     * This value is used to navigate backward into the wizard extension pages when the user clicks the <b>Back</b> button.
     *       
     * 
     * Although the wizard extension may host several sequential HTML pages, if it consists of only one page the handles returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-iwizardextension-getfirstpage">IWizardExtension::GetFirstPage</a> and <b>IWizardExtension::GetLastPage</b> are the same.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> handle representing the wizard extension's final page.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardextension-getlastpage
     */
    GetLastPage() {
        phpage := HPROPSHEETPAGE.Owned()
        result := ComCall(5, this, HPROPSHEETPAGE.Ptr, phpage, "HRESULT")
        return phpage
    }

    Query(iid) {
        if (IWizardExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPages := CallbackCreate(GetMethod(implObj, "AddPages"), flags, 4)
        this.vtbl.GetFirstPage := CallbackCreate(GetMethod(implObj, "GetFirstPage"), flags, 2)
        this.vtbl.GetLastPage := CallbackCreate(GetMethod(implObj, "GetLastPage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPages)
        CallbackFree(this.vtbl.GetFirstPage)
        CallbackFree(this.vtbl.GetLastPage)
    }
}
