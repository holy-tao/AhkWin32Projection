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
     * 
     * @param {Pointer<HPROPSHEETPAGE>} aPages 
     * @param {Integer} cPages 
     * @param {Pointer<UInt32>} pnPagesAdded 
     * @returns {HRESULT} 
     */
    AddPages(aPages, cPages, pnPagesAdded) {
        result := ComCall(3, this, "ptr", aPages, "uint", cPages, "uint*", pnPagesAdded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     */
    GetFirstPage(phpage) {
        result := ComCall(4, this, "ptr", phpage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} phpage 
     * @returns {HRESULT} 
     */
    GetLastPage(phpage) {
        result := ComCall(5, this, "ptr", phpage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
