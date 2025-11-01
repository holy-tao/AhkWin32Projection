#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used by a wizard extension to navigate the borders between itself and the rest of the wizard.
 * @remarks
 * 
  * When the user backs out or cancels the extension, or when the extension finishes displaying its pages, the extension then communicates to the wizard that it must navigate in and out of the stack of pages.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iwizardsite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWizardSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWizardSite
     * @type {Guid}
     */
    static IID => Guid("{88960f5b-422f-4e7b-8013-73415381c3c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreviousPage", "GetNextPage", "GetCancelledPage"]

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardsite-getpreviouspage
     */
    GetPreviousPage(phpage) {
        result := ComCall(3, this, "ptr", phpage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardsite-getnextpage
     */
    GetNextPage(phpage) {
        result := ComCall(4, this, "ptr", phpage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwizardsite-getcancelledpage
     */
    GetCancelledPage(phpage) {
        result := ComCall(5, this, "ptr", phpage, "HRESULT")
        return result
    }
}
