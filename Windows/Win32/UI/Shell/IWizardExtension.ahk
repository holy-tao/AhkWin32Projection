#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<HPROPSHEETPAGE>} aPages 
     * @param {Integer} cPages 
     * @param {Pointer<Integer>} pnPagesAdded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardextension-addpages
     */
    AddPages(aPages, cPages, pnPagesAdded) {
        result := ComCall(3, this, "ptr", aPages, "uint", cPages, "uint*", pnPagesAdded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardextension-getfirstpage
     */
    GetFirstPage(phpage) {
        result := ComCall(4, this, "ptr", phpage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardextension-getlastpage
     */
    GetLastPage(phpage) {
        result := ComCall(5, this, "ptr", phpage, "HRESULT")
        return result
    }
}
