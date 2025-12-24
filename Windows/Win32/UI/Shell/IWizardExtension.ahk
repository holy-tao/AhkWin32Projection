#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Controls\HPROPSHEETPAGE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by wizards such as the Web Publishing Wizard and Online Print Ordering Wizard which host server-side content pages. This interface exposes methods to specify supported extension pages and to navigate into and out of those pages.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iwizardextension
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWizardExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWizardExtension
     * @type {Guid}
     */
    static IID => Guid("{c02ea696-86cc-491e-9b23-74394a0444a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPages", "GetFirstPage", "GetLastPage"]

    /**
     * Adds extension pages to the wizard by filling an array with handles to PROPSHEETPAGE structures representing those pages.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwizardextension-addpages
     */
    AddPages(aPages, cPages, pnPagesAdded) {
        pnPagesAddedMarshal := pnPagesAdded is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", aPages, "uint", cPages, pnPagesAddedMarshal, pnPagesAdded, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the first page of the wizard extension.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> handle representing the first page of any wizard extension pages.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwizardextension-getfirstpage
     */
    GetFirstPage() {
        phpage := HPROPSHEETPAGE()
        result := ComCall(4, this, "ptr", phpage, "HRESULT")
        return phpage
    }

    /**
     * Gets a handle to the final page of the wizard extension pages.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> handle representing the wizard extension's final page.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwizardextension-getlastpage
     */
    GetLastPage() {
        phpage := HPROPSHEETPAGE()
        result := ComCall(5, this, "ptr", phpage, "HRESULT")
        return phpage
    }
}
