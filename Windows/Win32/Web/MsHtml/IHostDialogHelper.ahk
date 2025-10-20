#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHostDialogHelper extends IUnknown{
    /**
     * The interface identifier for IHostDialogHelper
     * @type {Guid}
     */
    static IID => Guid("{53dec138-a51e-11d2-861e-00c04fa35c89}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<IMoniker>} pMk 
     * @param {Pointer<VARIANT>} pvarArgIn 
     * @param {PWSTR} pchOptions 
     * @param {Pointer<VARIANT>} pvarArgOut 
     * @param {Pointer<IUnknown>} punkHost 
     * @returns {HRESULT} 
     */
    ShowHTMLDialog(hwndParent, pMk, pvarArgIn, pchOptions, pvarArgOut, punkHost) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pchOptions := pchOptions is String ? StrPtr(pchOptions) : pchOptions

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pMk, "ptr", pvarArgIn, "ptr", pchOptions, "ptr", pvarArgOut, "ptr", punkHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
