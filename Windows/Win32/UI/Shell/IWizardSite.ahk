#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Controls\HPROPSHEETPAGE.ahk
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
     * Called when the user navigates backward out of the wizard extension. Gets the handle of the PROPSHEETPAGE that represents the wizard page that is before the wizard extension page.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a variable handle of type <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> that represents the wizard page that comes immediately before the wizard extension page.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwizardsite-getpreviouspage
     */
    GetPreviousPage() {
        phpage := HPROPSHEETPAGE()
        result := ComCall(3, this, "ptr", phpage, "HRESULT")
        return phpage
    }

    /**
     * Called when the user navigates forward past the wizard extension pages. Gets the handle of the PROPSHEETPAGE that represents the wizard page immediately following the wizard extension page.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a handle variable of type <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> for the wizard page following the extension page.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwizardsite-getnextpage
     */
    GetNextPage() {
        phpage := HPROPSHEETPAGE()
        result := ComCall(4, this, "ptr", phpage, "HRESULT")
        return phpage
    }

    /**
     * Called when the user cancels navigation through the wizard extension. Gets the handle of the PROPSHEETPAGE that represents the wizard page to display when the user cancels navigation while in the wizard extension.
     * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE*</b>
     * 
     * A pointer to a handle variable of type <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> that receives the wizard page to display when the user cancels navigation while in the wizard extension.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwizardsite-getcancelledpage
     */
    GetCancelledPage() {
        phpage := HPROPSHEETPAGE()
        result := ComCall(5, this, "ptr", phpage, "HRESULT")
        return phpage
    }
}
